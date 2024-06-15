import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:threads/constants/gaps.dart';
import 'package:threads/constants/sizes.dart';
import 'package:threads/utils.dart';
import 'package:threads/widgets/activity_circle_avatars.dart';

class ActivityList extends StatelessWidget {
  const ActivityList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final faker = Faker();
    final random = RandomGenerator(seed: DateTime.now().millisecondsSinceEpoch);
    final userName = faker.internet.userName();
    final following = random.integer(4);
    final nickName = userName.replaceAll('.', '_');
    final since = random.integer(60);
    final sentence = faker.lorem.sentence();
    final hasSentence = random.integer(3) != 0;
    final relationActivity = random.integer(4);

    return ListTile(
      leading: ActivityCircleAvatars(relationActivity: relationActivity),
      trailing: following == 0
          ? TextButton(
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                  side: BorderSide(
                    color: Colors.grey,
                    width: 1,
                  ),
                ),
              ),
              onPressed: () {},
              child: const Text(
                "Follow",
                style: TextStyle(
                  fontSize: Sizes.size14,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
            )
          : const SizedBox(height: 30),
      title: Row(
        children: [
          Text(userName),
          Gaps.h8,
          Text(
            "${since}h",
            style: const TextStyle(color: Colors.grey),
          ),
        ],
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (hasSentence)
            Text(
              sentence,
              maxLines: 1,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
          if (relationActivity == 1)
            const Text(
              "Mentioned you",
              maxLines: 1,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          if (relationActivity == 3)
            const Text(
              "Followed you",
              maxLines: 1,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
        ],
      ),
      isThreeLine: true,
    );
  }
}
