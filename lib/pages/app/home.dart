import 'package:Soulmate_App/pages/app/notifications.dart';
import 'package:Soulmate_App/styles.dart';
import 'package:Soulmate_App/widgets/filter_dialog_content.dart';
import 'package:flutter/material.dart';
import 'package:Soulmate_App/utils/widget_utils.dart';

import 'chats_list.dart';
import 'explore.dart';
import 'my_profile.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  List _pagesList = [];
  late Widget _currentPage;

  @override
  void initState() {
    super.initState();
    _pagesList.add(new Explore());
    _pagesList.add(ChatsList());
    _pagesList.add(Notifications());
    _pagesList.add(Profile());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Soulmate",
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24.0),
        ),
        actions: <Widget>[
          if (_currentIndex == 0)
            IconButton(
              icon: Icon(Icons.tune),
              onPressed: () => _openFilterDialog(),
            ),
          if (_currentIndex == 1)
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () => {},
            ),
          // IconButton(
          //   icon: Icon(Icons.more_vert),
          //   onPressed: () => {},
          // ),
        ],
      ),
      backgroundColor: Color(0xfafafaff),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenAwareSizeH(8.0, context),
            vertical: screenAwareSizeV(8.0, context),
          ),
          child: _currentPage,
        ),
      ),
      bottomNavigationBar: bottomNavBar(context),
    );
  }

  Widget bottomNavBar(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: AppColors.soulPrimary,
      unselectedItemColor: Colors.grey[400],
      showUnselectedLabels: true,
      onTap: (selectedIndex) => _changePage(selectedIndex),
      currentIndex: _currentIndex,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.find_in_page),
          label: "explore",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.chat),
          label: "chats",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications),
          label: "notifications",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle),
          label: "profile",
        ),
      ],
    );
  }

  void _changePage(int selectedIndex) {
    setState(() {
      _currentIndex = selectedIndex;
      _currentPage = _pagesList[selectedIndex];
    });
  }

  void _openFilterDialog() {
    showGeneralDialog(
        transitionBuilder: (context, anim1, anim2, widget) {
          final curvedValue = Curves.easeInOutBack.transform(anim1.value) - 1.0;
          return Transform(
            transform: Matrix4.translationValues(0.0, curvedValue * 200, 0.0),
            child: Opacity(
              opacity: anim1.value,
              child: Dialog(
                insetPadding: EdgeInsets.fromLTRB(
                  screenAwareSizeH(16.0, context), //left
                  screenAwareSizeV(16.0, context), //top
                  screenAwareSizeH(16.0, context), //right
                  screenAwareSizeV(24.0, context), //bottom
                ),
                shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(16.0)), //this right here,
                child: FilterDialog(),
              ),
            ),
          );
        },
        transitionDuration: Duration(milliseconds: 900),
        barrierDismissible: true,
        context: context,
        barrierLabel: 'filter',
        barrierColor: Colors.black87,
        pageBuilder: (context, animation1, animation2) {
          return Container();
        });
  }
}
