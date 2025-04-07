import 'package:flutter/material.dart';
import '../data/questions.dart';

class QuestionCard extends StatelessWidget {
  final Question question;
  final String? userAnswer;
  final bool isAnswered;
  final bool isCurrentQuestion;

  const QuestionCard({
    super.key,
    required this.question,
    this.userAnswer,
    this.isAnswered = false,
    this.isCurrentQuestion = false,
  });

  @override
  Widget build(BuildContext context) {
    final bool isCorrect = userAnswer != null && 
        userAnswer!.toLowerCase().trim() == question.answer.toLowerCase().trim();
    
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
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              question.text,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            if (isAnswered && userAnswer != null) ...[
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(12),
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
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Correct answer: ${question.answer}',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Theme.of(context).colorScheme.primary,
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