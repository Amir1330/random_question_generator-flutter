# Flutter Quiz Chat

A modern quiz application that presents questions in a chat-like interface, where users compete against AI in a question-answer format.

![Flutter Quiz Chat](assets/app_screenshot.png)

## Features

- 🤖 Chat-like interface for an engaging quiz experience
- 🎯 Score tracking system (User vs AI)
- 🔄 Dynamic question generation using Hugging Face AI models
- 🎨 Modern Material Design with dark/light theme support
- 🔐 Secure API token management
- 💾 Local progress saving

## Getting Started

### Prerequisites

- Flutter SDK (2.0.0 or higher)
- Dart SDK (2.12.0 or higher)
- A Hugging Face API token (Get one [here](https://huggingface.co/settings/tokens))

### Installation

1. Clone the repository:
```bash
git clone https://github.com/yourusername/random_question_generator-flutter.git
cd random_question_generator-flutter
```

2. Install dependencies:
```bash
flutter pub get
```

3. Run the app:
```bash
flutter run
```

### Setting Up Your API Token

1. Launch the app
2. Tap the settings icon in the app bar
3. Enter your Hugging Face API token
4. Save the token

Your token will be stored securely using Flutter Secure Storage.

## How to Play

1. Start the app and set up your API token
2. Tap the + button to get a new question
3. Type your answer in the input field
4. Submit your answer
5. If correct, you get a point; if incorrect, the AI gets a point
6. Keep playing to improve your score!

## Architecture

- **Provider** for state management
- **Flutter Secure Storage** for secure token storage
- **HTTP** for API communication
- **Material 3** for modern UI components

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- [Hugging Face](https://huggingface.co/) for providing the AI models
- [Flutter](https://flutter.dev/) for the amazing framework
- [Material Design](https://material.io/) for the design guidelines

## Contact

Your Name - [@yourusername](https://twitter.com/yourusername)

Project Link: [https://github.com/yourusername/random_question_generator-flutter](https://github.com/yourusername/random_question_generator-flutter) 