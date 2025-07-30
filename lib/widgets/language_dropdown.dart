import 'package:flutter/material.dart';

class LanguageDropdown extends StatelessWidget {
  final String selectedLanguage;
  final Function(String) onChanged;

  const LanguageDropdown({
    super.key,
    required this.selectedLanguage,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final Map<String, String> languages = {
      'en-US': 'English (US)',
      'fr-FR': 'French (FR)',
      'es-ES': 'Spanish (ES)',
      'de-DE': 'German (DE)',
    };

    return DropdownButtonFormField<String>(
      value: selectedLanguage,
      items: languages.entries.map((entry) {
        return DropdownMenuItem(
          value: entry.key,
          child: Text(entry.value),
        );
      }).toList(),
      onChanged: (value) => onChanged(value!),
      decoration: const InputDecoration(
        labelText: 'Select Language',
        border: OutlineInputBorder(),
      ),
    );
  }
}
