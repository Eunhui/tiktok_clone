import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:threads/constants/sizes.dart';
import 'package:threads/features/utils.dart';
import 'package:threads/features/view_models/darkmode_config_vm.dart';

class WriteScreen extends ConsumerStatefulWidget {
  const WriteScreen({
    super.key,
  });

  static const String routeURL = '/write';
  static const String routeName = 'write';

  @override
  WriteScreenState createState() => WriteScreenState();
}

class WriteScreenState extends ConsumerState<WriteScreen> {
  bool isPost = false;
  @override
  Widget build(BuildContext context) {
    bool isdark = ref.watch(darkmodeConfigProvider).isdark;
    return Scaffold(
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Cancel',
                    style: TextStyle(
                      color: isdark ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Text(
                  "New Thread",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: Sizes.size16,
                  ),
                ),
                isPost
                    ? TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Post',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    : const SizedBox(width: 64),
              ],
            ),
            const Divider(thickness: 1),
            Padding(
              padding: const EdgeInsets.only(top: 12, left: 10, right: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        const CircleAvatar(
                          foregroundImage: AssetImage('assets/polite_cat.jpg'),
                          radius: 25,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
                            top: 8.0,
                            bottom: 8,
                          ),
                          child: SizedBox(
                            height: 50,
                            child: VerticalDivider(
                              color: Colors.grey,
                              thickness: 2,
                              width: 2,
                            ),
                          ),
                        ),
                        Stack(
                          children: [
                            const CircleAvatar(
                              foregroundImage:
                                  AssetImage('assets/polite_cat.jpg'),
                              radius: 12,
                            ),
                            Positioned.fill(
                              child: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white.withOpacity(0.5),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: Sizes.size14),
                  Expanded(
                    flex: 5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "polite_cat",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextFormField(
                          maxLines: null,
                          onChanged: (value) {
                            if (value.isEmpty) {
                              setState(() {
                                isPost = false;
                              });
                            } else {
                              setState(() {
                                isPost = true;
                              });
                            }
                          },
                          decoration: const InputDecoration(
                            hintText: "Start a thread...",
                            border: InputBorder.none,
                            hintStyle: TextStyle(fontSize: 14),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(0.0),
                          width: 0,
                          child: IconButton(
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(),
                            iconSize: 20,
                            onPressed: () {
                              /*setState(() {
                                  GoRouter(
                                    routes: [
                                      GoRoute(
                                        path: "/",
                                        builder: (context, state) =>
                                            const VideoRecording(),
                                      ),
                                    ],
                                  );
                                });*/
                            },
                            icon: const Icon(
                              FontAwesomeIcons.paperclip,
                            ),
                            color: Colors.grey,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
