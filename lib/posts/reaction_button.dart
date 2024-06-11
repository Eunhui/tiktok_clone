import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';

class reactionButton extends StatelessWidget {
  const reactionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Icon(FontAwesomeIcons.heart),
        Gaps.h6,
        Icon(FontAwesomeIcons.comment),
        Gaps.h6,
        Icon(FontAwesomeIcons.retweet),
        Gaps.h8,
        Icon(FontAwesomeIcons.paperPlane),
      ],
    );
  }
}
