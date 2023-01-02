import 'package:flutter/material.dart';

import '../../styles.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  double newVal = 0;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 0.33,
            //color: Colors.purple,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.0,
                      vertical: 8.0,
                    ),
                    child: Text(
                      "Edit",
                      style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w700,
                          color: AppColors.soulPrimary),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: 32.0,
                  ),
                  child: CircleAvatar(
                    radius: 64.0,
                    child: Container(
                      child: Text("E"),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: 8.0,
                  ),
                  child: Text(
                    "Edgar Kealeboga",
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700),
                  ),
                ),
                Text(
                  "Social Introvert",
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 14.0,
                  ),
                ),
              ],
            ),
          ),
          Container(
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
          )
        ],
      ),
    );
  }
}
