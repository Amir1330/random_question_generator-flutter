import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/question_provider.dart';
import '../widgets/question_card.dart';
import 'settings_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _answerController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<QuestionProvider>().loadQuestions();
      _scrollToBottom();
    });
  }

  @override
  void dispose() {
    _answerController.dispose();
    _scrollController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  Future<void> _generateQuestion() async {
    try {
      await context.read<QuestionProvider>().generateQuestion();
      _scrollToBottom();
      // Focus the text field after generating a question
      _focusNode.requestFocus();
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(e.toString()),
            action: e.toString().contains('token') ? SnackBarAction(
              label: 'Set Up Token',
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsScreen()),
              ),
            ) : null,
          ),
        );
      }
    }
  }

  void _submitAnswer() {
    if (_answerController.text.isNotEmpty) {
      final provider = context.read<QuestionProvider>();
      if (provider.questions.isNotEmpty) {
        final currentQuestion = provider.questions.first;
        if (!currentQuestion.isAnswered) {
          provider.submitAnswer(currentQuestion, _answerController.text);
          _answerController.clear();
          _scrollToBottom();
          // Keep the keyboard open
          _focusNode.requestFocus();
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz Chat'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SettingsScreen()),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => context.read<QuestionProvider>().clearHistory(),
          ),
        ],
      ),
      body: Column(
        children: [
          _buildScoreBoard(),
          Expanded(
            child: Consumer<QuestionProvider>(
              builder: (context, provider, child) {
                if (provider.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (provider.questions.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.question_mark,
                          size: 64,
                          color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'No questions yet',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Tap the button below to get a question',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  );
                }

                return ListView.builder(
                  controller: _scrollController,
                  padding: const EdgeInsets.all(16),
                  itemCount: provider.questions.length,
                  reverse: true, // Show newest messages at the bottom
                  itemBuilder: (context, index) {
                    final question = provider.questions[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: QuestionCard(question: question),
                    );
                  },
                );
              },
            ),
          ),
          _buildAnswerInput(),
        ],
      ),
      floatingActionButton: Consumer<QuestionProvider>(
        builder: (context, provider, child) {
          final hasUnansweredQuestion = provider.questions.isNotEmpty && 
              !provider.questions.first.isAnswered;
          
          return FloatingActionButton(
            onPressed: hasUnansweredQuestion ? _submitAnswer : _generateQuestion,
            child: Icon(hasUnansweredQuestion ? Icons.send : Icons.add),
          );
        },
      ),
    );
  }

  Widget _buildScoreBoard() {
    return Consumer<QuestionProvider>(
      builder: (context, provider, child) {
        return Container(
          padding: const EdgeInsets.all(16),
          color: Theme.of(context).colorScheme.surfaceVariant,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildScoreItem(
                'You',
                provider.userScore,
                Icons.person,
                Colors.blue,
              ),
              _buildScoreItem(
                'AI',
                provider.aiScore,
                Icons.psychology,
                Colors.red,
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildScoreItem(String label, int score, IconData icon, Color color) {
    return Column(
      children: [
        Icon(icon, color: color),
        const SizedBox(height: 4),
        Text(
          label,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Text(
          score.toString(),
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: color,
                fontWeight: FontWeight.bold,
              ),
        ),
      ],
    );
  }

  Widget _buildAnswerInput() {
    return Consumer<QuestionProvider>(
      builder: (context, provider, child) {
        final hasUnansweredQuestion = provider.questions.isNotEmpty && 
            !provider.questions.first.isAnswered;
        
        return Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 4,
                offset: const Offset(0, -2),
              ),
            ],
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _answerController,
                  focusNode: _focusNode,
                  decoration: const InputDecoration(
                    hintText: 'Type your answer...',
                    border: OutlineInputBorder(),
                  ),
                  onSubmitted: (_) => _submitAnswer(),
                  enabled: hasUnansweredQuestion,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
} 