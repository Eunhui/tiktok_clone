import 'package:faker/faker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:threads/constants/gaps.dart';
import 'package:threads/constants/sizes.dart';
import 'package:threads/features/utils.dart';
import 'package:threads/utils.dart';
import 'package:threads/widgets/search_list.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({Key? key}) : super(key: key);

  static const String routeName = 'discover';
  static const String routeURL = '/discover';

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              title: const Text(
                'Search',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: Sizes.size24,
                ),
              ),
              pinned: true,
              floating: true,
              //forceElevated: innerBoxIsScrolled,
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(50.0),
                child: CupertinoSearchTextField(
                  style: TextStyle(
                    color: isDarkMode(context) ? Colors.white : Colors.black,
                  ),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return const Stack(
                    children: [
                      Column(
                        children: [search_list()],
                      ),
                    ],
                  );
                },
                childCount: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
