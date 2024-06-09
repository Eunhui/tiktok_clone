import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/authentication/password_screen.dart';
import 'package:tiktok_clone/features/authentication/widgets/auth_button.dart';
import 'package:tiktok_clone/features/authentication/widgets/form_button.dart';

class ConfirmationCodeScreen extends StatefulWidget {
  final String emailAddress;
  const ConfirmationCodeScreen({
    super.key,
    required this.emailAddress,
  });

  @override
  State<ConfirmationCodeScreen> createState() => _ConfirmationCodeScreenState();
}

class _ConfirmationCodeScreenState extends State<ConfirmationCodeScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  List<String> code = ['', '', '', ''];
  var confirmCode;
  @override
  void initState() {
    super.initState();
  }

  String? _isNumber(String? number) {
    if (number == null) return null;
    return ("number");
  }

  void setNumber(int order, String value) {
    code[order] = value;
    setState(() {});
  }

  bool isCodeAvailable() {
    if (code.join().length == 4) {
      return false;
    }
    return true;
  }

  bool _isFormValid() => _formKey.currentState?.validate() ?? false;

  void passwordTap(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const PasswordScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
              Text("Enter it below to verify\n${widget.emailAddress}. ",
                  style: const TextStyle(
                    color: Colors.black54,
                    fontSize: Sizes.size20,
                  )),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        TextFormField(
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            decoration: const InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              //When the TextFormField is ON focus
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              ),
                            ),
                            validator: _isNumber,
                            onChanged: (value) {
                              _isFormValid();
                              setNumber(0, value);
                              FocusScope.of(context).nextFocus();
                            }),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        TextFormField(
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            decoration: const InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              //When the TextFormField is ON focus
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              ),
                            ),
                            onChanged: (value) {
                              _isFormValid();
                              setNumber(1, value);
                              FocusScope.of(context).nextFocus();
                            }),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        TextFormField(
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            decoration: const InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              //When the TextFormField is ON focus
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              ),
                            ),
                            onChanged: (value) {
                              _isFormValid();
                              setNumber(2, value);
                              FocusScope.of(context).nextFocus();
                            }),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        TextFormField(
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            decoration: const InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              //When the TextFormField is ON focus
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              ),
                            ),
                            onChanged: (value) {
                              _isFormValid();
                              setNumber(3, value);
                              FocusScope.of(context).nextFocus();
                            }),
                      ],
                    ),
                  ),
                ],
              ),
              isCodeAvailable()
                  ? const Text("")
                  : const Icon(Icons.check_circle, color: Colors.green),
              Gaps.v80,
              Text(
                "Didn't receive email?",
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: Sizes.size20,
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.grey.shade50,
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size20,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: Sizes.size80 + Sizes.size52,
                  vertical: Sizes.size10,
                ),
                decoration: BoxDecoration(
                  color: isCodeAvailable() ? Colors.black54 : Colors.black,
                  borderRadius: BorderRadius.circular(
                    (Sizes.size32),
                  ),
                ),
                child: const Text('Next',
                    style: TextStyle(
                      fontSize: Sizes.size20,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
