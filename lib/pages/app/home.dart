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
        title: Text("Soulmate"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.tune),
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
}
