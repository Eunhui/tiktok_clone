import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/screens/post_screen.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const SliverAppBar(
              title: Center(
                child: Icon(
                  FontAwesomeIcons.threads,
                  size: 36,
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate((context, length) {
                return const PostScreen();
              }),
            )
          ],
        ),
      ),
    );
  }
}
