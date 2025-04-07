# Quiz Battle

A Flutter-based quiz game where you compete against the "AI KILLA MACHINE" by answering questions correctly.

## Features

- **Competitive Gameplay**: Battle against the AI by answering questions correctly
- **Score Tracking**: Keep track of your score and the AI's score
- **Question History**: View your previous questions and answers
- **Responsive Design**: Adapts to different screen sizes and orientations
- **No Repetition**: Questions don't repeat until all 133 questions have been used
- **Immediate Feedback**: See if your answer was correct or incorrect
- **Automatic Progression**: New questions appear automatically after answering

## Categories

The quiz includes 133 questions across multiple categories:

- Science
- History
- Geography
- Technology
- Sports
- Entertainment
- Literature
- Music
- Food & Drink
- Animals
- Art
- General Knowledge

## How to Play

1. Start the app and you'll see a question at the top
2. Type your answer in the text field at the bottom
3. Press Enter to submit your answer
4. If correct, you get a point; if incorrect, the AI gets a point
5. After 2 seconds, a new question will appear automatically
6. Continue answering questions to increase your score
7. Use the reset button to start a new game

## Technical Details

- Built with Flutter
- Uses Provider for state management
- Responsive layout that works on phones, tablets, and desktops
- Grid layout for landscape mode on larger screens
- List layout for portrait mode or smaller screens

## Getting Started

### Prerequisites

- Flutter SDK
- Dart SDK
- An IDE (VS Code, Android Studio, etc.)

### Installation

1. Clone the repository:
   ```
   git clone https://github.com/yourusername/quiz-battle.git
   ```

2. Navigate to the project directory:
   ```
   cd quiz-battle
   ```

3. Install dependencies:
   ```
   flutter pub get
   ```

4. Run the app:
   ```
   flutter run
   ```

## Project Structure

- `lib/main.dart`: Main application file with UI and game logic
- `lib/data/questions.dart`: Contains the question database
- `lib/widgets/question_card.dart`: Widget for displaying questions
- `lib/widgets/score_card.dart`: Widget for displaying scores

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Acknowledgments

- Flutter team for the amazing framework
- All the knowledge that went into creating the questions

## Contact

Your Name - [@yourusername](https://twitter.com/yourusername)

Project Link: [https://github.com/yourusername/quiz-battle](https://github.com/yourusername/quiz-battle) 