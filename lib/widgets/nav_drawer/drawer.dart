import 'package:Soulmate_App/widgets/nav_drawer/menu_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            currentAccountPicture:
                Icon(Icons.face, size: 48.h, color: Colors.white),
            accountName: Text("Username"),
            accountEmail: Text("email"),
            decoration: BoxDecoration(
              // image: DecorationImage(
              //   image: AssetImage('assets/images/event_image.jpg'),
              //   fit: BoxFit.cover,
              // ),
              color: Theme.of(context).primaryColor,
            ),
          ),
          const NavMenuListTile(),
        ],
      ),
    );
  }
}
