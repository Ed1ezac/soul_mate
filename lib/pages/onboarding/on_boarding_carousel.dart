import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:Soulmate_App/utils/widget_utils.dart';
import 'package:Soulmate_App/pages/onboarding/welcome.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:Soulmate_App/pages/onboarding/list_tease.dart';
import 'package:Soulmate_App/pages/onboarding/chat_tease.dart';
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
                      width: screenAwareSizeH(12.0, context),
                      height: screenAwareSizeV(12.0, context),
                      margin: EdgeInsets.symmetric(
                          vertical: screenAwareSizeV(12.0, context),
                          horizontal: screenAwareSizeH(3.0, context)),
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
                  padding: EdgeInsets.only(
                    left: screenAwareSizeH(8.0, context),
                    bottom: screenAwareSizeV(16.0, context),
                    right: screenAwareSizeH(24.0, context),
                  ),
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
