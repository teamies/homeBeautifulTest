import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:home_beautiful2/components/mytext.dart';
import 'package:home_beautiful2/core/_config.dart';
import 'package:page_transition/page_transition.dart';
import 'package:swipeable_page_route/swipeable_page_route.dart';

class Boarding extends StatelessWidget {
  const Boarding({super.key});
  static const colorizeColors = [
    Colors.white,
    Colors.blue,
    Colors.purple,
    Colors.yellow,
    Colors.red,
  ];

  void _handleSignUp(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil( context, "/signUp", (r) => false);
}
  @override
  Widget build(BuildContext context) {
    return Container(
        // height:  MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(30),
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/img/Boarding.png"))),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 30, bottom: 30, right: 10),
              child: MyText.baseText(
                  text: 'MAKE YOUR HOME BEAUTIFUL',
                  maxLine: 2,
                  color: colorLightBlack,
                  size:  42,
                  // fontWeight: FontWeight.w100,
                  fontFamily: 'PoppinsBold'),
            ),
            Expanded(
              child: DefaultTextStyle(
                style: MyText.textStyle(color: colorGray),
                child: AnimatedTextKit(
                  repeatForever: true,
                  animatedTexts: [
                    TyperAnimatedText(
                      'The best simple place where you discover most wonderful furniture and make you home beautiful',
                    ),
                  ],
                  onTap: () {
                    print("Tap Event");
                  },
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: TextButton(
                onPressed: (() {
                  _handleSignUp(context);
                  // Navigator.push(
                  //     context,
                  //     PageTransition(
                  //         duration: Duration(milliseconds: 650),
                  //         type: PageTransitionType.rightToLeft,
                  //         child: SignUp()));
                }),
                style: TextButton.styleFrom(
                    backgroundColor: Color(0xff242424),
                    padding: EdgeInsets.only(top: 15, bottom: 15)),
                child: AnimatedTextKit(
                  repeatForever: true,
                  animatedTexts: [
                    ColorizeAnimatedText(
                      'Get Started',
                      textStyle: MyText.textStyle(),
                      colors: colorizeColors,
                    ),
                  ],
                  isRepeatingAnimation: true,
                  onTap: () {
                    _handleSignUp(context);
                  },
                ),
              ),
            ),
          ],
        ));
  }
}
