import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:threads/constants/sizes.dart';

class WriteScreen extends StatefulWidget {
  const WriteScreen({
    Key? key,
    required this.panelController,
  }) : super(key: key);
  final PanelController panelController;
  static const String routeURL = '/write';
  static const String routeName = 'write';

  @override
  State<WriteScreen> createState() => _WriteScreenState();
}

class _WriteScreenState extends State<WriteScreen> {
  bool isPost = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {
                  widget.panelController.close();
                },
                child: const Text(
                  'Cancel',
                  style: TextStyle(
                    color: Colors.black,
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
            padding: const EdgeInsets.only(top: 12),
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
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
