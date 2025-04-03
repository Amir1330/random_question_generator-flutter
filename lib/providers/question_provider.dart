import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'dart:math';

class Question {
  final String text;
  final String correctAnswer;
  final DateTime timestamp;
  String? userAnswer;
  bool isAnswered;

  Question({
    required this.text,
    required this.correctAnswer,
    required this.timestamp,
    this.userAnswer,
    this.isAnswered = false,
  });

  Map<String, dynamic> toJson() => {
        'text': text,
        'correctAnswer': correctAnswer,
        'timestamp': timestamp.toIso8601String(),
        'userAnswer': userAnswer,
        'isAnswered': isAnswered,
      };

  factory Question.fromJson(Map<String, dynamic> json) => Question(
        text: json['text'],
        correctAnswer: json['correctAnswer'],
        timestamp: DateTime.parse(json['timestamp']),
        userAnswer: json['userAnswer'],
        isAnswered: json['isAnswered'] ?? false,
      );
}

class QuestionProvider with ChangeNotifier {
  final List<Question> _questions = [];
  bool _isLoading = false;
  DateTime? _lastGenerationTime;
  static const _cooldownDuration = Duration(seconds: 1);
  final _random = Random();

  // Local question bank with various categories
  final List<Map<String, String>> _questionBank = [
    // General Knowledge
    {'question': 'What is the capital of France?', 'answer': 'Paris'},
    {'question': 'Which planet is known as the Red Planet?', 'answer': 'Mars'},
    {'question': 'What is the largest mammal in the world?', 'answer': 'Blue Whale'},
    {'question': 'Who painted the Mona Lisa?', 'answer': 'Leonardo da Vinci'},
    {'question': 'What is the chemical symbol for gold?', 'answer': 'Au'},
    
    // Science
    {'question': 'What is the chemical symbol for water?', 'answer': 'H2O'},
    {'question': 'What is the hardest natural substance?', 'answer': 'Diamond'},
    {'question': 'What is the speed of light?', 'answer': '299,792 kilometers per second'},
    {'question': 'What is the atomic number of carbon?', 'answer': '6'},
    {'question': 'What is the process by which plants make their food?', 'answer': 'Photosynthesis'},
    
    // History
    {'question': 'Who was the first President of the United States?', 'answer': 'George Washington'},
    {'question': 'In which year did World War II end?', 'answer': '1945'},
    {'question': 'Who was the first Emperor of China?', 'answer': 'Qin Shi Huang'},
    {'question': 'What was the first civilization in Mesopotamia?', 'answer': 'Sumer'},
    {'question': 'Who built the Great Wall of China?', 'answer': 'Qin Shi Huang'},
    
    // Geography
    {'question': 'What is the largest ocean on Earth?', 'answer': 'Pacific Ocean'},
    {'question': 'Which country has the largest population?', 'answer': 'China'},
    {'question': 'What is the capital of Japan?', 'answer': 'Tokyo'},
    {'question': 'Which is the largest continent?', 'answer': 'Asia'},
    {'question': 'What is the longest river in the world?', 'answer': 'Nile'},
    
    // Technology
    {'question': 'Who is the founder of Microsoft?', 'answer': 'Bill Gates'},
    {'question': 'What does CPU stand for?', 'answer': 'Central Processing Unit'},
    {'question': 'Who invented the World Wide Web?', 'answer': 'Tim Berners-Lee'},
    {'question': 'What is the binary number system based on?', 'answer': '2'},
    {'question': 'What does HTML stand for?', 'answer': 'HyperText Markup Language'},
    
    // Sports
    {'question': 'Which sport is known as "The Beautiful Game"?', 'answer': 'Football'},
    {'question': 'How many players are there in a basketball team on court?', 'answer': '5'},
    {'question': 'Who won the first FIFA World Cup?', 'answer': 'Uruguay'},
    {'question': 'What is the national sport of Japan?', 'answer': 'Sumo'},
    {'question': 'Which country invented table tennis?', 'answer': 'England'},
    
    // Arts and Culture
    {'question': 'Who wrote "Romeo and Juliet"?', 'answer': 'William Shakespeare'},
    {'question': 'Who composed the "Symphony No. 5"?', 'answer': 'Beethoven'},
    {'question': 'What is the Mona Lisa painted on?', 'answer': 'Wood panel'},
    {'question': 'Who painted "The Starry Night"?', 'answer': 'Vincent van Gogh'},
    {'question': 'What is the main instrument in a string quartet?', 'answer': 'Violin'},
    
    // Food and Drink
    {'question': 'Which country invented pizza?', 'answer': 'Italy'},
    {'question': 'What is the main ingredient in guacamole?', 'answer': 'Avocado'},
    {'question': 'Which country produces the most coffee?', 'answer': 'Brazil'},
    {'question': 'What is sushi wrapped in?', 'answer': 'Seaweed'},
    {'question': 'Which country invented tea?', 'answer': 'China'},
  ];

