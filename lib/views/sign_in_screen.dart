import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:threads/constants/gaps.dart';
import 'package:threads/constants/sizes.dart';
import 'package:threads/features/authentication/view_models/login_view_model.dart';
import 'package:threads/features/authentication/view_models/signup_view_model.dart';
import 'package:threads/features/models/darkmode_config_model.dart';
import 'package:threads/features/view_models/darkmode_config_vm.dart';
import 'package:threads/main.dart';
import 'package:threads/views/widgets/Privacy.dart';

class SignInScreen extends ConsumerStatefulWidget {
  const SignInScreen({
    super.key,
  });

  static const String routeURL = '/signin';
  static const String routeName = 'signin';
  @override
  ConsumerState<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends ConsumerState<SignInScreen> {
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPw = TextEditingController();
  bool _isButtonEnabled = false;
  @override
  void initState() {
    super.initState();
    _controllerEmail.addListener(_checkButtonEnabled);
    _controllerPw.addListener(_checkButtonEnabled);
  }

  void _onSubmit(_email, _pw) {
    ref.read(signUpForm.notifier).state = {"email": _email, "password": _pw};
    ref.read(signUpProvider.notifier).signUp();
  }

  void _onLogin(_email, _pw) {
    ref.read(loginProvider.notifier).login(_email, _pw, context);
  }

  void _checkButtonEnabled() {
    setState(() {
      _isButtonEnabled = _controllerEmail.text.isNotEmpty &&
          _controllerPw.text.isNotEmpty &&
          _controllerPw.text.length > 6;
    });
  }

  @override
  void dispose() {
    _controllerEmail.dispose();
    _controllerPw.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "English (US)",
          style: TextStyle(
            color: Colors.black45,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Gaps.v80,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/thread.svg',
                  color: Colors.black, width: 80, height: 80),
            ],
          ),
          Gaps.v80,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                SizedBox(
                  width: 500,
                  child: TextField(
                    controller: _controllerEmail,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Mobile number or email',
                    ),
                  ),
                ),
                Gaps.v10,
                SizedBox(
                  width: 500,
                  child: TextField(
                    controller: _controllerPw,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                  ),
                ),
                Gaps.v10,
                _isButtonEnabled
                    ? SizedBox(
                        width: 500,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.blue,
                            foregroundColor: Colors.white,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                          ),
                          onPressed: () {
                            _isButtonEnabled
                                ? _onLogin(
                                    _controllerEmail.text, _controllerPw.text)
                                : null;
                          },
                          child: const Text("Log in"),
                        ),
                      )
                    : SizedBox(),
                TextButton(
                  onPressed: () {},
                  child: const Text("Forgot password?"),
                ),
                Gaps.v10,
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              child: TextButton(
                style: TextButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                ),
                onPressed: () {
                  _isButtonEnabled
                      ? _onSubmit(_controllerEmail.text, _controllerPw.text)
                      : null;
                },
                child: Text("Create new account"),
              ),
            ),
            Gaps.v20,
          ],
        ),
      ),
    );
  }
}
