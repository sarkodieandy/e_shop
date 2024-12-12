import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../components/socal_card.dart';
import '../../constants.dart';
import 'components/sign_up_form.dart';

class SignUpScreen extends StatelessWidget {
  static String routeName = "/sign_up";

  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up"),
      ),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  const Text(
                    "Register Account",
                    style: headingStyle,
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Complete your details or continue \nwith social media",
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  const SignUpForm(),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SocalCard(
                        icon: "assets/icons/google-icon.svg",
                        press: () {
                          // TODO: Add Google sign-in functionality
                        },
                      ),
                      SocalCard(
                        icon: "assets/icons/facebook-2.svg",
                        press: () {
                          // TODO: Add Facebook sign-in functionality
                        },
                      ),
                      SocalCard(
                        icon: "assets/icons/twitter.svg",
                        press: () {
                          // TODO: Add Twitter sign-in functionality
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text.rich(
                    TextSpan(
                      text:
                          'By continuing, you confirm that you agree with our ',
                      style: Theme.of(context).textTheme.bodySmall,
                      children: [
                        TextSpan(
                          text: 'Terms and Conditions',
                          style: const TextStyle(
                            color: kPrimaryColor,
                            decoration: TextDecoration.underline,
                          ),
                          // Add navigation to terms and conditions
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // TODO: Navigate to Terms and Conditions screen
                            },
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
