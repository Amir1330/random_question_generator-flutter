# Random Question Generator

A Flutter application that generates random thought-provoking questions using the Hugging Face API with the Gemma model. The app allows users to generate questions by category, save favorites, and view their question history.

## Features

- Generate random questions by category
- Save favorite questions
- View question history
- Beautiful Material Design 3 UI
- Dark mode support
- Offline storage of questions and favorites
- Secure API token storage

## Categories

- General
- Science
- History
- Technology
- Arts
- Sports
- Philosophy

## Getting Started

### Prerequisites

- Flutter SDK (latest version)
- Dart SDK (latest version)
- Hugging Face API token (optional, a default token is provided)

### Installation

1. Clone the repository:
```bash
git clone https://github.com/yourusername/random_question_generator-flutter.git
```

2. Navigate to the project directory:
```bash
cd random_question_generator-flutter
```

3. Install dependencies:
```bash
flutter pub get
```

4. Run the app:
```bash
flutter run
```

## Usage

1. Launch the app
2. Select a category from the horizontal list at the top
3. Tap the "Generate Question" button to create a new question
4. Swipe left on any question to add/remove it from favorites
5. Switch between "Questions" and "Favorites" tabs to view your saved questions

## API Configuration

The app uses the Hugging Face API with the Gemma model. A default API token is provided, but you can replace it with your own by:

1. Getting a token from [Hugging Face](https://huggingface.co/settings/tokens)
2. The token will be securely stored using Flutter Secure Storage

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License - see the LICENSE file for details. 