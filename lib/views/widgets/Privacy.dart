import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:threads/constants/sizes.dart';

class Privacy extends StatefulWidget {
  const Privacy({super.key});

  @override
  State<Privacy> createState() => _PrivacyState();

  static const String routeURL = '/privacy';
  static const String routeName = 'privacy';
}

class _PrivacyState extends State<Privacy> {
  bool _notification = false;
  void _onPrivateChanged(bool? newValue) {
    if (newValue == null) return;
    setState(() {
      _notification = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Privacy",
          style: TextStyle(
            fontSize: Sizes.size24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SwitchListTile(
              contentPadding: const EdgeInsets.symmetric(
                  horizontal: Sizes.size20, vertical: Sizes.size10),
              secondary: const Icon(FontAwesomeIcons.lock),
              title: const Text("Private profile"),
              value: _notification,
              onChanged: (bool value) {
                _onPrivateChanged(value);
              }),
          const ListTile(
            contentPadding: EdgeInsets.symmetric(
                horizontal: Sizes.size20, vertical: Sizes.size10),
            leading: Icon(FontAwesomeIcons.at),
            title: Text("Mentions"),
            trailing: Row(mainAxisSize: MainAxisSize.min, children: [
              Text("Everyone", style: TextStyle(color: Colors.grey)),
              Icon(FontAwesomeIcons.angleRight, color: Colors.grey),
            ]),
          ),
          const ListTile(
            contentPadding: EdgeInsets.symmetric(
                horizontal: Sizes.size20, vertical: Sizes.size10),
            leading: Icon(FontAwesomeIcons.bellSlash),
            title: Text("Muted"),
            trailing: Icon(FontAwesomeIcons.angleRight, color: Colors.grey),
          ),
          const ListTile(
            contentPadding: EdgeInsets.symmetric(
                horizontal: Sizes.size20, vertical: Sizes.size10),
            leading: Icon(FontAwesomeIcons.eyeSlash),
            title: Text("Hidden Words"),
            trailing: Icon(FontAwesomeIcons.angleRight, color: Colors.grey),
          ),
          const ListTile(
            contentPadding: EdgeInsets.symmetric(
                horizontal: Sizes.size20, vertical: Sizes.size10),
            leading: Icon(FontAwesomeIcons.userGroup),
            title: Text("Profiles you follow"),
            trailing: Icon(FontAwesomeIcons.angleRight, color: Colors.grey),
          ),
          Divider(color: Colors.grey.shade300),
          const ListTile(
            contentPadding: EdgeInsets.symmetric(
                horizontal: Sizes.size20, vertical: Sizes.size10),
            title: Text("Other privacy settings"),
            subtitle: Text(
              "Some settings, like restrict, apply to both\nthreads and instagram and can be managed\non Instagram.",
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
            trailing: Icon(FontAwesomeIcons.arrowUpRightFromSquare,
                color: Colors.grey),
          ),
          const ListTile(
            contentPadding: EdgeInsets.symmetric(
                horizontal: Sizes.size20, vertical: Sizes.size10),
            leading: Icon(FontAwesomeIcons.ban),
            title: Text("Blocked profiles"),
            trailing: Icon(FontAwesomeIcons.arrowUpRightFromSquare,
                color: Colors.grey),
          ),
          const ListTile(
            contentPadding: EdgeInsets.symmetric(
                horizontal: Sizes.size20, vertical: Sizes.size10),
            leading: Icon(FontAwesomeIcons.heartCrack),
            title: Text("Hide likes"),
            trailing: Icon(FontAwesomeIcons.arrowUpRightFromSquare,
                color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
