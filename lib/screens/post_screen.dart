import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/posts/post.dart';
import 'package:tiktok_clone/posts/post_avatar.dart';
import 'package:tiktok_clone/posts/post_id.dart';
import 'package:tiktok_clone/posts/post_list_item_image.dart';
import 'package:tiktok_clone/posts/reaction_button.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({super.key, required this.post});
  final Post post;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        width: 250,
        height: 300,
        child: Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  postAvatar(user: post.user),
                  if (post.repliers.isNotEmpty) ...[
                    const SizedBox(height: 4),
                    Expanded(
                      child: SizedBox(
                        width: 2,
                        child: ColoredBox(color: Colors.grey.shade300),
                      ),
                    ),
                    const SizedBox(height: 4),
                  ],
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        postID(
                          id: post.user.username,
                          verified: post.user.verified,
                          dateTime: post.uploadDate,
                          user: post.user,
                        )
                      ],
                    ),
                  )
                ],
              ),
              Text(post.content),
              Row(
                children: [
                  if (post.imageUrl.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: PostListItemImage(imageUrls: post.imageUrl),
                    ),
                ],
              ),
              const reactionButton()
            ],
          ),
        ),
      ),
    );
  }
}
