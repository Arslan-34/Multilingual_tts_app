import 'package:flutter_tts/flutter_tts.dart';

class TTSService {
  final FlutterTts _flutterTts = FlutterTts();

  Future<List<dynamic>> getVoices() async {
    return await _flutterTts.getVoices;
  }

  Future<void> speak({
    required String text,
    required String language,
    required dynamic voice,
    required Function(String) onError,
  }) async {
    try {
      await _flutterTts.setLanguage(language);
      await _flutterTts.setVoice({
        'name': voice['name'],
        'locale': voice['locale'],
      });
      await _flutterTts.speak(text);
    } catch (e) {
      onError('TTS Error: ${e.toString()}');
    }
  }
}
