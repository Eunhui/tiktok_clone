import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
//import 'package:tiktok_clone/features/authentication/confirm_screen.dart';
import 'package:tiktok_clone/features/authentication/widgets/form_button.dart';

class CustomizeScreenPart1 extends StatefulWidget {
  const CustomizeScreenPart1({
    super.key,
  });

  @override
  State<CustomizeScreenPart1> createState() => _CustomizeScreenPart1State();
}

bool isChecked = false;

class _CustomizeScreenPart1State extends State<CustomizeScreenPart1> {
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
        padding: const EdgeInsets.symmetric(
          horizontal: Sizes.size20,
        ),
        child: Column(
          children: [
            Gaps.v40,
            const Text(
              'Customize your experience',
              style: TextStyle(
                fontSize: Sizes.size36,
                fontWeight: FontWeight.w800,
              ),
            ),
            Gaps.v40,
            const Text('Track where you see Twitter content across the web',
                style: TextStyle(
                  fontSize: Sizes.size20,
                  fontWeight: FontWeight.w800,
                )),
            Gaps.v20,
            Row(
              children: [
                const Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'Twitter uses this data to personalized your experience. This web browsing history will never be stored with your name, email, or phone number.',
                      ),
                    ],
                  ),
                ),
                Gaps.h10,
                Column(
                  children: [
                    CupertinoSwitch(
                      value: isChecked,
                      activeColor: CupertinoColors.activeBlue,
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked = value ?? false;
                        });
                      },
                    ),
                  ],
                )
              ],
            ),
            Gaps.v40,
            Center(
              child: RichText(
                text: TextSpan(
                  children: [
                    const TextSpan(
                      text: "By signing up, you agree to our ",
                      style: TextStyle(
                        fontSize: Sizes.size16,
                        color: Colors.black87,
                      ),
                    ),
                    TextSpan(
                      text: "Terms,Privacy Policy",
                      style: TextStyle(
                        fontSize: Sizes.size16,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    const TextSpan(
                      text: " and ",
                      style: TextStyle(
                        fontSize: Sizes.size16,
                        color: Colors.black87,
                      ),
                    ),
                    TextSpan(
                      text: "Cookie Use.",
                      style: TextStyle(
                        fontSize: Sizes.size16,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    const TextSpan(
                      text:
                          " Twitter may user your contact information, including your email address and phone number for purposes outlined in our Privacy Policy. ",
                      style: TextStyle(
                        fontSize: Sizes.size16,
                        color: Colors.black87,
                      ),
                    ),
                    TextSpan(
                      text: "Learn more",
                      style: TextStyle(
                        fontSize: Sizes.size16,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Gaps.v80,
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        elevation: 0,
        child: GestureDetector(
          onTap: () {
            if (isChecked) {
              Navigator.pop(context, isChecked);
            }
          },
          child: FormButton(
            disabled: !isChecked,
          ),
        ),
      ),
    );
  }
}
