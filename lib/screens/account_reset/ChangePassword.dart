import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts_arabic/fonts.dart';

class ChangePassword extends StatefulWidget {
  @override
  State createState() => _ChangePassword();
}

class _ChangePassword extends State<ChangePassword>
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
              "تغير كلمة المرور",
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
                          prefixIcon: Icon(FontAwesomeIcons.lock),
                          labelText: "كلمة المرور الجديدة",
                          fillColor: Color(0xFF37505D),
                          labelStyle: TextStyle(
                            fontFamily: ArabicFonts.Cairo,
                            package: 'google_fonts_arabic',
                            fontWeight: FontWeight.bold,
                          )),
                      keyboardType: TextInputType.phone,
                    ),
                    TextFormField(
                      decoration: new InputDecoration(
                          prefixIcon: Icon(FontAwesomeIcons.lock),
                          labelText: "تأكيد كلمة المرور الجديدة",
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
                      child: new Text(
                        "تغير",
                        style: TextStyle(
                          fontFamily: ArabicFonts.Cairo,
                          package: 'google_fonts_arabic',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () {},
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
