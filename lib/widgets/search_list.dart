import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:threads/constants/gaps.dart';
import 'package:threads/constants/sizes.dart';
import 'package:threads/utils.dart';

class search_list extends StatelessWidget {
  const search_list({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final faker = Faker();
    final random = RandomGenerator(seed: DateTime.now().millisecondsSinceEpoch);
    final userName = faker.internet.userName();
    final verified = random.integer(2);
    final nickName = userName.replaceAll('.', '_');
    final numberOfFollower = random.integer(100000);

    return ListTile(
      leading: CircleAvatar(
        foregroundImage: NetworkImage(
          getImage(),
        ),
        radius: 24,
      ),
      trailing: TextButton(
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
      ),
      title: Row(
        children: [
          Text(userName),
          Gaps.h8,
          verified == 1
              ? const Icon(Icons.verified, color: Colors.blue)
              : const SizedBox(height: 0),
        ],
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            nickName,
            style: const TextStyle(
              color: Colors.grey,
            ),
          ),
          numberOfFollower > 1000
              ? Text(
                  '${(numberOfFollower / 1000).toStringAsFixed(1)}k followers',
                  style: const TextStyle(fontWeight: FontWeight.w500),
                )
              : const Text(
                  '{numberOfFollower} followers',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
        ],
      ),
      isThreeLine: true,
    );
  }
}
