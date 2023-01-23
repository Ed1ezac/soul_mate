import 'package:flutter/material.dart';

class NavMenuListTile extends StatelessWidget {
  const NavMenuListTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Icon(Icons.info_outline_rounded),
          title: Text("Dating App"),
          subtitle: Text("Love at your fingertips!"),
          enabled: false,
        ),
        ListTile(
          leading: Icon(Icons.filter_alt_outlined),
          title: Text("Filter "),
        ),
        ListTile(
          leading: Icon(Icons.nightlight_outlined),
          title: Text("App Theme"),
          trailing: Text(
            "Light",
            style: Theme.of(context).primaryTextTheme.caption,
          ),
        ),
        Divider(color: Colors.grey),
        ListTile(
          leading: Icon(Icons.star_border_outlined),
          title: Text("Rate Us"),
        ),
        ListTile(
          leading: Icon(Icons.article_outlined),
          title: Text("Terms & Conditions"),
        ),
        ListTile(
          leading: Icon(
            Icons.shield_outlined,
          ),
          title: Text("Privacy Policy"),
        ),
      ],
    );
  }
}
