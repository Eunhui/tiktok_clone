import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class EmailScreen extends StatefulWidget {
  const EmailScreen({super.key});

  @override
  State<EmailScreen> createState() => _EmailScreenState();
}

class _EmailScreenState extends State<EmailScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  void _onSubmitTap() {
    if (_formKey.currentState != null) {
      _formKey.currentState!.validate();
    }
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
                    decoration: const InputDecoration(
                      hintText: "Name",
                    ),
                    validator: (value) {
                      return " I don't like your email";
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: "Email",
                    ),
                    validator: (value) {
                      return " I don't like your email";
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
