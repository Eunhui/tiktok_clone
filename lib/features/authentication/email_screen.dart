import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class EmailScreen extends StatelessWidget {
  const EmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Sign up",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Sizes.size36),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gaps.v40,
            const Text(
              "Create username",
              style: TextStyle(
                fontSize: Sizes.size20,
                fontWeight: FontWeight.w800,
              ),
            ),
            Gaps.v8,
            const Text(
              "You can always change this later.",
              style: TextStyle(
                color: Colors.black45,
                fontSize: Sizes.size16,
                fontWeight: FontWeight.w600,
              ),
            ),
            Gaps.v16,
            TextField(
              decoration: InputDecoration(
                hintText: "Username",
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                  color: Colors.grey.shade400,
                )),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                  color: Colors.grey.shade400,
                )),
              ),
              cursorColor: Theme.of(context).primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
