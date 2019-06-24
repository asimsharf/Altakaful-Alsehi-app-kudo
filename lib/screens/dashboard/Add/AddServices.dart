import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts_arabic/fonts.dart';

class AddServices extends StatefulWidget {
  @override
  _AddServicesState createState() => _AddServicesState();
}

class _AddServicesState extends State<AddServices> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('إضافة خدمة جديدة',style: TextStyle(
          fontFamily: ArabicFonts.Cairo,
          package: 'google_fonts_arabic',
          fontWeight: FontWeight.bold,
        ),),
      ),
      body: ListView(
        children: <Widget>[
          //نوع الخدمة
          new TextFormField(
            decoration: new InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
                counterStyle: TextStyle(color: Color(0xFF37505D)),
                prefixIcon: Icon(FontAwesomeIcons.typo3),
                labelText: "نوع الخدمة *",
                labelStyle: TextStyle(
                    fontFamily: ArabicFonts.Cairo,
                    package: 'google_fonts_arabic',
                    fontSize: 10.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF37505D))),
            keyboardType: TextInputType.text,
            inputFormatters: [new LengthLimitingTextInputFormatter(30)],
            validator: (val) => val.isEmpty ? 'يرجى إدخال نوع الخدمة' : null,
          ),
          // السعر قبل الخصم
          new TextFormField(
            decoration: new InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
                counterStyle: TextStyle(color: Color(0xFF37505D)),
                labelText: "السعر قبل الخصم *",
                fillColor: Color(0xFF37505D),
                prefixIcon: Icon(FontAwesomeIcons.cashRegister),
                labelStyle: TextStyle(
                    fontFamily: ArabicFonts.Cairo,
                    package: 'google_fonts_arabic',
                    fontWeight: FontWeight.bold,
                    fontSize: 10.0,
                    color: Color(0xFF37505D))),
            keyboardType: TextInputType.phone,
          ),
          // السعر بعد الخصم
          new TextFormField(
            decoration: new InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
                counterStyle: TextStyle(color: Color(0xFF37505D)),
                labelText: "السعر بعد الخصم *",
                fillColor: Color(0xFF37505D),
                prefixIcon: Icon(FontAwesomeIcons.cashRegister),
                labelStyle: TextStyle(
                    fontFamily: ArabicFonts.Cairo,
                    package: 'google_fonts_arabic',
                    fontSize: 10.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF37505D))),
            keyboardType: TextInputType.phone,
          ),
          // نسبة الخصم
          new TextFormField(
            decoration: new InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
                counterStyle: TextStyle(color: Color(0xFF37505D)),
                labelText: "نسبة الخصم *",
                fillColor: Color(0xFF37505D),
                prefixIcon: Icon(FontAwesomeIcons.percent),
                labelStyle: TextStyle(
                    fontFamily: ArabicFonts.Cairo,
                    package: 'google_fonts_arabic',
                    fontSize: 10.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF37505D))),
            keyboardType: TextInputType.number,
            inputFormatters: [new LengthLimitingTextInputFormatter(30)],
            validator: (val) => val.isEmpty ? 'يرجى إدخال الخصم' : null,
          ),
        ],
      ),
      bottomNavigationBar: new Container(
        color: Colors.white,
        child: Row(
          children: <Widget>[
            Expanded(
              child: new MaterialButton(
                onPressed: () => null,
                color: Color(0xFFE91E63),
                splashColor: Color(0xFF23AFB1),
                textColor: Colors.white,
                elevation: 0.2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new Text("إضافة",
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
