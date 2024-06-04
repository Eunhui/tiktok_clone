import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class CustomizeScreenPart1 extends StatelessWidget {
  const CustomizeScreenPart1({super.key});

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
      body: Column(
        children: [
          const Text('Customize your experience'),
          const Text('Track where you see Twitter content across the web'),
          const Row(
            children: [
              Column(
                children: [
                  Text(
                      'Twitter uses this data to personalized your experience. This web browsing history will never be stored with your name, email, or phone number.'),
                  //toggle button
                ],
              ),
            ],
          ),
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
          //next button
        ],
      ),
    );
  }
}