  List<Question> get questions => _questions;
  bool get isLoading => _isLoading;
  bool get canGenerate =>
      _lastGenerationTime == null ||
      DateTime.now().difference(_lastGenerationTime!) >= _cooldownDuration;

  int userScore = 0;
  int aiScore = 0;

  Future<void> generateQuestion() async {
    if (!canGenerate) {
      throw Exception('Please wait before generating another question');
    }

    _isLoading = true;
    notifyListeners();

    try {
      // Get a random question from the bank
      final randomQuestion = _questionBank[_random.nextInt(_questionBank.length)];
      
      final question = Question(
        text: randomQuestion['question']!,
        correctAnswer: randomQuestion['answer']!,
        timestamp: DateTime.now(),
      );

      _questions.insert(0, question);
      _lastGenerationTime = DateTime.now();
      await _saveQuestions();
    } catch (e) {
      debugPrint('Error generating question: $e');
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void submitAnswer(Question question, String answer) {
    final index = _questions.indexWhere((q) => q.text == question.text);
    if (index != -1 && !question.isAnswered) {
      final updatedQuestion = Question(
        text: question.text,
        correctAnswer: question.correctAnswer,
        timestamp: question.timestamp,
        userAnswer: answer,
        isAnswered: true,
      );
      _questions[index] = updatedQuestion;

      // Update scores
      if (answer.toLowerCase().trim() == question.correctAnswer.toLowerCase().trim()) {
        userScore++;
      } else {
        aiScore++;
      }

      _saveQuestions();
      notifyListeners();
    }
  }

  Future<void> clearHistory() async {
    _questions.clear();
    userScore = 0;
    aiScore = 0;
    await _saveQuestions();
    notifyListeners();
  }

  Future<void> _saveQuestions() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final questionsJson = _questions.map((q) => q.toJson()).toList();
      await prefs.setString('saved_questions', jsonEncode(questionsJson));
      await prefs.setInt('user_score', userScore);
      await prefs.setInt('ai_score', aiScore);
    } catch (e) {
      debugPrint('Error saving questions: $e');
    }
  }

  Future<void> loadQuestions() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final questionsJson = prefs.getString('saved_questions');
      if (questionsJson != null) {
        try {
          final List<dynamic> decoded = jsonDecode(questionsJson);
          _questions.clear();
          _questions.addAll(decoded.map((json) => Question.fromJson(json)));
          userScore = prefs.getInt('user_score') ?? 0;
          aiScore = prefs.getInt('ai_score') ?? 0;
        } catch (e) {
          debugPrint('Error parsing saved questions: $e');
          await prefs.remove('saved_questions');
          _questions.clear();
          userScore = 0;
          aiScore = 0;
        }
      }
    } catch (e) {
      debugPrint('Error loading questions: $e');
    }
  }
} 