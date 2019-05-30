import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts_arabic/fonts.dart';

class CreateEmployee extends StatefulWidget {
  @override
  _CreateEmployeeState createState() => _CreateEmployeeState();
}

class _CreateEmployeeState extends State<CreateEmployee> {
  String name;
  String phone;
  String email;
  String functionalNumber;
  String department;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(15.0),
        child: new ListView(
          children: <Widget>[
            new Padding(
              padding: const EdgeInsets.only(top: 2.0),
              child: new Text(
                "إشتراك موظف",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: ArabicFonts.Cairo,
                    fontSize: 25.0,
                    package: 'google_fonts_arabic',
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF23AFB1)),
              ),
            ),

            TextField(
              controller: null,
              maxLength: 32,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 0.0),
                counterStyle: TextStyle(color: Color(0xFF37505D)),
                prefixIcon: Icon(FontAwesomeIcons.userCircle),
                labelText: 'إسم الموظف',
                labelStyle: TextStyle(
                    fontFamily: ArabicFonts.Cairo,
                    package: 'google_fonts_arabic',
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF37505D)),
              ),
              keyboardType: TextInputType.text,
              onChanged: (String value) {
                setState(() {
                  name = value;
                });
              },
            ),

            TextField(
              controller: null,
              maxLength: 32,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 0.0),
                counterStyle: TextStyle(color: Color(0xFF37505D)),
                prefixIcon: Icon(FontAwesomeIcons.idCardAlt),
                labelText: 'الرقم الوطني',
                labelStyle: TextStyle(
                    fontFamily: ArabicFonts.Cairo,
                    package: 'google_fonts_arabic',
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF37505D)),
              ),
              keyboardType: TextInputType.number,
              onChanged: (String value) {
                setState(() {
                  functionalNumber = value;
                });
              },
            ),
            TextField(
              controller: null,
              maxLength: 32,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 0.0),
                counterStyle: TextStyle(color: Color(0xFF37505D)),
                prefixIcon: Icon(FontAwesomeIcons.phone),
                labelText: 'رقم الجوال',
                labelStyle: TextStyle(
                    fontFamily: ArabicFonts.Cairo,
                    package: 'google_fonts_arabic',
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF37505D)),
              ),
              keyboardType: TextInputType.number,
              onChanged: (String value) {
                setState(() {
                  phone = value;
                });
              },
            ),
            TextField(
              controller: null,
              maxLength: 32,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 0.0),
                counterStyle: TextStyle(color: Color(0xFF37505D)),
                prefixIcon: Icon(FontAwesomeIcons.clinicMedical),
                labelText: 'التخصص',
                labelStyle: TextStyle(
                    fontFamily: ArabicFonts.Cairo,
                    package: 'google_fonts_arabic',
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF37505D)),
              ),
              keyboardType: TextInputType.text,
              onChanged: (String value) {
                setState(() {
                  department = value;
                });
              },
            ),
            TextField(
              controller: null,
              maxLength: 32,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 0.0),
                counterStyle: TextStyle(color: Color(0xFF37505D)),
                prefixIcon: Icon(FontAwesomeIcons.mailBulk),
                labelText: 'البريد الإلكتروني',
                labelStyle: TextStyle(
                    fontFamily: ArabicFonts.Cairo,
                    package: 'google_fonts_arabic',
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF37505D)),
              ),
              keyboardType: TextInputType.emailAddress,
              onChanged: (String value) {
                setState(() {
                  email = value;
                });
              },
            ),
            TextField(
              controller: null,
              maxLength: 32,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 0.0),
                counterStyle: TextStyle(color: Color(0xFF37505D)),
                prefixIcon: Icon(FontAwesomeIcons.lock),
                labelText: 'كلمة المرور',
                labelStyle: TextStyle(
                    fontFamily: ArabicFonts.Cairo,
                    package: 'google_fonts_arabic',
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF37505D)),
              ),
              keyboardType: TextInputType.text,
              onChanged: (String value) {
                setState(() {
                  password = value;
                });
              },
            ),
            //تسجيل
            new MaterialButton(
              height: 40.0,
              minWidth: 150.0,
              color: Color(0xFFE91E63),
              splashColor: Color(0xFFFF1B5E),
              textColor: Colors.white,
              child: new Text("تسجيل",
                  style: TextStyle(
                      fontFamily: ArabicFonts.Cairo,
                      package: 'google_fonts_arabic',
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
