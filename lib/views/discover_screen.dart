import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:threads/constants/sizes.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({Key? key}) : super(key: key);

  static const String routeName = 'discover';
  static const String routeURL = '/discover';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Search",
            style:
                TextStyle(fontSize: Sizes.size32, fontWeight: FontWeight.bold),
          ),
        ),
        body: const Column(
          children: [
            CupertinoSearchTextField(),
          ],
        ),
      ),
    );
  }
}
