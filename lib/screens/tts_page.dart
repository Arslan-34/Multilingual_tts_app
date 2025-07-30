import 'package:flutter/material.dart';
import 'package:multilingual_tts_app/widgets/language_dropdown.dart';
import 'package:multilingual_tts_app/widgets/input_text_field.dart';
import 'package:multilingual_tts_app/widgets/play_button.dart';
import 'package:multilingual_tts_app/services/tts_service.dart';

class TTSPage extends StatefulWidget {
  const TTSPage({super.key});

  @override
  State<TTSPage> createState() => _TTSPageState();
}

class _TTSPageState extends State<TTSPage> {
  final TextEditingController _textController = TextEditingController();
  String _selectedLanguage = 'en-US';
  final TTSService _ttsService = TTSService();
  List<dynamic> _voices = [];
  int _voiceIndex = 0;
  String _errorMessage = '';
  String _statusMessage = '';

  @override
  void initState() {
    super.initState();
    _loadVoices();
  }

  Future<void> _loadVoices() async {
    try {
      _voices = await _ttsService.getVoices();
      setState(() {});
    } catch (e) {
      setState(() {
        _errorMessage = 'Failed to load voices';
      });
    }
  }

  Future<void> _handleSpeak() async {
    String text = _textController.text.trim();
    if (text.isEmpty) {
      _showMessage('Please enter a sentence.');
      return;
    }

    List<dynamic> availableVoices = _voices
        .where((voice) => voice['locale'] == _selectedLanguage)
        .toList();

    if (availableVoices.isEmpty) {
      _showMessage('Selected language is not supported on this device.');
      return;
    }

    final selectedVoice = availableVoices[_voiceIndex % availableVoices.length];
    _voiceIndex++;

    setState(() {
      _statusMessage = _selectedLanguage == 'en-US'
          ? 'Speaking... Press again for other voice (if supported)'
          : 'Speaking in default voice for $_selectedLanguage';
    });

    await _ttsService.speak(
      text: text,
      language: _selectedLanguage,
      voice: selectedVoice,
      onError: _showMessage,
    );
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: Container(
          decoration: const BoxDecoration(
            color: Color(0xFFEFEFEF), // Ash white
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 8,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: const Center(
            child: Padding(
              padding: EdgeInsets.only(top: 25),
              child: Text(
                'Multilingual TTS Demo by Arslan',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 7, 39, 36), // Ferozi color
                ),
              ),
            ),
          ),
        ),
      ),
      body: Container(
        color: const Color.fromARGB(255, 255, 255, 255), // White background
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            if (_errorMessage.isNotEmpty)
              Text(_errorMessage, style: const TextStyle(color: Colors.red)),
            LanguageDropdown(
              selectedLanguage: _selectedLanguage,
              onChanged: (lang) {
                setState(() {
                  _selectedLanguage = lang;
                  _voiceIndex = 0;
                  _statusMessage = '';
                });
              },
            ),
            const SizedBox(height: 20),
            InputTextField(controller: _textController),
            const SizedBox(height: 20),
            PlayButton(onPressed: _handleSpeak),
            const SizedBox(height: 20),
            if (_statusMessage.isNotEmpty)
              Text(
                _statusMessage,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
          ],
        ),
      ),
    );
  }
}
