import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/posts/post_list_item_avatar.dart';
import 'package:tiktok_clone/posts/user.dart';

class postAvatar extends StatelessWidget {
  const postAvatar({
    super.key,
    required this.user,
  });
  final User user;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.center,
          child: PostListItemAvatar.asset(user.profileImagePath),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Container(
            width: 22,
            height: 22,
            decoration: BoxDecoration(
              color: Colors.black,
              border: Border.all(color: Colors.white, width: 3),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              FontAwesomeIcons.plus,
              color: Colors.white,
              size: 10,
            ),
          ),
        )
      ],
    );
  }
}
