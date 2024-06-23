import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:threads/constants/sizes.dart';
import 'package:threads/features/utils.dart';
import 'package:threads/widgets/activity_list.dart';

final tabs = [
  "All",
  "Follows",
  "Replies",
  "Mentions",
  "Quotes",
  "Reposts",
  "Verified",
];

class LikeScreen extends StatefulWidget {
  const LikeScreen({Key? key}) : super(key: key);
  @override
  State<LikeScreen> createState() => _LikeScreenState();
}

class _LikeScreenState extends State<LikeScreen> {
  int currentIndexTab = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              title: const Text(
                "Activity",
                style: TextStyle(
                  fontSize: Sizes.size32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              pinned: true,
              floating: true,
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(AppBar().preferredSize.height),
                child: Container(
                  height: 45,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  child: TabBar(
                    tabAlignment: TabAlignment.start,
                    splashFactory: NoSplash.splashFactory,
                    labelPadding: const EdgeInsets.symmetric(
                      horizontal: Sizes.size8,
                    ),
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: isDarkMode(context) ? Colors.white : Colors.black,
                    ),
                    onTap: (index) => setState(() {
                      currentIndexTab = index;
                    }),
                    dividerColor: Colors.transparent,
                    labelStyle: const TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                    isScrollable: true,
                    tabs: [
                      for (var tab in tabs)
                        Container(
                          width: 100,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: currentIndexTab == (tabs.indexOf(tab))
                                  ? Colors.transparent
                                  : Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          // width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                            horizontal: Sizes.size10,
                          ),
                          child: Tab(
                            text: tab,
                          ),
                        ),
                    ],
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
                        children: [ActivityList()],
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
