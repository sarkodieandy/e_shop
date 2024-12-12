import 'package:e_shop/screens/profile/components/NotificationScreen.dart';
import 'package:e_shop/screens/profile/components/account.dart';
import 'package:e_shop/screens/profile/components/helpCenterScreen.dart';
import 'package:e_shop/screens/profile/components/settingScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'components/profile_menu.dart';
import 'components/profile_pic.dart';
import 'components/responsiveWidget.dart';

class ProfileScreen extends StatelessWidget {
  static String routeName = "/profile";
  final String userId = 'your_user_id_here'; // Replace with the actual user ID

  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: ResponsiveWidget(
        builder: (context, constraints) {
          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              children: [
                ProfilePic(userId: userId),
                const SizedBox(height: 20),
                ProfileMenu(
                  text: "My Account",
                  icon: "assets/icons/User Icon.svg",
                  // press: () => Navigator.push(context, MaterialPageRoute(builder: (_) => AccountScreen(userId: userId))),
                ),
                ProfileMenu(
                  text: "Notifications",
                  icon: "assets/icons/Bell.svg",
                  press: () => Navigator.push(context, MaterialPageRoute(builder: (_) => NotificationScreen(userId: userId))),
                ),
                ProfileMenu(
                  text: "Settings",
                  icon: "assets/icons/Settings.svg",
                  press: () => Navigator.push(context, MaterialPageRoute(builder: (_) => SettingsScreen(userId: userId))),
                ),
                ProfileMenu(
                  text: "Help Center",
                  icon: "assets/icons/Question mark.svg",
                  press: () => Navigator.push(context, MaterialPageRoute(builder: (_) => HelpCenterScreen())),
                ),
                ProfileMenu(
                  text: "Log Out",
                  icon: "assets/icons/Log out.svg",
                  press: () => FirebaseAuth.instance.signOut(),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
