import 'package:flutter/material.dart';
import 'package:moodup/src/constants/colors.dart';

class LanguagePage extends StatelessWidget {
  const LanguagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: AppBar(
          backgroundColor: kDarkGreen,
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Text('Language'),
            ],
          ),
        ),
      ),
      body: _buildSettingsList(),
    );
  }

  Widget _buildSettingsList() {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Choose Your Preferred App Language',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w100,
                ),
              ),
              const SizedBox(height: 16),
              LanguageOptionTile(
                language: 'English',
                isSelected:
                    true, // Set this to true if English is the currently selected language
                onTap: () {
                  // Handle language selection here
                  // You may want to use a state management solution to update the selected language
                },
              ),
              LanguageOptionTile(
                language: 'Spanish',
                isSelected:
                    false, // Set this to true if Spanish is the currently selected language
                onTap: () {
                  // Handle language selection here
                  // You may want to use a state management solution to update the selected language
                },
              ),
              LanguageOptionTile(
                language: 'French',
                isSelected: false,
                onTap: () {
                  // Handle language selection here
                },
              ),
              LanguageOptionTile(
                language: 'German',
                isSelected: false,
                onTap: () {
                  // Handle language selection here
                },
              ),
              LanguageOptionTile(
                language: 'Chinese',
                isSelected: false,
                onTap: () {
                  // Handle language selection here
                },
              ),
              // Add more LanguageOptionTile widgets for other language options
            ],
          ),
        ),
      ],
    );
  }
}

class LanguageOptionTile extends StatelessWidget {
  final String language;
  final bool isSelected;
  final VoidCallback onTap;

  const LanguageOptionTile({super.key, 
    required this.language,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: isSelected
          ? const Icon(Icons.radio_button_checked)
          : const Icon(Icons.radio_button_unchecked),
      title: Text(language),
    );
  }
}
