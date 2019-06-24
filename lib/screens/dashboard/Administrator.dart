import 'package:flutter/material.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:takaful/language/app_translations.dart';

class Administrator extends StatefulWidget {
  @override
  _AdministratorState createState() => _AdministratorState();
}

class _AdministratorState extends State<Administrator>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: const Text('بيانات المسؤول',
                style: TextStyle(
                    fontFamily: ArabicFonts.Cairo,
                    package: 'google_fonts_arabic',
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: Colors.white)),
            pinned: true,
            floating: false,
            expandedHeight: 256,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  FadeInImage.assetNetwork(
                    fit: BoxFit.cover,
                    placeholder: 'assets/images/avatar.png',
                    image:
                        'https://healthitsecurity.com/images/site/article_headers/_normal/2017-11-08large-data-breach.jpg',
                  ),
                  const DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: <Color>[Colors.black54, Color(0x00000000)],
                          stops: [0.0, 2.0],
                          begin: FractionalOffset.bottomCenter,
                          end: FractionalOffset.topCenter,
                          tileMode: TileMode.mirror),
                    ),
                  ),
                ],
              ),
            ),
          ),
          new SliverList(
            delegate: SliverChildListDelegate(
              [
                //إسم المسؤول
                new Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("الإسم بالكامل",
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
                      "د.علي محمد احمد الخالدي",
                      style: TextStyle(
                        fontFamily: ArabicFonts.Cairo,
                        package: 'google_fonts_arabic',
                      ),
                    )
                  ],
                ),
                //رقم الهاتف
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
                      "0987654321",
                      style: TextStyle(
                        fontFamily: ArabicFonts.Cairo,
                        package: 'google_fonts_arabic',
                      ),
                    )
                  ],
                ),
                //البريد الالكتروني
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
                      "someOne@compay.com",
                      style: TextStyle(
                        fontFamily: ArabicFonts.Cairo,
                        package: 'google_fonts_arabic',
                      ),
                    )
                  ],
                ),
                //كلمة المرر
                new Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("كلمة المرور",
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
                      "********",
                      style: TextStyle(
                        fontFamily: ArabicFonts.Cairo,
                        package: 'google_fonts_arabic',
                      ),
                    )
                  ],
                ),
                //رقم الهوية
                new Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("رقم الهوية",
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
                      "5JK34345HJ2G35",
                      style: TextStyle(
                        fontFamily: ArabicFonts.Cairo,
                        package: 'google_fonts_arabic',
                      ),
                    )
                  ],
                ),
                //الجنس
                new Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("الجنس",
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
                      "ذكر",
                      style: TextStyle(
                        fontFamily: ArabicFonts.Cairo,
                        package: 'google_fonts_arabic',
                      ),
                    )
                  ],
                ),
                //الجنسية
                new Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("الجنسية",
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
                      "سعودي",
                      style: TextStyle(
                        fontFamily: ArabicFonts.Cairo,
                        package: 'google_fonts_arabic',
                      ),
                    )
                  ],
                ),
                //تاريخ الميلاد
                new Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("تاريخ الميلاد",
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
                      "1993/1/1",
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
        ],
      ),
      bottomNavigationBar: new Container(
        color: Colors.white,
        child: Row(
          children: <Widget>[
            Expanded(
              child: new FlatButton(
                onPressed: () {
                  Navigator.popAndPushNamed(context, '/EditAdministrator');
                },
                color: Color(0xFFE91E63),
                splashColor: Color(0xFFFF1B5E),
                textColor: Colors.white,
                //elevation: 0.2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new Text(AppTranslations.of(context).text("edit"),
                      style: TextStyle(
                          fontFamily: ArabicFonts.Cairo,
                          package: 'google_fonts_arabic',
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
