import 'package:flutter/material.dart';

class HelpCenterScreen extends StatelessWidget {
  const HelpCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Help Center'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          ListTile(
            title: Text('FAQ'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigate to FAQ screen
            },
          ),
          ListTile(
            title: Text('Contact Support'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigate to contact support screen
            },
          ),
        ],
      ),
    );
  }
}
