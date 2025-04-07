import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:math';
import 'data/questions.dart';
import 'widgets/score_card.dart';
import 'widgets/question_card.dart';

void main() {
  runApp(const MyApp());
}

class QuestionProvider with ChangeNotifier {
  final List<Question> _questions = [];
  final List<bool> _answeredQuestions = [];
  final List<String?> _answers = [];
  final Set<int> _usedQuestionIndices = {};
  final _random = Random();
  int _userScore = 0;
  int _aiScore = 0;
  String? _currentAnswer;
  bool _isAnswered = false;
  
  List<Question> get questions => _questions;
  List<bool> get answeredQuestions => _answeredQuestions;
  List<String?> get answers => _answers;
  int get userScore => _userScore;
  int get aiScore => _aiScore;
  String? get currentAnswer => _currentAnswer;
  bool get isAnswered => _isAnswered;

  QuestionProvider() {
    // Start with a question immediately
    addQuestion();
  }

  int _getRandomUnusedQuestionIndex() {
    if (_usedQuestionIndices.length >= questionsList.length) {
      // If all questions have been used, reset the used questions set
      _usedQuestionIndices.clear();
    }
    
    int index;
    do {
      index = _random.nextInt(questionsList.length);
    } while (_usedQuestionIndices.contains(index));
    
    _usedQuestionIndices.add(index);
    return index;
  }

  void addQuestion() {
    _currentAnswer = null;
    _isAnswered = false;
    _questions.insert(0, questionsList[_getRandomUnusedQuestionIndex()]);
    _answeredQuestions.insert(0, false);
    _answers.insert(0, null);
    notifyListeners();
  }

  void submitAnswer(String answer) {
    if (_questions.isEmpty || _isAnswered) return;
    
    _currentAnswer = answer;
    _isAnswered = true;
    _answeredQuestions[0] = true;
    _answers[0] = answer;
    
    if (answer.toLowerCase().trim() == _questions[0].answer.toLowerCase().trim()) {
      _userScore++;
    } else {
      _aiScore++;
    }
    
    // Automatically show next question after a delay
    Future.delayed(const Duration(seconds: 2), () {
      addQuestion();
    });
    
    notifyListeners();
  }

  void clear() {
    _questions.clear();
    _answeredQuestions.clear();
    _answers.clear();
    _usedQuestionIndices.clear();
    _userScore = 0;
    _aiScore = 0;
    _currentAnswer = null;
    _isAnswered = false;
    addQuestion(); // Start with a new question immediately
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => QuestionProvider(),
      child: MaterialApp(
        title: 'Quiz Battle',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.blue,
            brightness: Brightness.light,
          ),
          cardTheme: const CardTheme(
            elevation: 2,
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          ),
        ),
        home: const HomeScreen(),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz Battle'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => context.read<QuestionProvider>().clear(),
            tooltip: 'Reset Scores',
          ),
        ],
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return LayoutBuilder(
            builder: (context, constraints) {
              // Get screen dimensions
              final width = constraints.maxWidth;
              final height = constraints.maxHeight;
              
              // Determine screen size categories
              final isSmallScreen = width < 600;
              final isMediumScreen = width >= 600 && width < 900;
              final isLargeScreen = width >= 900;
              
              // Calculate padding based on screen size
              final double horizontalPadding = isSmallScreen ? 8.0 : (isMediumScreen ? 16.0 : 24.0);
              final double verticalPadding = isSmallScreen ? 8.0 : (isMediumScreen ? 16.0 : 24.0);
              
              return Column(
                children: [
                  // Score section
                  Container(
                    padding: EdgeInsets.all(verticalPadding),
                    color: Theme.of(context).colorScheme.primaryContainer,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ScoreCard(
                          title: 'You',
                          score: context.watch<QuestionProvider>().userScore,
                          color: Colors.green,
                          isSmallScreen: isSmallScreen,
                          isLargeScreen: isLargeScreen,
                        ),
                        ScoreCard(
                          title: 'AI KILLA MACHINE',
                          score: context.watch<QuestionProvider>().aiScore,
                          color: Colors.red,
                          isSmallScreen: isSmallScreen,
                          isLargeScreen: isLargeScreen,
                        ),
                      ],
                    ),
                  ),
                  
                  // Question section
                  Expanded(
                    child: Consumer<QuestionProvider>(
                      builder: (context, provider, _) {
                        if (provider.questions.isEmpty) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }

                        // For landscape mode on larger screens, use a grid layout
                        if (orientation == Orientation.landscape && isLargeScreen) {
                          return GridView.builder(
                            padding: EdgeInsets.all(horizontalPadding),
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: (width / 500).floor().clamp(2, 3),
                              childAspectRatio: 1.5,
                              crossAxisSpacing: horizontalPadding,
                              mainAxisSpacing: verticalPadding,
                            ),
                            itemCount: provider.questions.length,
                            itemBuilder: (context, index) {
                              final question = provider.questions[index];
                              return QuestionCard(
                                question: question,
                                userAnswer: provider.answers[index],
                                isAnswered: provider.answeredQuestions[index],
                                isCurrentQuestion: index == 0,
                                isSmallScreen: isSmallScreen,
                                isLargeScreen: isLargeScreen,
                              );
                            },
                          );
                        }

                        // For portrait mode or smaller screens, use a list layout
                        return ListView.builder(
                          padding: EdgeInsets.symmetric(
                            horizontal: horizontalPadding,
                            vertical: verticalPadding / 2,
                          ),
                          itemCount: provider.questions.length,
                          itemBuilder: (context, index) {
                            final question = provider.questions[index];
                            return QuestionCard(
                              question: question,
                              userAnswer: provider.answers[index],
                              isAnswered: provider.answeredQuestions[index],
                              isCurrentQuestion: index == 0,
                              isSmallScreen: isSmallScreen,
                              isLargeScreen: isLargeScreen,
                            );
                          },
                        );
                      },
                    ),
                  ),
                  
                  // Answer input section
                  if (!context.watch<QuestionProvider>().isAnswered)
                    Padding(
                      padding: EdgeInsets.all(horizontalPadding),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Type your answer...',
                          border: const OutlineInputBorder(),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: isSmallScreen ? 12 : 16,
                            vertical: isSmallScreen ? 12 : 16,
                          ),
                        ),
                        style: TextStyle(
                          fontSize: isSmallScreen ? 14 : (isMediumScreen ? 16 : 18),
                        ),
                        onSubmitted: (value) => context.read<QuestionProvider>().submitAnswer(value),
                        autofocus: true,
                      ),
                    ),
                ],
              );
            },
          );
        },
      ),
    );
  }
} 