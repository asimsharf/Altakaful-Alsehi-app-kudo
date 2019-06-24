import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts_arabic/fonts.dart';

class AddDepartment extends StatefulWidget {
  @override
  _AddDepartmentState createState() => _AddDepartmentState();
}

class _AddDepartmentState extends State<AddDepartment> {
  TextEditingController department_ar_name = TextEditingController();
  TextEditingController consult_price = TextEditingController();
  TextEditingController visits_per_day = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('إضافة قسم جديد',style: TextStyle(
            fontFamily: ArabicFonts.Cairo,
            package: 'google_fonts_arabic',
            fontWeight: FontWeight.bold,
            ),),
      ),
      body: ListView(
        children: <Widget>[
          //نوع الخدمة
          new TextFormField(
            controller: department_ar_name,
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
          // سعر الإستشارة
          new TextFormField(
            controller: consult_price,
            decoration: new InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
                counterStyle: TextStyle(color: Color(0xFF37505D)),
                labelText: "سعر الإستشارة *",
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
          // عدد زوار اليوم
          new TextFormField(
            controller: visits_per_day,
            decoration: new InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
                counterStyle: TextStyle(color: Color(0xFF37505D)),
                labelText: "عدد زوار اليوم *",
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
