import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:takaful/screens/account_center/CenterCreate.dart';
import 'package:takaful/screens/account_reset/ResetPassword.dart';
import 'package:takaful/screens/dashboard/DashboardManageCenter.dart';

class CenterLogin extends StatefulWidget {
  @override
  State createState() => _UserLogin();
}

class _UserLogin extends State<CenterLogin>
    with SingleTickerProviderStateMixin {
  Animation<double> _iconAnimation;
  AnimationController _iconAnimationController;

  @override
  void initState() {
    super.initState();
    _iconAnimationController = new AnimationController(
        vsync: this, duration: new Duration(milliseconds: 500));
    _iconAnimation = new CurvedAnimation(
      parent: _iconAnimationController,
      curve: Curves.bounceOut,
    );
    _iconAnimation.addListener(() => this.setState(() {}));
    _iconAnimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(fit: StackFit.expand, children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              "تسجيل دخول المراكز الطبية",
              style: TextStyle(
                color: Color(0xFF37505D),
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                fontFamily: ArabicFonts.Cairo,
                package: 'google_fonts_arabic',
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 40.0, right: 40.0),
              child: Form(
                autovalidate: true,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    TextFormField(
                      decoration: new InputDecoration(
                          prefixIcon: Icon(Icons.phone),
                          labelText: "البريد الإلكتروني",
                          fillColor: Color(0xFF37505D),
                          labelStyle: TextStyle(
                            fontFamily: ArabicFonts.Cairo,
                            package: 'google_fonts_arabic',
                            fontWeight: FontWeight.bold,
                          )),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    TextFormField(
                      decoration: new InputDecoration(
                          prefixIcon: Icon(Icons.lock),
                          labelText: "كلمة المرور",
                          fillColor: Color(0xFF37505D),
                          labelStyle: TextStyle(
                            fontFamily: ArabicFonts.Cairo,
                            package: 'google_fonts_arabic',
                            fontWeight: FontWeight.bold,
                          )),
                      keyboardType: TextInputType.text,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                    ),
                    MaterialButton(
                      height: 30.0,
                      minWidth: 200.0,
                      color: Color(0xFFE91E63),
                      splashColor: Color(0xFFFF1B5E),
                      textColor: Colors.white,
                      child: new Icon(FontAwesomeIcons.signInAlt),
                      onPressed: () {
                        Navigator.of(context).push(new MaterialPageRoute(
                            builder: (context) => new DashboardManageCenter()));
                      },
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    new GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(new MaterialPageRoute(
                            builder: (context) => new ResetPassword()));
                      },
                      child: new Text(
                        "هل نسيت كلمة المرور؟ إعادة تعيين الان",
                        style: TextStyle(
                          color: Color(0xFF37505D),
                          fontFamily: ArabicFonts.Cairo,
                          package: 'google_fonts_arabic',
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    new GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(new MaterialPageRoute(
                            builder: (context) => new CenterCreate()));
                      },
                      child: new Text(
                        "تسجيل مركز جديد الأن",
                        style: TextStyle(
                          color: Color(0xFF37505D),
                          fontFamily: ArabicFonts.Cairo,
                          package: 'google_fonts_arabic',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ]),
    );
  }
}
