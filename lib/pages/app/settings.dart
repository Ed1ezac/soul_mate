import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 32.h,
          ),
          child: Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Divider(),
                ListTile(
                  onTap: () {},
                  leading: Icon(
                    Icons.settings,
                    color: Colors.grey,
                  ),
                  title: Text(
                    "Settings",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  trailing: Icon(Icons.navigate_next),
                ),
                Divider(),
                ListTile(
                  onTap: () {},
                  leading: Icon(
                    Icons.redeem,
                    color: Colors.amber[900],
                  ),
                  title: Text(
                    "Subscriptions",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  trailing: Icon(Icons.navigate_next),
                ),
                Divider(),
                ListTile(
                  onTap: () {},
                  leading: Icon(
                    Icons.storage,
                    color: Colors.blueGrey,
                  ),
                  title: Text(
                    "Chat Backup & Restore",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  trailing: Icon(Icons.navigate_next),
                ),
                Divider(),
                ListTile(
                  onTap: () {},
                  leading: Icon(
                    Icons.gavel,
                    color: Colors.purple[800],
                  ),
                  title: Text(
                    "Terms & Policies",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  trailing: Icon(Icons.navigate_next),
                ),
                Divider(),
                ListTile(
                  onTap: () {},
                  leading: Icon(
                    Icons.exit_to_app,
                    color: Colors.red,
                  ),
                  title: Text(
                    "Log Out",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  trailing: Icon(Icons.navigate_next),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
