import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:http/http.dart' as http;
import 'package:takaful/screens/account_client/CreateClients.dart';
import 'package:takaful/screens/account_reset/ResetPassword.dart';

class UserLogin extends StatefulWidget {
  @override
  State createState() => _UserLogin();
}

String username = '';

class _UserLogin extends State<UserLogin> with SingleTickerProviderStateMixin {
  //login stuff
  TextEditingController user = new TextEditingController();
  TextEditingController pass = new TextEditingController();
  String msg = '';
  Future<List> _login() async {
    final response = await http
        .post("http://23.111.185.155:4000/takaful/api/client_login", body: {
      "username": user.text,
      "password": pass.text,
    });

    var datauser = json.decode(response.body);
    print(datauser);
    if (datauser.length == 0) {
      setState(() {
        msg = "Login Fail";
      });
    } else {
      if (datauser['response']['gender'] == 'male') {
        Navigator.pushReplacementNamed(context, '/profile');
      } else if (datauser['response']['gender'] == 'male') {
        Navigator.pushReplacementNamed(context, '/profile');
      }

      setState(() {
        username = datauser['response']['username'];
      });
    }

    return datauser;
  }

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
              "تسجيل دخول",
              style: TextStyle(
                color: Color(0xFF37505D),
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                fontFamily: ArabicFonts.Cairo,
                package: 'google_fonts_arabic',
              ),
            ),
            new Container(
              padding: const EdgeInsets.only(left: 40.0, right: 40.0),
              child: new Form(
                autovalidate: true,
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    new TextFormField(
                      controller: user,
                      decoration: new InputDecoration(
                          prefixIcon: Icon(Icons.phone),
                          labelText: "رقم الجوال او رقم الاشتراك",
                          fillColor: Color(0xFF37505D),
                          labelStyle: TextStyle(
                            fontFamily: ArabicFonts.Cairo,
                            package: 'google_fonts_arabic',
                            fontWeight: FontWeight.bold,
                          )),
                      keyboardType: TextInputType.phone,
                    ),
                    new TextFormField(
                      controller: pass,
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
                    new Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                    ),
                    new MaterialButton(
                      height: 30.0,
                      minWidth: 200.0,
                      color: Color(0xFFE91E63),
                      splashColor: Color(0xFFFF1B5E),
                      textColor: Colors.white,
                      child: new Icon(FontAwesomeIcons.signInAlt),
//                      onPressed: () {
//                        _login();
//                        Navigator.pop(context);
//                      },
                      onPressed: () => _login(),
                    ),
                    Text(
                      msg,
                      style: TextStyle(fontSize: 20.0, color: Colors.red),
                    ),
                    new SizedBox(
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
                    new SizedBox(
                      height: 10.0,
                    ),
                    new GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(new MaterialPageRoute(
                            builder: (context) => new CreateClients()));
                      },
                      child: new Text(
                        "لا تملك حساب ؟ سجل الان",
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
