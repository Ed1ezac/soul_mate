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
    return Center(
      child: Container(
        height: 70,
        width: 60,
        color: Colors.purple,
      ),
    );
  }
}
