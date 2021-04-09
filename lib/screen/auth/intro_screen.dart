import 'package:oversea_app/data/repository/auth_repository.dart';
import 'package:oversea_app/style/theme.dart' as Style;
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:introduction_screen/introduction_screen.dart';

import 'login_screen.dart';

class IntroPage extends StatefulWidget {
  final AuthapiRepository authapiRepository;
  IntroPage({Key key, @required this.authapiRepository}) : super(key: key);

  @override
  _IntroPageState createState() => _IntroPageState(authapiRepository);
}

class _IntroPageState extends State<IntroPage> {
  final AuthapiRepository authapiRepository;
  _IntroPageState(this.authapiRepository);
  bool clicked = false;
  void afterIntroComplete() {
    setState(() {
      clicked = true;
    });
  }

  final List<PageViewModel> pages = [
    PageViewModel(
        titleWidget: Column(
          children: <Widget>[
            Text(
              'FREE GIFT',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              height: 3,
              width: 100,
              decoration: BoxDecoration(
                  color: Style.Colors.orange,
                  borderRadius: BorderRadius.circular(10)),
            )
          ],
        ),
        body: "This is paragraph.",
        // image: Center(child: SvgPicture.asset("assets/icons/gift.svg")),
        image: Center(
          child: Image.asset("assets/images/img.png"),
        )),
    PageViewModel(
      titleWidget: Column(
        children: <Widget>[
          Text(
            "I'm with Stupid.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Container(
            height: 3,
            width: 100,
            decoration: BoxDecoration(
                color: Style.Colors.successGreen,
                borderRadius: BorderRadius.circular(10)),
          )
        ],
      ),
      body: "This is paragraph.",
      image: Center(
          child: SizedBox(
        width: 450.0,
        // child: SvgPicture.asset("assets/icons/payment.svg"),
        child: Image.asset("assets/images/img1.png"),
      )),
      decoration: const PageDecoration(
          pageColor: Colors.white,
          bodyTextStyle: TextStyle(
            color: Colors.black54,
            fontSize: 16,
          ),
          descriptionPadding: EdgeInsets.only(left: 20, right: 20),
          imagePadding: EdgeInsets.all(20)),
    ),
    PageViewModel(
      titleWidget: Column(
        children: <Widget>[
          Text(
            'CALL CENTER',
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 8,
          ),
          Container(
            height: 3,
            width: 100,
            decoration: BoxDecoration(
                color: Style.Colors.mainColor,
                borderRadius: BorderRadius.circular(10)),
          )
        ],
      ),
      body: "This is paragraph.",
      image: Center(
          child: SizedBox(
        width: 450.0,
        // child: SvgPicture.asset("assets/icons/call.svg"),
        child: Image.asset("assets/images/img3.png"),
      )),
      decoration: const PageDecoration(
          pageColor: Colors.white,
          bodyTextStyle: TextStyle(
            color: Colors.black54,
            fontSize: 16,
          ),
          descriptionPadding: EdgeInsets.only(left: 20, right: 20),
          imagePadding: EdgeInsets.all(20)),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return clicked
        ? LoginScreen(
            authapiRepository: authapiRepository,
          )
        : IntroductionScreen(
            pages: pages,
            onDone: () {
              afterIntroComplete();
            },
            onSkip: () {
              afterIntroComplete();
            },
            showSkipButton: true,
            skip: const Text('Skip',
                style:
                    TextStyle(fontWeight: FontWeight.w600, color: Colors.grey)),
            next: const Icon(Icons.navigate_next),
            done: const Text("DONE",
                style: TextStyle(fontWeight: FontWeight.w600)),
            dotsDecorator: DotsDecorator(
                size: const Size.square(7.0),
                activeSize: const Size(20.0, 5.0),
                activeColor: Style.Colors.mainColor,
                color: Colors.black12,
                spacing: const EdgeInsets.symmetric(horizontal: 3.0),
                activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0))),
          );
  }
}
