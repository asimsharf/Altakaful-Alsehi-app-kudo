import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:url_launcher/url_launcher.dart';

class CallUs extends StatefulWidget {
  @override
  _CallUsState createState() => _CallUsState();
}

class _CallUsState extends State<CallUs>
    with SingleTickerProviderStateMixin, TickerProviderStateMixin {
  AnimationController _controllers;

  String result;

  @override
  void dispose() {
    _controllers.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controllers = new AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('معلومات الإتصال',
            style: TextStyle(
                fontFamily: ArabicFonts.Cairo,
                package: 'google_fonts_arabic',
                fontWeight: FontWeight.bold,
                fontSize: 20.0)),
      ),
      body: Stack(
        fit: StackFit.expand,
        alignment: Alignment.center,
        children: <Widget>[
          Column(
            children: <Widget>[
              new Container(
                height: 220.0,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(0.0),
                  child: FadeInImage.assetNetwork(
                    fit: BoxFit.fill,
                    placeholder: 'assets/images/avatar.png',
                    image:
                        'https://healthitsecurity.com/images/site/article_headers/_normal/2017-11-08large-data-breach.jpg',
                  ),
                ),
              ),
              new Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: <Widget>[
                      new Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("رقم الجوال",
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                  fontFamily: ArabicFonts.Cairo,
                                  package: 'google_fonts_arabic',
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF37505D),
                                  fontSize: 14.0)),
                          SizedBox(
                            width: 20.0,
                          ),
                          Text(
                            "209384572345",
                            style: TextStyle(
                              fontFamily: ArabicFonts.Cairo,
                              package: 'google_fonts_arabic',
                            ),
                          )
                        ],
                      ),
                      new Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("الواتساب",
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                  fontFamily: ArabicFonts.Cairo,
                                  package: 'google_fonts_arabic',
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF37505D),
                                  fontSize: 14.0)),
                          SizedBox(
                            width: 20.0,
                          ),
                          Text(
                            "209345875235",
                            style: TextStyle(
                              fontFamily: ArabicFonts.Cairo,
                              package: 'google_fonts_arabic',
                            ),
                          )
                        ],
                      ),
                      new Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("الموقع الإلكتروني",
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                  fontFamily: ArabicFonts.Cairo,
                                  package: 'google_fonts_arabic',
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF37505D),
                                  fontSize: 14.0)),
                          SizedBox(
                            width: 20.0,
                          ),
                          Text(
                            "http://takaful.com/",
                            style: TextStyle(
                              fontFamily: ArabicFonts.Cairo,
                              package: 'google_fonts_arabic',
                            ),
                          )
                        ],
                      ),
                      new Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("البريد الإلكتروني",
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                  fontFamily: ArabicFonts.Cairo,
                                  package: 'google_fonts_arabic',
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF37505D),
                                  fontSize: 14.0)),
                          SizedBox(
                            width: 20.0,
                          ),
                          Text(
                            "info@takaful.com",
                            style: TextStyle(
                              fontFamily: ArabicFonts.Cairo,
                              package: 'google_fonts_arabic',
                            ),
                          )
                        ],
                      ),
                      new Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("الدولة",
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                  fontFamily: ArabicFonts.Cairo,
                                  package: 'google_fonts_arabic',
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF37505D),
                                  fontSize: 14.0)),
                          SizedBox(
                            width: 20.0,
                          ),
                          Text(
                            "المملكة العربية السعودية",
                            style: TextStyle(
                              fontFamily: ArabicFonts.Cairo,
                              package: 'google_fonts_arabic',
                            ),
                          )
                        ],
                      ),
                      new Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("المدينة",
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                  fontFamily: ArabicFonts.Cairo,
                                  package: 'google_fonts_arabic',
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF37505D),
                                  fontSize: 14.0)),
                          SizedBox(
                            width: 20.0,
                          ),
                          Text(
                            "جدة",
                            style: TextStyle(
                              fontFamily: ArabicFonts.Cairo,
                              package: 'google_fonts_arabic',
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          // Profile image
          new Positioned(
            top: 120.0,
            child: Column(
              children: <Widget>[
                Container(
                  child: new Center(
                      child: new Stack(
                    children: <Widget>[
                      new Center(
                        child: Container(
                          height: 100.0,
                          width: 100.0,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: FadeInImage.assetNetwork(
                              fit: BoxFit.fill,
                              placeholder: 'assets/images/logo.png',
                              image:
                                  'https://healthitsecurity.com/images/site/article_headers/_normal/2017-11-08large-data-breach.jpg',
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: new Container(
        color: Colors.white,
        child: Row(
          children: <Widget>[
            new Expanded(
              child: new MaterialButton(
                onPressed: () => _ChackMakeCall(context),
                color: Color(0xFFE91E63),
                splashColor: Color(0xFFFFFF00),
                textColor: Colors.white,
                elevation: 0.2,
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: new Icon(Icons.call)),
              ),
            ),
            SizedBox(width: 3.0),
            new Expanded(
              child: new MaterialButton(
                onPressed: () => _ChackWhatsAppChat(context),
                color: Color(0xFFE91E63),
                splashColor: Color(0xFFFFFF00),
                textColor: Colors.white,
                elevation: 0.2,
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: new Icon(FontAwesomeIcons.whatsapp)),
              ),
            ),
            SizedBox(width: 3.0),
            new Expanded(
              child: new MaterialButton(
                onPressed: () => _ChackSendEmail(context),
                color: Color(0xFFE91E63),
                splashColor: Color(0xFFFFFF00),
                textColor: Colors.white,
                elevation: 0.2,
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: new Icon(Icons.email)),
              ),
            ),
            SizedBox(width: 3.0),
            new Expanded(
              child: new MaterialButton(
                onPressed: () => _ChackLanchWebSite(context),
                color: Color(0xFFE91E63),
                splashColor: Color(0xFFFFFF00),
                textColor: Colors.white,
                elevation: 0.2,
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: new Icon(FontAwesomeIcons.chrome)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _ChackMakeCall(context) {
    Alert(
        context: context,
        title: "إجراء مكالمة",
        content: Text(
          "هل تريد إجراء مكالمة",
          style: TextStyle(
              fontFamily: ArabicFonts.Cairo,
              package: 'google_fonts_arabic',
              color: Colors.black,
              fontSize: 20),
        ),
        buttons: [
          DialogButton(
            onPressed: () => launch("tel://109238047901"),
            color: Color(0xFFE91E63),
            child: Text(
              "موافق",
              style: TextStyle(
                  fontFamily: ArabicFonts.Cairo,
                  package: 'google_fonts_arabic',
                  color: Colors.white,
                  fontSize: 20),
            ),
          ),
        ]).show();
  }

  _ChackSendEmail(context) {
    Alert(
        context: context,
        title: "إرسال بريد إلكتروني",
        content: Text(
          "هل تريد إرسال بريد إلكتروني؟",
          style: TextStyle(
              fontFamily: ArabicFonts.Cairo,
              package: 'google_fonts_arabic',
              color: Colors.black,
              fontSize: 20),
        ),
        buttons: [
          DialogButton(
            onPressed: () => launch(
                "mailto://info@takaful.com?subject=طلب المساعدة من التطبيق&body=السلام عليكم ورحمة الله "),
            color: Color(0xFFE91E63),
            child: Text(
              "موافق",
              style: TextStyle(
                  fontFamily: ArabicFonts.Cairo,
                  package: 'google_fonts_arabic',
                  color: Colors.white,
                  fontSize: 20),
            ),
          ),
        ]).show();
  }

  _ChackWhatsAppChat(context) {
    Alert(
        context: context,
        title: "إجراء دردشة واتساب",
        content: Text(
          "هل تريد إجراء دردشة واتساب؟",
          style: TextStyle(
              fontFamily: ArabicFonts.Cairo,
              package: 'google_fonts_arabic',
              color: Colors.black,
              fontSize: 20),
        ),
        buttons: [
          DialogButton(
            onPressed: () => launch("whatsapp://send?phone=192384765"),
            color: Color(0xFFE91E63),
            child: Text(
              "موافق",
              style: TextStyle(
                  fontFamily: ArabicFonts.Cairo,
                  package: 'google_fonts_arabic',
                  color: Colors.white,
                  fontSize: 20),
            ),
          ),
        ]).show();
  }

  _ChackLanchWebSite(context) {
    Alert(
        context: context,
        title: "الذهاب إلى الموقع",
        content: Text(
          "هل تريد الذهاب الى الموقغ؟",
          style: TextStyle(
              fontFamily: ArabicFonts.Cairo,
              package: 'google_fonts_arabic',
              color: Colors.black,
              fontSize: 20),
        ),
        buttons: [
          DialogButton(
            onPressed: () => launch("http://almohamigroup.com/"),
            color: Color(0xFFE91E63),
            child: Text(
              "موافق",
              style: TextStyle(
                  fontFamily: ArabicFonts.Cairo,
                  package: 'google_fonts_arabic',
                  color: Colors.white,
                  fontSize: 20),
            ),
          ),
        ]).show();
  }
}
