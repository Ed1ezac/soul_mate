import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:soul_mate/pages/onboarding/welcome.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:soul_mate/pages/onboarding/list_tease.dart';
import 'package:soul_mate/pages/onboarding/chat_tease.dart';
//import 'package:soul_mate/styles.dart';

class OnBoardingCarousel extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CarouselState();
  }
}

class _CarouselState extends State<OnBoardingCarousel> {
  final CarouselController _controller = CarouselController();
  int _current = 0;

  @override
  void initState() {
    super.initState();
  }

  List<Widget> _pageList = [
    Welcome(),
    ListTease(),
    ChatTease(),
  ];

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          CarouselSlider(
            items: _pageList,
            options: CarouselOptions(
                height: height,
                viewportFraction: 1.0,
                enlargeCenterPage: false,
                enableInfiniteScroll: false,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                }),
            carouselController: _controller,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SafeArea(
              child: SingleChildScrollView(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _pageList.map((page) {
                    int index = _pageList.indexOf(page);
                    return Container(
                      width: 12.0,
                      height: 12.0,
                      margin:
                          EdgeInsets.symmetric(vertical: 12.0, horizontal: 3.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _current == index
                            ? Color.fromRGBO(255, 255, 255, 0.9)
                            : Color.fromRGBO(255, 255, 255, 0.3),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
          if (_current < 2)
            Align(
              alignment: Alignment.bottomRight,
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 8.0, bottom: 16.0, right: 24.0),
                  child: FlatButton(
                    onPressed: () => _controller.nextPage(),
                    child: Text(
                      'NEXT. .',
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}