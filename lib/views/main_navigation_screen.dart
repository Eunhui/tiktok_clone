import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:threads/features/utils.dart';
import 'package:threads/features/view_models/darkmode_config_vm.dart';
import 'package:threads/views/home_screen.dart';
import 'package:threads/views/like_screen.dart';
import 'package:threads/views/profile_screen.dart';
import 'package:threads/views/discover_screen.dart';
import 'package:threads/views/write_screen.dart';

import '../../../constants/sizes.dart';
import 'widgets/nav_tab.dart';

class MainNavigationScreen extends StatefulWidget {
  final Widget child;
  const MainNavigationScreen({
    required this.child,
    super.key,
  });
  static const String routeURL = '/';
  static const String routeName = '/';
  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  late int _selectedIndex = 0;

  bool isPanelOpen = false;

  void _onTap(int index) {
    switch (index) {
      case 0:
        context.go('/home');
        break;
      case 1:
        context.go('/discover');
        break;
      case 2:
        _onWriteTap();
        break;
      case 3:
        context.go('/like');
        break;
      case 4:
        context.go('/profile');
        break;
    }
    setState(() {
      _selectedIndex = index;
    });
  }

  _onWriteTap() {
    showModalBottomSheet(
      backgroundColor: Colors.white,
      context: context,
      builder: (context) => const WriteScreen(),
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.9,
      ),
      isScrollControlled: true,
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = context.watch<DarkmodeConfigVm>().Dark;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      //backgroundColor: Colors.white,

      body: widget.child,

      bottomNavigationBar: Container(
        color: isDark ? Colors.black : Colors.white,
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
                  text: "Discover",
                  isSelected: _selectedIndex == 1,
                  icon: FontAwesomeIcons.compass,
                  selectedIcon: FontAwesomeIcons.solidCompass,
                  onTap: () => _onTap(1),
                  selectedIndex: _selectedIndex,
                ),
                NavTab(
                  text: "Write",
                  isSelected: _selectedIndex == 2,
                  icon: FontAwesomeIcons.penToSquare,
                  selectedIcon: FontAwesomeIcons.solidPenToSquare,
                  onTap: () => _onWriteTap(),
                  selectedIndex: _selectedIndex,
                ),
                NavTab(
                  text: "Like",
                  isSelected: _selectedIndex == 3,
                  icon: FontAwesomeIcons.heart,
                  selectedIcon: FontAwesomeIcons.solidHeart,
                  onTap: () => _onTap(3),
                  selectedIndex: _selectedIndex,
                ),
                NavTab(
                  text: "Profile",
                  isSelected: _selectedIndex == 4,
                  icon: FontAwesomeIcons.user,
                  selectedIcon: FontAwesomeIcons.solidUser,
                  onTap: () => _onTap(4),
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
