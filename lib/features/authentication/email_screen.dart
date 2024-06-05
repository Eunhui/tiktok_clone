import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
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

  String _email = "";
  String _name = "";
  DateTime initialDate = DateTime.now();
  bool confirm = false;

  late FocusNode focusBday;
  bool dateFocused = false;
  Map<String, String> formData = {};
  void _onSubmitTap() {
    if (_formKey.currentState != null) {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => CustomizeScreenPart1(formData: formData),
          ),
        );
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _nameController.addListener(() {
      setState(() {
        _name = _nameController.text;
      });
    });
    _emailController.addListener(() {
      setState(() {
        _email = _emailController.text;
      });
    });
    _setTextFieldDate(initialDate);
    focusBday = FocusNode();
    focusBday.addListener(() {
      setState(() {
        dateFocused = focusBday.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    focusBday.dispose();
    _emailController.dispose();
    _nameController.dispose();
    _bdayController.dispose();
    super.dispose();
  }

  bool _isEmailValid() {
    if (_email.isEmpty) return false;
    final regExp = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (!regExp.hasMatch(_email)) {
      return false;
    }
    return true;
  }

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  void _setTextFieldDate(DateTime date) {
    final textDate = date.toString().split(" ").first;
    _bdayController.value = TextEditingValue(text: textDate);
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
                        controller: _nameController,
                        cursorColor: Theme.of(context).primaryColor,
                        decoration: const InputDecoration(
                          hintText: "Name",
                        ),
                        validator: (value) {
                          if (value != null) {
                            if (value.isEmpty || !_isEmailValid()) {
                              return "Check your name";
                            }
                          }
                          return null;
                        },
                        onSaved: (newValue) {
                          if (newValue != null) {
                            formData['name'] = newValue;
                          }
                        }),
                    TextFormField(
                      controller: _emailController,
                      cursorColor: Theme.of(context).primaryColor,
                      decoration: const InputDecoration(
                        hintText: "Email",
                      ),
                      validator: (value) {
                        if (value != null) {
                          if (value.isEmpty || !_isEmailValid()) {
                            return "Check your Email";
                          }
                        }
                        return null;
                      },
                      onSaved: (newValue) {
                        if (newValue != null) {
                          formData['email'] = newValue;
                        }
                      },
                    ),
                    Gaps.v16,
                    TextFormField(
                      focusNode: focusBday,
                      enabled: false,
                      controller: _bdayController,
                      decoration: InputDecoration(
                        helperText: focusBday.hasFocus
                            ? "This will not be shown publicly. Confirm your own age, even if this account is for a business, a pet, or something else."
                            : null,
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey.shade400,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey.shade400,
                          ),
                        ),
                      ),
                      cursorColor: Theme.of(context).primaryColor,
                      onSaved: (newValue) {
                        if (newValue != null) {
                          formData['birthday'] = newValue;
                        }
                      },
                    ),
                    Gaps.v28,
                    GestureDetector(
                      onTap: _onSubmitTap,
                      child: FormButton(
                        disabled: (_name.isEmpty ||
                            _email.isEmpty ||
                            !_isEmailValid()),
                      ),
                    ),
                  ], // have to make email field, button
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: dateFocused
            ? BottomAppBar(
                child: SizedBox(
                  height: 300,
                  child: CupertinoDatePicker(
                    maximumDate: initialDate,
                    initialDateTime: initialDate,
                    mode: CupertinoDatePickerMode.date,
                    onDateTimeChanged: _setTextFieldDate,
                  ),
                ),
              )
            : null,
      ),
    );
  }
}
