import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:threads/constants/sizes.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

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
          const ListTile(
            contentPadding: EdgeInsets.symmetric(
                horizontal: Sizes.size20, vertical: Sizes.size10),
            leading: Icon(FontAwesomeIcons.lock),
            title: Text("Privacy"),
            trailing: Icon(FontAwesomeIcons.angleRight, color: Colors.grey),
          ),
          const ListTile(
            contentPadding: EdgeInsets.symmetric(
                horizontal: Sizes.size20, vertical: Sizes.size10),
            leading: Icon(FontAwesomeIcons.circleUser),
            title: Text("Account"),
            trailing: Icon(FontAwesomeIcons.angleRight, color: Colors.grey),
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
                  title: Text("Are you sure?"),
                  content: Text("Plz don't go"),
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
