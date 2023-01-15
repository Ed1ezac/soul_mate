import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:Soulmate_App/pages/onboarding/welcome.dart';
import 'package:Soulmate_App/pages/onboarding/list_tease.dart';
import 'package:Soulmate_App/pages/onboarding/chat_tease.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
//import 'package:soul_mate/styles.dart';

class OnBoardingCarousel extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CarouselState();
  }
}

class _CarouselState extends State<OnBoardingCarousel> {
  final CarouselController _controller = CarouselController();
  int _currentPage = 0;
  final List<Widget> _pageList = [
    Welcome(),
    ListTease(),
    ChatTease(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          CarouselSlider(
            items: _pageList,
            options: CarouselOptions(
                height: 1.sh,
                viewportFraction: 1.0,
                enlargeCenterPage: false,
                enableInfiniteScroll: false,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentPage = index;
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
                      width: 12.w,
                      height: 12.w,
                      margin:
                          EdgeInsets.symmetric(vertical: 12.h, horizontal: 4.w),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _currentPage == index
                            ? Color.fromRGBO(255, 255, 255, 0.9)
                            : Color.fromRGBO(255, 255, 255, 0.3),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
          if (_currentPage < 2)
            Align(
              alignment: Alignment.bottomRight,
              child: SafeArea(
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 8.w,
                    bottom: 16.h,
                    right: 24.w,
                  ),
                  child: TextButton(
                    onPressed: () => _controller.nextPage(),
                    child: Text(
                      'NEXT...',
                      style: TextStyle(
                        fontSize: 18.sp,
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
