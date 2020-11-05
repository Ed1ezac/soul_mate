import 'package:Soulmate_App/styles.dart';
import 'package:flutter/material.dart';
import 'package:Soulmate_App/utils/widget_utils.dart';

import 'chats.dart';
import 'explore.dart';
import 'my_profile.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  List _pagesList = List();
  Widget _currentPage;

  @override
  void initState() {
    super.initState();

    _pagesList.add(Profile());
    _pagesList.add(Explore());
    _pagesList.add(Chat());
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
          if (_currentIndex == 1)
            IconButton(
              icon: Icon(Icons.tune),
              onPressed: () => _openFilterDialog(),
            ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () => {},
          ),
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
      onTap: (selectedIndex) => _changePage(selectedIndex),
      currentIndex: _currentIndex,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle),
          title: Text("profile"),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.find_in_page),
          title: Text("explore"),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.chat),
          title: Text("chats"),
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
              child: AlertDialog(
                shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0)),
                title: Text('Hello!!'),
                content: Text('Filter data loading...'),
              ),
            ),
          );
        },
        transitionDuration: Duration(milliseconds: 900),
        barrierDismissible: true,
        context: context,
        barrierLabel: '',
        barrierColor: Colors.black87,
        pageBuilder: (context, animation1, animation2) {});
  }
}
