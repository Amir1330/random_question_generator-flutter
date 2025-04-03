import 'package:flutter/material.dart';
import '../providers/question_provider.dart';

class QuestionCard extends StatelessWidget {
  final Question question;

  const QuestionCard({
    super.key,
    required this.question,
  });

  @override
  Widget build(BuildContext context) {
    final isUser = question.userAnswer != null;
    final isCorrect = question.userAnswer != null &&
        question.userAnswer!.toLowerCase().trim() == question.correctAnswer.toLowerCase().trim();

    return Row(
      mainAxisAlignment: isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (!isUser) ...[
          CircleAvatar(
            backgroundColor: Theme.of(context).colorScheme.primary,
            child: const Icon(Icons.psychology, color: Colors.white),
          ),
        ],
        const SizedBox(width: 8),
        Flexible(
          child: Column(
            crossAxisAlignment: isUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                decoration: BoxDecoration(
                  color: isUser
                      ? (isCorrect
                          ? Colors.green.withOpacity(0.2)
                          : Colors.red.withOpacity(0.2))
                      : Theme.of(context).colorScheme.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(16),
                    topRight: const Radius.circular(16),
                    bottomLeft: Radius.circular(isUser ? 16 : 4),
                    bottomRight: Radius.circular(isUser ? 4 : 16),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      question.text,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    if (question.userAnswer != null) ...[
                      const SizedBox(height: 8),
                      Text(
                        'Your answer: ${question.userAnswer}',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: isCorrect ? Colors.green : Colors.red,
                            ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Correct answer: ${question.correctAnswer}',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Colors.grey[600],
                            ),
                      ),
                    ],
                  ],
                ),
              ),
              const SizedBox(height: 4),
              Text(
                _formatTime(question.timestamp),
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.grey[600],
                    ),
              ),
            ],
          ),
        ),
        if (isUser) ...[
          const SizedBox(width: 8),
          CircleAvatar(
            backgroundColor: Theme.of(context).colorScheme.secondary,
            child: const Icon(Icons.person, color: Colors.white),
          ),
        ],
      ],
    );
  }

  String _formatTime(DateTime time) {
    final now = DateTime.now();
    final difference = now.difference(time);

    if (difference.inDays > 0) {
      return '${difference.inDays}d ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours}h ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes}m ago';
    } else {
      return 'Just now';
    }
  }
} 