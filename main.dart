import 'package:flutter/material.dart';
import 'screens/tts_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Multilingual TTS Demo by Arslan',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const TTSPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
