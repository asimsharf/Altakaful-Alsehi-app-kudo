import 'package:flutter/material.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:takaful/language/app_translations.dart';
import 'package:takaful/screens/HomeStatic/SkipPage.dart';

class SplashScreenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 5,
      navigateAfterSeconds: new SkipPage(),
      photoSize: 80.0,
      loaderColor: Colors.white,
      image: Image.asset("assets/images/white_logo.png"),
      gradientBackground: new LinearGradient(
          colors: [Color(0xFF23AFB1), Color(0xFF23AFB1)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight),
      title: Text(AppTranslations.of(context).text("takaful_health"),
          style: TextStyle(
              color: Colors.white,
              fontSize: 40.0,
              fontFamily: ArabicFonts.Cairo,
              package: 'google_fonts_arabic',
              fontWeight: FontWeight.bold)),
      loadingText: Text(AppTranslations.of(context).text("loading_text"),
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontFamily: ArabicFonts.Cairo,
            package: 'google_fonts_arabic',
          )),
      styleTextUnderTheLoader: new TextStyle(),
      onClick: () => print("Takaful"),
    );
  }
}
