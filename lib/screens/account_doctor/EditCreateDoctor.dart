import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts_arabic/fonts.dart';

class EditDoctor extends StatefulWidget {
  @override
  _EditDoctorState createState() => _EditDoctorState();
}

class _EditDoctorState extends State<EditDoctor> {
  String doc_name;
  String doc_username;
  String phone;
  String address;
  String gender;
  String department_id;
  String city;
  String email;
  String password;
  String facebook;
  String linkedin;
  String twitter;

//  TextEditingController doc_name = TextEditingController();
//  TextEditingController doc_username = TextEditingController();
//  TextEditingController phone = TextEditingController();
//  TextEditingController address = TextEditingController();

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
                "تعديل معلومات الطبيب",
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
                labelText: 'إسم الطبيب',
                labelStyle: TextStyle(
                    fontFamily: ArabicFonts.Cairo,
                    package: 'google_fonts_arabic',
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF37505D)),
              ),
              keyboardType: TextInputType.text,
              onChanged: (String value) {
                setState(() {
                  doc_name = value;
                });
              },
            ),
            TextField(
              controller: null,
              maxLength: 32,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 0.0),
                counterStyle: TextStyle(color: Color(0xFF37505D)),
                prefixIcon: Icon(FontAwesomeIcons.userAlt),
                labelText: 'إسم المستخدم',
                labelStyle: TextStyle(
                    fontFamily: ArabicFonts.Cairo,
                    package: 'google_fonts_arabic',
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF37505D)),
              ),
              keyboardType: TextInputType.text,
              onChanged: (String value) {
                setState(() {
                  doc_username = value;
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
                prefixIcon: Icon(FontAwesomeIcons.genderless),
                labelText: 'الجنس',
                labelStyle: TextStyle(
                    fontFamily: ArabicFonts.Cairo,
                    package: 'google_fonts_arabic',
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF37505D)),
              ),
              keyboardType: TextInputType.text,
              onChanged: (String value) {
                setState(() {
                  gender = value;
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
                  department_id = value;
                });
              },
            ),
            TextField(
              controller: null,
              maxLength: 32,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 0.0),
                counterStyle: TextStyle(color: Color(0xFF37505D)),
                prefixIcon: Icon(FontAwesomeIcons.city),
                labelText: 'المدينه',
                labelStyle: TextStyle(
                    fontFamily: ArabicFonts.Cairo,
                    package: 'google_fonts_arabic',
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF37505D)),
              ),
              keyboardType: TextInputType.text,
              onChanged: (String value) {
                setState(() {
                  city = value;
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
            TextField(
              controller: null,
              maxLength: 32,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 0.0),
                counterStyle: TextStyle(color: Color(0xFF37505D)),
                prefixIcon: Icon(FontAwesomeIcons.facebookF),
                labelText: 'حساب فيسبوك',
                labelStyle: TextStyle(
                    fontFamily: ArabicFonts.Cairo,
                    package: 'google_fonts_arabic',
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF37505D)),
              ),
              keyboardType: TextInputType.text,
              onChanged: (String value) {
                setState(() {
                  facebook = value;
                });
              },
            ),
            TextField(
              controller: null,
              maxLength: 32,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 0.0),
                counterStyle: TextStyle(color: Color(0xFF37505D)),
                prefixIcon: Icon(FontAwesomeIcons.linkedinIn),
                labelText: 'حساب لنكندان',
                labelStyle: TextStyle(
                    fontFamily: ArabicFonts.Cairo,
                    package: 'google_fonts_arabic',
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF37505D)),
              ),
              keyboardType: TextInputType.text,
              onChanged: (String value) {
                setState(() {
                  linkedin = value;
                });
              },
            ),
            TextField(
              controller: null,
              maxLength: 32,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 0.0),
                counterStyle: TextStyle(color: Color(0xFF37505D)),
                prefixIcon: Icon(FontAwesomeIcons.twitter),
                labelText: 'حساب تويتر',
                labelStyle: TextStyle(
                    fontFamily: ArabicFonts.Cairo,
                    package: 'google_fonts_arabic',
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF37505D)),
              ),
              keyboardType: TextInputType.text,
              onChanged: (String value) {
                setState(() {
                  twitter = value;
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
