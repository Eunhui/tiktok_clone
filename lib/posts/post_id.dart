import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/posts/user.dart';

class postID extends StatelessWidget {
  const postID(
      {super.key,
      required this.id,
      required this.dateTime,
      required this.verified,
      required this.user});
  final String id;
  final int dateTime;
  final bool verified;
  final User user;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              id,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
            Gaps.h8,
            const Icon(Icons.verified, color: Colors.blue, size: 15),
          ],
        ),
        const Spacer(),
        Row(
          children: [
            Text('$dateTime m'),
            Gaps.h6,
            const Icon(FontAwesomeIcons.ellipsis),
          ],
        ),
      ],
    );
  }
}
