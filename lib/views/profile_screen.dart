import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:threads/constants/gaps.dart';
import 'package:threads/features/utils.dart';
import 'package:threads/features/view_models/darkmode_config_vm.dart';
import 'package:threads/views/settings.dart';
import 'package:threads/views/widgets/thread.dart';

import '../constants/sizes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  static const String routeURL = '/profile';
  static const String routeName = 'profile';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Row(
                      children: [
                        Icon(Icons.language, size: Sizes.size32),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(FontAwesomeIcons.instagram,
                            size: Sizes.size32),
                        Gaps.h20,
                        IconButton(
                          onPressed: () {
                            GoRouter.of(context).go('/settings');
                          },
                          icon: const Icon(FontAwesomeIcons.barsStaggered,
                              size: Sizes.size32),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 30,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Echo",
                                    style: TextStyle(
                                        fontSize: Sizes.size28,
                                        fontWeight: FontWeight.bold)),
                                Text(
                                  "polite_cat",
                                  style: TextStyle(
                                    fontSize: Sizes.size16,
                                  ),
                                ),
                              ]),
                          CircleAvatar(
                            foregroundImage:
                                AssetImage('assets/polite_cat.jpg'),
                            radius: 25,
                          ),
                        ],
                      ),
                      Gaps.v10,
                      const Row(
                        children: [
                          Text("Cat Meme Enthusiast!"),
                        ],
                      ), // image
                      Gaps.v10,
                      const Row(children: [Text("2 followers")]), // 2 followers
                      Gaps.v10,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            style: TextButton.styleFrom(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 43.0),
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
                            child: Text(
                              "Edit profile",
                              style: TextStyle(
                                fontSize: Sizes.size16,
                                fontWeight: FontWeight.w700,
                                color: context.watch<DarkmodeConfigVm>().Dark
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ),
                          Gaps.h20,
                          TextButton(
                            style: TextButton.styleFrom(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 43.0),
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
                            child: Text(
                              "Share profile",
                              style: TextStyle(
                                fontSize: Sizes.size16,
                                fontWeight: FontWeight.w700,
                                color: context.watch<DarkmodeConfigVm>().Dark
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ), //edit profile, share profile
                    ],
                  ),
                ),
              ],
            ),
          ),
          SliverPersistentHeader(
            delegate: CustomDelegate(),
            pinned: true,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return const Stack(
                  children: [
                    Column(
                      children: [
                        Thread(),
                        Gaps.v16,
                        Divider(
                          height: 0,
                          thickness: 1,
                        ),
                        Gaps.v16,
                      ],
                    ),
                  ],
                );
              },
              childCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}

class CustomDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Padding(
      padding: const EdgeInsets.only(top: 40.0),
      child: Container(
        height: maxExtent,
        //color: Colors.white,
        child: FractionallySizedBox(
          heightFactor: 1,
          child: Center(
            child: TabBar(
              //labelColor: Colors.black,
              tabs: [
                Text(
                  "Threads",
                  style: TextStyle(
                    fontSize: Sizes.size18,
                    color: context.watch<DarkmodeConfigVm>().Dark
                        ? Colors.white
                        : Colors.black,
                  ),
                ),
                Text(
                  "Replies",
                  style: TextStyle(
                    fontSize: Sizes.size18,
                    color: context.watch<DarkmodeConfigVm>().Dark
                        ? Colors.white
                        : Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => 100;

  @override
  // TODO: implement minExtent
  double get minExtent => 100;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    // TODO: implement shouldRebuild
    return true;
  }
}
