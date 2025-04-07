import 'package:flutter/material.dart';
import '../data/questions.dart';

class QuestionCard extends StatelessWidget {
  final Question question;
  final String? userAnswer;
  final bool isAnswered;
  final bool isCurrentQuestion;
  final bool isSmallScreen;
  final bool isLargeScreen;

  const QuestionCard({
    super.key,
    required this.question,
    this.userAnswer,
    this.isAnswered = false,
    this.isCurrentQuestion = false,
    this.isSmallScreen = false,
    this.isLargeScreen = false,
  });

  @override
  Widget build(BuildContext context) {
    final bool isCorrect = userAnswer != null && 
        userAnswer!.toLowerCase().trim() == question.answer.toLowerCase().trim();
    
    // Calculate padding based on screen size
    final double cardPadding = isSmallScreen ? 12.0 : (isLargeScreen ? 24.0 : 16.0);
    final double answerPadding = isSmallScreen ? 8.0 : (isLargeScreen ? 16.0 : 12.0);
    
    // Calculate text sizes based on screen size
    final double questionTextSize = isSmallScreen ? 16.0 : (isLargeScreen ? 20.0 : 18.0);
    final double answerTextSize = isSmallScreen ? 14.0 : (isLargeScreen ? 18.0 : 16.0);
    
    return Card(
      elevation: isCurrentQuestion ? 4 : 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: isCurrentQuestion
            ? BorderSide(
                color: Theme.of(context).colorScheme.primary,
                width: 2,
              )
            : BorderSide.none,
      ),
      color: isAnswered && !isCurrentQuestion
          ? (isCorrect ? Colors.green.withOpacity(0.15) : Colors.red.withOpacity(0.15))
          : (isCurrentQuestion
              ? Theme.of(context).colorScheme.primaryContainer.withOpacity(0.3)
              : null),
      child: Padding(
        padding: EdgeInsets.all(cardPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              question.text,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: questionTextSize,
              ),
            ),
            if (isAnswered && userAnswer != null) ...[
              SizedBox(height: isSmallScreen ? 8 : 16),
              Container(
                padding: EdgeInsets.all(answerPadding),
                decoration: BoxDecoration(
                  color: isCorrect
                      ? Colors.green.withOpacity(0.1)
                      : Colors.red.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Your answer: $userAnswer',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontSize: answerTextSize,
                      ),
                    ),
                    SizedBox(height: isSmallScreen ? 4 : 8),
                    Text(
                      'Correct answer: ${question.answer}',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: answerTextSize,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
} 