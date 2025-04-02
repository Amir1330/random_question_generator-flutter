import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/question_provider.dart';

class QuestionGenerator extends StatelessWidget {
  const QuestionGenerator({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<QuestionProvider>(
      builder: (context, questionProvider, child) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (questionProvider.isLoading)
              const CircularProgressIndicator()
            else
              ElevatedButton.icon(
                onPressed: () async {
                  try {
                    await questionProvider.generateQuestion();
                  } catch (e) {
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            e.toString().replaceAll('Exception: ', ''),
                            style: const TextStyle(color: Colors.white),
                          ),
                          backgroundColor: Colors.red,
                          duration: const Duration(seconds: 5),
                          action: SnackBarAction(
                            label: 'Dismiss',
                            textColor: Colors.white,
                            onPressed: () {
                              ScaffoldMessenger.of(context).hideCurrentSnackBar();
                            },
                          ),
                        ),
                      );
                    }
                  }
                },
                icon: const Icon(Icons.refresh),
                label: Text(
                  questionProvider.canGenerate
                      ? 'Generate Question'
                      : 'Please wait...',
                ),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                ),
              ),
            if (!questionProvider.canGenerate) ...[
              const SizedBox(height: 8),
              Text(
                'Wait ${5 - DateTime.now().difference(questionProvider._lastGenerationTime!).inSeconds}s',
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                ),
              ),
            ],
          ],
        );
      },
    );
  }
} 