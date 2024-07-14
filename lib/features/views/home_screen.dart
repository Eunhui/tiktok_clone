import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/authentication/widgets/mood_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const String routeURL = '/home';
  static const String routeName = 'home';

  @override
  Widget build(BuildContext context) {
    String mood = '😍';
    String content =
        'Today I feel amazing! I really like Flutter, I love building beautiful things!';
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '🔥MOOD🔥',
          style: TextStyle(
            fontSize: Sizes.size24,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            MoodCard(mood: mood, content: content),
          ],
        ),
      ),
    );
  }
}
