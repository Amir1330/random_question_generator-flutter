# Quiz Battle

A responsive Flutter application that creates an engaging quiz battle experience between the user and AI.

## Features

- **Responsive Design**: Adapts seamlessly to different screen sizes and orientations
- **Dynamic Scaling**: Automatically adjusts UI elements based on device size
- **Score Tracking**: Keep track of points between user and AI
- **Immediate Feedback**: Visual feedback for correct and incorrect answers
- **Smooth Transitions**: Automatic question progression with loading states
- **Clean UI**: Modern and intuitive interface with proper spacing and typography

## Technical Details

### Responsive Layout
- Uses `OrientationBuilder` and `LayoutBuilder` for adaptive layouts
- Implements three screen size categories: small, medium, and large
- Dynamic padding and spacing calculations based on screen size
- Grid layout for landscape mode on larger screens
- List layout for portrait mode or smaller screens

### UI Components
- **ScoreCard**: Displays user and AI scores with responsive sizing
- **QuestionCard**: Shows questions and answers with adaptive typography
- **Input Field**: Context-aware text input with proper scaling

### Screen Size Adaptations
- **Small Screens** (< 600px):
  - Compact padding and spacing
  - Smaller text sizes
  - Optimized for mobile devices
- **Medium Screens** (600px - 1200px):
  - Balanced padding and spacing
  - Standard text sizes
  - Suitable for tablets
- **Large Screens** (> 1200px):
  - Generous padding and spacing
  - Larger text sizes
  - Ideal for desktop displays

## Project Structure

```
lib/
├── main.dart              # Main application entry point
├── data/
│   └── questions.dart     # Question data and model
└── widgets/
    ├── score_card.dart    # Score display widget
    └── question_card.dart # Question display widget
```

## Getting Started

1. Clone the repository
2. Run `flutter pub get` to install dependencies
3. Run `flutter run` to start the application

## Dependencies

- Flutter SDK
- Material Design components

## Contributing

Feel free to submit issues and enhancement requests!

## Categories

The quiz includes 100 + questions across multiple categories:

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

## License

This project is licensed under the GPL License - see the LICENSE file for details.

