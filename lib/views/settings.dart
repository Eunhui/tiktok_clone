import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:threads/constants/sizes.dart';
import 'package:threads/features/models/darkmode_config_model.dart';
import 'package:threads/features/view_models/darkmode_config_vm.dart';
import 'package:threads/main.dart';
import 'package:threads/views/widgets/Privacy.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});
  static const String routeURL = '/settings';
  static const String routeName = 'settings';

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  late DarkmodeConfigVm _darkmodeConfigVm;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _darkmodeConfigVm = Provider.of<DarkmodeConfigVm>(context, listen: false);
      _darkmodeConfigVm.addListener(_onDarkmodeConfigChanged);
    });
  }

  void _onDarkmodeConfigChanged() {
    if (mounted) {
      setState(() {});
    }
  }

  void dispose() {
    _darkmodeConfigVm.removeListener(_onDarkmodeConfigChanged);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Settings",
          style: TextStyle(
            fontSize: Sizes.size24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ListTile(
            contentPadding: EdgeInsets.symmetric(
                horizontal: Sizes.size20, vertical: Sizes.size10),
            leading: Icon(FontAwesomeIcons.userPlus),
            title: Text("Follow and invite friends"),
            trailing: Icon(FontAwesomeIcons.angleRight, color: Colors.grey),
          ),
          const ListTile(
            contentPadding: EdgeInsets.symmetric(
                horizontal: Sizes.size20, vertical: Sizes.size10),
            leading: Icon(FontAwesomeIcons.bell),
            title: Text("Notifications"),
            trailing: Icon(FontAwesomeIcons.angleRight, color: Colors.grey),
          ),
          ListTile(
            contentPadding: const EdgeInsets.symmetric(
                horizontal: Sizes.size20, vertical: Sizes.size10),
            leading: const Icon(FontAwesomeIcons.lock),
            title: const Text("Privacy"),
            trailing:
                const Icon(FontAwesomeIcons.angleRight, color: Colors.grey),
            onTap: () {
              GoRouter.of(context).go('/settings/privacy');
            },
          ),
          const ListTile(
            contentPadding: EdgeInsets.symmetric(
                horizontal: Sizes.size20, vertical: Sizes.size10),
            leading: Icon(FontAwesomeIcons.circleUser),
            title: Text("Account"),
            trailing: Icon(FontAwesomeIcons.angleRight, color: Colors.grey),
          ),
          SwitchListTile.adaptive(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: Sizes.size20,
              vertical: Sizes.size10,
            ),
            value: context.watch<DarkmodeConfigVm>().Dark,
            onChanged: (value) =>
                context.read<DarkmodeConfigVm>().setDark(value),
            //leading: Icon(FontAwesomeIcons.circleHalfStroke),
            title: const Text("Appearance"),
            //trailing: Icon(FontAwesomeIcons.angleRight, color: Colors.grey),
          ),
          const ListTile(
            contentPadding: EdgeInsets.symmetric(
                horizontal: Sizes.size20, vertical: Sizes.size10),
            leading: Icon(FontAwesomeIcons.lifeRing),
            title: Text("Help"),
            trailing: Icon(FontAwesomeIcons.angleRight, color: Colors.grey),
          ),
          const ListTile(
            contentPadding: EdgeInsets.symmetric(
                horizontal: Sizes.size20, vertical: Sizes.size10),
            leading: Icon(FontAwesomeIcons.circleInfo),
            title: Text("About"),
            trailing: Icon(FontAwesomeIcons.angleRight, color: Colors.grey),
          ),
          Divider(color: Colors.grey.shade300),
          ListTile(
            title: Text("Log out"),
            textColor: Colors.blue,
            onTap: () {
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
                      child: Text("Yes"),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ],
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
