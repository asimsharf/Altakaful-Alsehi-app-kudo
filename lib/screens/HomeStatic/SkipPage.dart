import 'package:flutter/material.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:takaful/language/app_translations.dart';

class SkipPage extends StatefulWidget {
  @override
  _SkipPageState createState() => _SkipPageState();
}

class _SkipPageState extends State<SkipPage> {
  List<Slide> slides = new List();

  @override
  void initState() {
    super.initState();

    slides.add(
      new Slide(
        title: "تطبيق التكافل الصحي",
        styleTitle: TextStyle(
          color: Colors.black,
          fontSize: 25.0,
          fontWeight: FontWeight.bold,
          fontFamily: ArabicFonts.Cairo,
          package: 'google_fonts_arabic',
        ),
        description:
            " التطبيق الأول في الخليج للراعية الصحية والعمل في مجال الصحة سارع بالحصول علي البطاقة العلاجية الأنتشكّل السرّية والخصوصيّة في أيّامنا هذه مسألة فائقة الأهميّة. ويُطبّق هذا المبدأ بنوع خاصّ في حال استخدام البيانات إلكترونيّاً.",
        styleDescription: TextStyle(
          color: Colors.black,
          fontSize: 15.0,
          fontFamily: ArabicFonts.Cairo,
          package: 'google_fonts_arabic',
        ),
        pathImage: "assets/images/logo.png",
        heightImage: 140.0,
        widthImage: 210.0,
        backgroundColor: Color(0xFFDFDAD6),
      ),
    );
    slides.add(
      new Slide(
        title: "شركة التكافل الصحي",
        styleTitle: TextStyle(
          color: Colors.black,
          fontSize: 25.0,
          fontWeight: FontWeight.bold,
          fontFamily: ArabicFonts.Cairo,
          package: 'google_fonts_arabic',
        ),
        description:
            "شركة متخصصة تعمل فى مجال تقديم الخدمات الطبية والرعاية الصحية للهيئات والشركات والجمعيات التعاونية والخيرية والأفراد بجميع شرائح المجتمع لضمان و توفير مستوى متميز من الخدمات لأعضاء هذه الهيئات ولأسرهم.",
        styleDescription: TextStyle(
          color: Colors.black,
          fontSize: 15.0,
          fontFamily: ArabicFonts.Cairo,
          package: 'google_fonts_arabic',
        ),
        pathImage: "assets/images/logo.png",
        heightImage: 140.0,
        widthImage: 210.0,
        backgroundColor: Color(0xFFDFDAD6),
      ),
    );
    slides.add(
      new Slide(
        title: 'برنامج التكافل الصحي',
        styleTitle: TextStyle(
          color: Colors.black,
          fontSize: 25.0,
          fontWeight: FontWeight.bold,
          fontFamily: ArabicFonts.Cairo,
          package: 'google_fonts_arabic',
        ),
        description:
            "أقوى بطاقة علاج نقدي في السعودية والخليج يقوم على فكرة الخصم النقدي المباشر بأفضل وأقل الأسعار (بنسب خصم تصل حتى 80%) في المجال الطبي للهيئات والشركات والأفراد في جميع التخصصات الطبية و العمليات الجراحية والتحاليل والأشعة والأدوية والنظارات وغيرها الكثير",
        styleDescription: TextStyle(
          color: Colors.black,
          fontSize: 15.0,
          fontFamily: ArabicFonts.Cairo,
          package: 'google_fonts_arabic',
        ),
        pathImage: "assets/images/logo.png",
        heightImage: 130.0,
        widthImage: 210.0,
        backgroundColor: Color(0xFFDFDAD6),
      ),
    );
  }

  void onDonePress() {
    // TODO: go to next screen
    Navigator.pushReplacementNamed(context, '/Home');
  }

  void onSkipPress() {
    // TODO: go to next screen
    onDonePress();
  }

  Widget renderNextBtn() {
    return Text(
      AppTranslations.of(context).text("next"),
      style: TextStyle(
        color: Color(0xFF23AFB1),
        fontSize: 12.0,
        fontWeight: FontWeight.bold,
        fontFamily: ArabicFonts.Cairo,
        package: 'google_fonts_arabic',
      ),
    );
  }

  Widget renderDoneBtn() {
    return Text(
      AppTranslations.of(context).text("done"),
      style: TextStyle(
        color: Color(0xFF23AFB1),
        fontSize: 12.0,
        fontWeight: FontWeight.bold,
        fontFamily: ArabicFonts.Cairo,
        package: 'google_fonts_arabic',
      ),
    );
  }

  Widget renderSkipBtn() {
    return Text(
      AppTranslations.of(context).text("skip"),
      style: TextStyle(
        color: Color(0xFF23AFB1),
        fontSize: 12.0,
        fontWeight: FontWeight.bold,
        fontFamily: ArabicFonts.Cairo,
        package: 'google_fonts_arabic',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new IntroSlider(
      // List slides
      slides: this.slides,

      // Skip button
      renderSkipBtn: this.renderSkipBtn(),
      onSkipPress: this.onSkipPress,
      highlightColorSkipBtn: Color(0xFFDFDAD6),

      // Next, Done button
      onDonePress: this.onDonePress,
      renderNextBtn: this.renderNextBtn(),
      renderDoneBtn: this.renderDoneBtn(),
      highlightColorDoneBtn: Color(0xFFDFDAD6),
      // Dot indicator
      colorDot: Color(0xFFE993B0),
      colorActiveDot: Color(0xFFE91E63),
      sizeDot: 13.0,
    );
  }
}
