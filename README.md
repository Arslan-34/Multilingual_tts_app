# Multilingual Text-to-Speech (TTS) App

A Flutter-based mobile application designed to demonstrate multilingual Text-to-Speech functionality with proper voice handling, input validation, and platform support.

## Project Overview

This Flutter application was built as a multilingual Text-to-Speech (TTS) App.
It demonstrates the use of the flutter_tts package, dynamic voice switching, error handling, and multilingual support, all implemented using clean, modular Flutter code.

## Key Features:

- Language selection (English, French, Spanish, German).

- Real-time voice feedback for entered text.

- Gender-based voice switching (male/female, if supported).

- Input validation and device compatibility checks.

- The app was developed with simplicity, functionality, and extensibility in mind.



## Objectives

- Demonstrate multilingual TTS in Flutter
- Properly handle language and voice switching
- Show error messages for unsupported languages
- Provide a smooth and responsive user experience
- Follow best practices in code structure and UI design

## Features

- **Language Dropdown**  
  Select from `en-US(English)`, `fr-FR (French)`, `es-ES(Spainish)`, `de-DE(German)`

- **Text Field + Validation**  
  Users can enter any sentence.  
  If left empty, app shows: _“Please enter a sentence.”_

- **TTS Playback + Voice Switching**  
  - Pressing Play reads the sentence
  - In case of English, voice alternates between male and female
  - For other languages (if only one voice), it defaults and displays:  
    _“Only default male/female voice supported”_

- **SnackBar Error Handling**  
  If selected language isn’t supported, message displays:  
  _“Selected language is not supported on this device.”_

- **Simple, Clean UI**  
  - Beige background for content  
  - Yellow AppBar styled in bubble/cube shape  
  - Ferozi AppBar text color for elegance

---

## UI Design

- Minimalistic, user-friendly simple design

## Tech Stack

| Component          | Tool / Framework        |
|--------------------|--------------------------|
| App Framework      | Flutter (Dart)           |
| TTS Integration    | `flutter_tts` package    |
| Platform Support   | Android (Tested)         |
| Version Control    | Git & GitHub             |

---

## Folder Structure

multilingual_tts_app/

├── lib/

│ ├── widgets/

│ │ ├── language_dropdown.dart

│ │ ├── input_text_field.dart

│ │ └── play_button.dart

│ ├── services/

│ │ └── tts_service.dart

│ ├── screens/

│ │ └── tts_page.dart

│ └── main.dart

├── pubspec.yaml

└── README.md

## Limitations

- Only English (US) voice toggles between male and female (if supported)
- Most other languages have only one default voice
- Some device TTS engines may not support certain locales

## Future Improvements

- Add Translation feature before TTS
- Introduce modern animations and theme switching
- Save voice preferences locally
- Add accessibility toggles for visually impaired users

## Author
Muhammad Arslan Nawaz
Email: manarslan4@gmail.com
Bahria University Islamabad

## License
This app is built for learning purposes only.
