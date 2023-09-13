import 'package:flutter/material.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LanguageScreenState createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  String? selectedLanguage = 'English'; // Default language

  void _onLanguageChanged(String? value) {
    setState(() {
      selectedLanguage = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 212, 243, 216),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor:
            const Color.fromARGB(255, 255, 255, 255).withOpacity(0.2),
        elevation: 0,
        title: const Text(
          'Language',
          style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(20.0),
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Choose your preferred language.',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            RadioListTile(
              title: const Text('English'),
              value: 'English',
              groupValue: selectedLanguage,
              onChanged: _onLanguageChanged,
            ),
            RadioListTile(
              title: const Text('Sinhala'),
              value: 'Sinhala',
              groupValue: selectedLanguage,
              onChanged: _onLanguageChanged,
            ),
            RadioListTile(
              title: const Text('German'),
              value: 'German',
              groupValue: selectedLanguage,
              onChanged: _onLanguageChanged,
            ),
            RadioListTile(
              title: const Text('Spanish'),
              value: 'Spanish',
              groupValue: selectedLanguage,
              onChanged: _onLanguageChanged,
            ),
            RadioListTile(
              title: const Text('Hindi'),
              value: 'Hindi',
              groupValue: selectedLanguage,
              onChanged: _onLanguageChanged,
            ),
            // Add more languages as needed
          ],
        ),
      ),
    );
  }
}
