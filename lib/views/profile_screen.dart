import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:threads/constants/gaps.dart';

import '../constants/sizes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  static const String routeURL = '/profile';
  static const String routeName = 'profile';

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverAppBar(
          title: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.language, size: Sizes.size32),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(FontAwesomeIcons.instagram, size: Sizes.size32),
                      Gaps.h20,
                      Icon(FontAwesomeIcons.barsStaggered, size: Sizes.size32),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
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
                            const Text("Cat Meme Enthusiast!"),
                          ],
                        ), // image
                        Gaps.v10,
                        Row(children: [Text("2 followers")]), // 2 followers
                        Gaps.v10,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              style: TextButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 43.0),
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
                                "Edit profile",
                                style: TextStyle(
                                  fontSize: Sizes.size16,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Gaps.h20,
                            TextButton(
                              style: TextButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 43.0),
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
                                "Share profile",
                                style: TextStyle(
                                  fontSize: Sizes.size16,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black,
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
            ],
          ),
        ),
        SliverPersistentHeader(delegate: delegate)
      ],
    );
  }
}

class CustomDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    // TODO: implement build
    throw UnimplementedError();
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
    return false;
  }
}
