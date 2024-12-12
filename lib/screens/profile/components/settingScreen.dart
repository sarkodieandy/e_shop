import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  final String userId;

  const SettingsScreen({required this.userId, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          ListTile(
            title: Text('Notification Settings'),
            trailing: Switch(
              value: true, // This should be linked to the actual settings
              onChanged: (value) {
                // Implement toggle logic
              },
            ),
          ),
          ListTile(
            title: Text('Privacy Settings'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigate to privacy settings
            },
          ),
        ],
      ),
    );
  }
}
