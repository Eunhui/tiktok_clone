import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        width: 300,
        height: 300,
        child: Scaffold(
          body: Column(
            children: [
              Row(
                children: [
                  Column(
                    children: [
                      Container(
                        height: Sizes.size40,
                        width: Sizes.size40,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          FontAwesomeIcons.user,
                          size: Sizes.size20,
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const Text(
                                  "pubity",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Gaps.h8,
                                Icon(FontAwesomeIcons.circleCheck,
                                    color: Colors.blue.shade500)
                              ],
                            ),
                            const Spacer(),
                            const Row(
                              children: [
                                Text("2m"),
                                Gaps.h6,
                                Icon(FontAwesomeIcons.ellipsis),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
