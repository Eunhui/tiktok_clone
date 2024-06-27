import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:threads/views/widgets/reply_circle_avartars.dart';

import '../../constants/sizes.dart';
import '../../utils.dart';

class ActivityCircleAvatars extends StatelessWidget {
  final int relationActivity;
  const ActivityCircleAvatars({
    super.key,
    required this.relationActivity,
  });

  Icon _relationIcon() {
    if (relationActivity == 1) {
      return const Icon(
        FontAwesomeIcons.at,
        color: Colors.green,
        size: Sizes.size16,
      );
    } else if (relationActivity == 2) {
      return const Icon(
        FontAwesomeIcons.reply,
        color: Colors.blue,
        size: Sizes.size16,
      );
    } else if (relationActivity == 3) {
      return const Icon(
        FontAwesomeIcons.user,
        color: Colors.purple,
        size: Sizes.size16,
      );
    }
    return const Icon(
      FontAwesomeIcons.heartCircleBolt,
      color: Colors.pink,
      size: Sizes.size16,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            CircleAvatar(
              foregroundImage: NetworkImage(
                getImage(),
              ),
              radius: Sizes.size24,
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white,
                    width: Sizes.size2,
                  ),
                ),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.white,
                  radius: Sizes.size8,
                  child: _relationIcon(),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
