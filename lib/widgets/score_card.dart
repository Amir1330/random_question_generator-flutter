import 'package:flutter/material.dart';

class ScoreCard extends StatelessWidget {
  final String title;
  final int score;
  final Color color;
  final bool isSmallScreen;
  final bool isLargeScreen;

  const ScoreCard({
    super.key,
    required this.title,
    required this.score,
    required this.color,
    this.isSmallScreen = false,
    this.isLargeScreen = false,
  });

  @override
  Widget build(BuildContext context) {
    // Calculate padding based on screen size
    final double horizontalPadding = isSmallScreen ? 12.0 : (isLargeScreen ? 32.0 : 24.0);
    final double verticalPadding = isSmallScreen ? 8.0 : (isLargeScreen ? 24.0 : 16.0);
    
    // Calculate text sizes based on screen size
    final double titleSize = isSmallScreen ? 14.0 : (isLargeScreen ? 18.0 : 16.0);
    final double scoreSize = isSmallScreen ? 24.0 : (isLargeScreen ? 36.0 : 30.0);
    
    return Card(
      color: color.withOpacity(0.1),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding,
          vertical: verticalPadding,
        ),
        child: Column(
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: color,
                fontWeight: FontWeight.bold,
                fontSize: titleSize,
              ),
            ),
            SizedBox(height: isSmallScreen ? 4 : 8),
            Text(
              score.toString(),
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: color,
                fontWeight: FontWeight.bold,
                fontSize: scoreSize,
              ),
            ),
          ],
        ),
      ),
    );
  }
} 