import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/authentication/widgets/form_button.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  bool passwordVisible = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    String pw = "";
    String? isPassword(String? password) {
      if (password == null || password.length < 6) {
        return "Please check your password";
      }
      return null;
    }

    bool checkedPassword() {
      if (pw.length < 6) {
        return true;
      }
      return false;
    }

    return Scaffold(
      appBar: AppBar(
        title: FaIcon(
          FontAwesomeIcons.twitter,
          color: Theme.of(context).primaryColor,
          size: Sizes.size36,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gaps.v40,
              const Text(
                "We sent you a code",
                style: TextStyle(
                  fontSize: Sizes.size32,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Gaps.v20,
              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        TextFormField(
                            decoration: InputDecoration(
                              enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              //When the TextFormField is ON focus
                              focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(passwordVisible
                                    ? Icons.visibility_off
                                    : Icons.visibility),
                                onPressed: () {
                                  setState(() {
                                    passwordVisible = true;
                                  });
                                },
                              ),
                            ),
                            validator: isPassword,
                            onChanged: (value) {}),
                      ],
                    ),
                  ),
                ],
              ),
              checkedPassword()
                  ? const Icon(Icons.check_circle, color: Colors.green)
                  : const Text(""),
              Gaps.v80,
              FormButton(disabled: checkedPassword()),
            ],
          ),
        ),
      ),
    );
  }
}
