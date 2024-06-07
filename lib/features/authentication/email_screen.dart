import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/authentication/confirmation_code_screen.dart';
import 'package:tiktok_clone/features/authentication/customize_screen_part1.dart';
import 'package:tiktok_clone/features/authentication/widgets/form_button.dart';

class EmailScreen extends StatefulWidget {
  const EmailScreen({super.key});

  @override
  State<EmailScreen> createState() => _EmailScreenState();
}

class _EmailScreenState extends State<EmailScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _bdayController = TextEditingController();

  final String _email = "";
  final String _name = "";
  DateTime initialDate = DateTime.now();

  late FocusNode focusBday;

  bool _writingEmail = false;
  bool _agreed = false;
  bool _pickingDate = false;
  Map<String, String> formData = {};

  @override
  void initState() {
    super.initState();

    _bdayController.addListener(() {
      setState(() {
        formData['birthday'] = _bdayController.text;
      });
    });
    DateTime currentDate = DateTime.now();
    final minDate =
        DateTime(currentDate.year - 10, currentDate.month, currentDate.day);
    initialDate = minDate;
    setState(() {});
  }

  @override
  void dispose() {
    _bdayController.dispose();
    super.dispose();
  }

  String? _isNameValid(String? value) {
    if (value == null) return null;
    if (value.length < 6) {
      return "Name must be at least 6 characters";
    }
    return null;
  }

  String? _isEmailValid(String? email) {
    if (email == null) return null;
    final regExp = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (!regExp.hasMatch(email)) {
      return "check email";
    }
    return null;
  }

  bool _isFormValid() => _formKey.currentState?.validate() ?? false;

  void _showDatePicker(BuildContext context) {
    if (_bdayController.text.isEmpty) {
      _bdayController.text = initialDate.toString().split(" ").first;
      print(_bdayController.text);
    }
    _pickingDate = true;
    _writingEmail = false;
    setState(() {});
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 300.0,
          child: CupertinoDatePicker(
            maximumDate: initialDate,
            initialDateTime: initialDate,
            mode: CupertinoDatePickerMode.date,
            onDateTimeChanged: _setTextFieldDate,
            backgroundColor: Colors.white,
          ),
        );
      },
    ).then((_) {
      FocusManager.instance.primaryFocus?.unfocus();
      setState(() {
        _pickingDate = false;
      });
    });
  }

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  void _setTextFieldDate(DateTime date) {
    final textDate = date.toString().split(" ").first;

    _bdayController.value = TextEditingValue(text: textDate);
    formData['birthday'] = textDate;
    setState(() {});
  }

  void _confirmationScreen() {
    if (formData['email'] == null) return;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            ConfirmationCodeScreen(emailAddress: formData['email']!),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: _onScaffoldTap,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: FaIcon(
              FontAwesomeIcons.twitter,
              color: Theme.of(context).primaryColor,
              size: Sizes.size36,
            ),
          ),
          backgroundColor: Colors.white,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: Sizes.size36),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gaps.v40,
                const Text(
                  "Create your account",
                  style: TextStyle(
                    fontSize: Sizes.size28,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Gaps.v8,
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Gaps.v28,
                      TextFormField(
                          cursorColor: Theme.of(context).primaryColor,
                          decoration: InputDecoration(
                            hintText: "Name",
                            suffixIcon: _agreed ||
                                    (formData['name'] != null &&
                                        _isNameValid(formData['name']) == null)
                                ? const Icon(Icons.check_circle,
                                    color: Colors.green)
                                : null,
                          ),
                          validator: _isNameValid,
                          onChanged: (value) {
                            _formKey.currentState?.validate();
                            setState(() {
                              formData['name'] = value;
                            });
                          }),
                      TextFormField(
                        cursorColor: Theme.of(context).primaryColor,
                        decoration: InputDecoration(
                          hintText: "Email",
                          suffixIcon: _agreed ||
                                  (formData['email'] != null &&
                                      _isEmailValid(formData["email"]) == null)
                              ? const Icon(Icons.check_circle,
                                  color: Colors.green)
                              : null,
                        ),
                        validator: _isEmailValid,
                        onChanged: (newValue) {
                          _isFormValid();
                          setState(() => formData['email'] = newValue);
                        },
                      ),
                      Gaps.v16,
                      TextFormField(
                        controller: _bdayController,
                        onTap: () {
                          _showDatePicker(context);
                        },
                        enabled: true,
                        decoration: InputDecoration(
                          labelText: "Date of birth",
                          suffixIcon:
                              _agreed || (_bdayController.text.isNotEmpty)
                                  ? const Icon(Icons.check_circle,
                                      color: Colors.green)
                                  : null,
                        ),
                      ),
                      Gaps.v28,
                      _pickingDate
                          ? Text(
                              "This will not be shown publicly. Confirm your\nown age, even if this account is for a\nbusiness, a pet, or something else.",
                              style: TextStyle(
                                color: Colors.grey.shade700,
                                fontSize: 15,
                              ),
                            )
                          : Container(),
                    ], // have to make email field, button
                  ),
                ),
              ],
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: _agreed
                ? Column(
                    children: [
                      const Spacer(),
                      RichText(
                        text: TextSpan(
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            color: Colors.grey.shade800,
                          ),
                          children: [
                            const TextSpan(
                              text: "By signing up, you agree to the ",
                            ),
                            TextSpan(
                              text: "Terms of Service",
                              style: TextStyle(
                                color: Colors.blue.shade700,
                              ),
                            ),
                            const TextSpan(
                              text: " and ",
                            ),
                            TextSpan(
                              text: "Privacy Policy",
                              style: TextStyle(
                                color: Colors.blue.shade700,
                              ),
                            ),
                            const TextSpan(
                              text: ", including ",
                            ),
                            TextSpan(
                              text: "Cookie Use",
                              style: TextStyle(
                                color: Colors.blue.shade700,
                              ),
                            ),
                            const TextSpan(
                              text:
                                  ". Twitter\nmay use your contact information, including your\nemail address and phone number for purposes\noutlined in our Privacy Policy, like keeping your\naccount secure and personalizing our services,\nincluding ads. ",
                            ),
                            TextSpan(
                              text: "Learn more",
                              style: TextStyle(
                                color: Colors.blue.shade700,
                              ),
                            ),
                            const TextSpan(
                              text:
                                  ". Others will be able to\nfind you by email or phone number, when provided,\nunless you choose otherwise. ",
                            ),
                            TextSpan(
                              text: "here",
                              style: TextStyle(
                                color: Colors.blue.shade700,
                              ),
                            ),
                            const TextSpan(text: "."),
                          ],
                        ),
                      ),
                      Gaps.v24,
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: TextButton(
                          onPressed: () {
                            _confirmationScreen();
                          },
                          child: const Text(
                            "Sign up",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(""),
                      GestureDetector(
                        onTap: () async {
                          if (_isFormValid()) {
                            final bool agreed = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const CustomizeScreenPart1(),
                              ),
                            );

                            setState(() {
                              _agreed = agreed;
                            });
                          }
                        },
                        child: Container(
                          width: Sizes.size96,
                          height: 47,
                          decoration: BoxDecoration(
                            color: _isFormValid() ? Colors.black : Colors.grey,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: const Center(
                            child: Text(
                              "Next",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
          ),
        ));
  }
}
