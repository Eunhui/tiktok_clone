import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/authentication/email_screen.dart';
import 'package:tiktok_clone/features/authentication/login_screen.dart';
import 'package:tiktok_clone/features/authentication/widgets/auth_button.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});
  void onLoginTap(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ),
    );
  }

  void onEmailTap(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const EmailScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size20,
          ),
          child: Column(
            children: [
              Gaps.v80,
              FaIcon(
                FontAwesomeIcons.twitter,
                color: Theme.of(context).primaryColor,
                size: Sizes.size36,
              ),
              Gaps.v80,
              const Text("See what's happening in the world right now.",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w900,
                  )),
              Gaps.v80,
              Gaps.v20,
              const AuthButton(
                  icon: FaIcon(FontAwesomeIcons.google),
                  text: "Continue with Google"),
              Gaps.v16,
              const AuthButton(
                  icon: FaIcon(FontAwesomeIcons.apple),
                  text: "Continue with Apple"),
              Gaps.v16,
              const Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: Colors.black45,
                      thickness: 1,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('OR'),
                  ),
                  Expanded(
                    child: Divider(
                      color: Colors.black45,
                      thickness: 1,
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () => onEmailTap(context),
                child: const AuthButton(
                  text: "Create account",
                ),
              ),
              Gaps.v20,
              Center(
                  child: RichText(
                text: TextSpan(
                  children: [
                    const TextSpan(
                        text: "By signing up, you agree to our ",
                        style: TextStyle(
                          fontSize: Sizes.size16,
                          color: Colors.black87,
                        )),
                    TextSpan(
                        text: "Terms,Prifacy Policy",
                        style: TextStyle(
                          fontSize: Sizes.size16,
                          color: Theme.of(context).primaryColor,
                        )),
                    const TextSpan(
                        text: " and ",
                        style: TextStyle(
                          fontSize: Sizes.size16,
                          color: Colors.black87,
                        )),
                    TextSpan(
                        text: "Cookie Use.",
                        style: TextStyle(
                          fontSize: Sizes.size16,
                          color: Theme.of(context).primaryColor,
                        )),
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        elevation: 1,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: Sizes.size20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Have an account already?'),
              Gaps.h5,
              GestureDetector(
                onTap: () => onLoginTap(context),
                child: Text(
                  'Log in',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
