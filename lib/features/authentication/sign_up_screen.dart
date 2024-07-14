import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/authentication/username_screen.dart';
import 'package:tiktok_clone/features/authentication/login_screen.dart';
import 'package:tiktok_clone/features/authentication/view_models/login_view_model.dart';
import 'package:tiktok_clone/features/authentication/view_models/singup_view_model.dart';
import 'package:tiktok_clone/features/authentication/widgets/auth_button.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({super.key});
  static const String routeURL = '/signup';
  static const String routeName = 'signup';

  @override
  ConsumerState<SignUpScreen> createState() => SignUpScreenState();
}

class SignUpScreenState extends ConsumerState<SignUpScreen> {
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPw = TextEditingController();
  bool _isButtonEnabled = false;
  void initState() {
    super.initState();
    _controllerEmail.addListener(_checkButtonEnabled);
    _controllerPw.addListener(_checkButtonEnabled);
  }

  void _checkButtonEnabled() {
    setState(() {
      _isButtonEnabled = _controllerEmail.text.isNotEmpty &&
          _controllerPw.text.isNotEmpty &&
          _controllerPw.text.length > 6;
    });
  }

  void onSignUp(_email, _pw) {
    ref.read(signUpForm.notifier).state = {"email": _email, "password": _pw};
    ref.read(signUpProvider.notifier).signUp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '🔥MOOD🔥',
          style: TextStyle(
            fontSize: Sizes.size24,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size32,
          ),
          child: Column(
            children: [
              Gaps.v80,
              const Text(
                "Join!",
                style: TextStyle(
                  fontSize: Sizes.size24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              Gaps.v20,
              SizedBox(
                width: 500,
                child: TextField(
                  controller: _controllerEmail,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    labelText: 'Email',
                  ),
                ),
              ),
              Gaps.v28,
              SizedBox(
                width: 500,
                child: TextField(
                  controller: _controllerPw,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    labelText: 'Password',
                  ),
                ),
              ),
              Gaps.v28,
              _isButtonEnabled
                  ? SizedBox(
                      width: 500,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.pink.shade400,
                          foregroundColor: Colors.white,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                        ),
                        onPressed: () {
                          _isButtonEnabled
                              ? onSignUp(
                                  _controllerEmail.text, _controllerPw.text)
                              : null;
                        },
                        child: const Text("Sign Up"),
                      ),
                    )
                  : SizedBox(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.grey.shade100,
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: Sizes.size20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Already have an account?'),
              Gaps.h5,
              GestureDetector(
                onTap: () => Navigator.of(context).pop(),
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
