import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:threads/constants/sizes.dart';

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
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            "Activity",
            style: TextStyle(
              fontSize: Sizes.size32,
              fontWeight: FontWeight.bold,
            ),
          ),
          elevation: 0,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(AppBar().preferredSize.height),
            child: Container(
              height: 45,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: TabBar(
                tabAlignment: TabAlignment.start,
                splashFactory: NoSplash.splashFactory,
                labelPadding: const EdgeInsets.symmetric(
                  horizontal: Sizes.size8,
                ),
                labelColor: Colors.white,
                unselectedLabelColor: Colors.black,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black,
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
        body: const Center(child: Text("favoriteScreen")),
      ),
    );
  }
}
