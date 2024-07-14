import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktok_clone/features/authentication/widgets/nav_tab.dart';
import 'package:tiktok_clone/features/repos/authentication_repo.dart';

import '../../../constants/sizes.dart';

class MainNavigationScreen extends ConsumerStatefulWidget {
  final Widget child;
  const MainNavigationScreen({
    required this.child,
    super.key,
  });
  static const String routeURL = '/';
  static const String routeName = '/';
  @override
  MainNavigationScreenState createState() => MainNavigationScreenState();
}

class MainNavigationScreenState extends ConsumerState<MainNavigationScreen> {
  late int _selectedIndex = 0;

  bool isPanelOpen = false;

  void _onTap(int index) {
    switch (index) {
      case 0:
        context.go('/home');
        break;
      case 1:
        context.go('/post');
        break;
      case 2:
        showCupertinoModalPopup(
          context: context,
          builder: (context) => CupertinoAlertDialog(
            title: const Text("Are you sure?"),
            content: const Text("Plz don't go"),
            actions: [
              CupertinoDialogAction(
                child: const Text("No",
                    style: TextStyle(
                      color: Colors.blue,
                    )),
                onPressed: () => Navigator.of(context).pop(),
              ),
              CupertinoDialogAction(
                isDestructiveAction: true,
                child: const Text("Yes"),
                onPressed: () => ref.read(authRepo).signOut(),
              ),
            ],
          ),
        );
        break;
    }
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: widget.child,
      bottomNavigationBar: Container(
        child: Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).padding.bottom + Sizes.size12,
          ),
          child: Padding(
            padding: const EdgeInsets.all(Sizes.size12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                NavTab(
                  text: "Home",
                  isSelected: _selectedIndex == 0,
                  icon: FontAwesomeIcons.house,
                  selectedIcon: FontAwesomeIcons.house,
                  onTap: () => _onTap(0),
                  selectedIndex: _selectedIndex,
                ),
                NavTab(
                  text: "Post",
                  isSelected: _selectedIndex == 1,
                  icon: FontAwesomeIcons.pencil,
                  selectedIcon: FontAwesomeIcons.solidCompass,
                  onTap: () => _onTap(1),
                  selectedIndex: _selectedIndex,
                ),
                NavTab(
                  text: "LogOut",
                  isSelected: _selectedIndex == 2,
                  icon: FontAwesomeIcons.personRunning,
                  selectedIcon: FontAwesomeIcons.solidCompass,
                  onTap: () => _onTap(2),
                  selectedIndex: _selectedIndex,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
