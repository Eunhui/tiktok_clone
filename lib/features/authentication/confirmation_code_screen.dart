import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/authentication/widgets/auth_button.dart';

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
  final TextEditingController _numController1 = TextEditingController();
  final TextEditingController _numController2 = TextEditingController();
  final TextEditingController _numController3 = TextEditingController();
  final TextEditingController _numController4 = TextEditingController();
  final TextEditingController _numController5 = TextEditingController();
  final TextEditingController _numController6 = TextEditingController();

  @override
  void initState() {
    super.initState();
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
      body: Padding(
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
                        decoration: const InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          //When the TextFormField is ON focus
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.teal),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Gaps.v80,
            Text(
              "Didn't receive email?",
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: Sizes.size20,
              ),
            ),
            const AuthButton(text: "Next", isBlack: true),
          ],
        ),
      ),
    );
  }
}
