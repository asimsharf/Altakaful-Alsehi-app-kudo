import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:http/http.dart' as http;
import 'package:takaful/screens/dashboard/Doctors.dart';

class DoctorsDetails extends StatefulWidget {
  int center_id;
  int department_id;
  int doc_id;
  String center;
  String center_address;
  String center_website;
  String ar_department;
  String en_department;
  String ar_degree;
  String en_degree;
  String name;
  String phone;
  String doc_email;
  String hire_date;
  int visits_per_day;
  int consult_price;
  String gender;

  DoctorsDetails({
    this.center_id,
    this.department_id,
    this.doc_id,
    this.center,
    this.center_address,
    this.center_website,
    this.ar_department,
    this.en_department,
    this.ar_degree,
    this.en_degree,
    this.name,
    this.phone,
    this.doc_email,
    this.hire_date,
    this.visits_per_day,
    this.consult_price,
    this.gender,
  });

  @override
  _DoctorsDetailsState createState() => _DoctorsDetailsState();
}

class _DoctorsDetailsState extends State<DoctorsDetails> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.pop(context, false);
        return Future.value(false);
      },
      child: new Scaffold(
        appBar: AppBar(
          title: const Text('معلومات الطبيب',
              style: TextStyle(
                  fontFamily: ArabicFonts.Cairo,
                  package: 'google_fonts_arabic',
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  color: Colors.white)),
        ),
        body: new Stack(
          fit: StackFit.expand,
          alignment: Alignment.center,
          children: <Widget>[
            // صورة تفاصيل الطبيب
            Column(
              children: <Widget>[
                new Container(
                  height: 200.0,
                  decoration: BoxDecoration(
                    image: new DecorationImage(
                      image: new AssetImage("assets/images/avatar.png"),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
                new Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text("إسم الطبيب",
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
                              "${widget.name}",
                              style: TextStyle(
                                fontFamily: ArabicFonts.Cairo,
                                package: 'google_fonts_arabic',
                              ),
                            )
                          ],
                        ),
                        Row(
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
                              "${widget.phone}",
                              style: TextStyle(
                                fontFamily: ArabicFonts.Cairo,
                                package: 'google_fonts_arabic',
                              ),
                            )
                          ],
                        ),
                        Row(
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
                              "${widget.doc_email}",
                              style: TextStyle(
                                fontFamily: ArabicFonts.Cairo,
                                package: 'google_fonts_arabic',
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text("حالة",
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
                              "متصل الأن",
                              style: TextStyle(
                                fontFamily: ArabicFonts.Cairo,
                                package: 'google_fonts_arabic',
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text("تاريخ الإنضمام",
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
                              "${widget.hire_date}",
                              style: TextStyle(
                                fontFamily: ArabicFonts.Cairo,
                                package: 'google_fonts_arabic',
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text("التخصص",
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
                              "${widget.ar_degree}",
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
            new Positioned(
              top: 130.0,
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
                              borderRadius: BorderRadius.circular(50),
                              child: FadeInImage.assetNetwork(
                                fit: BoxFit.fill,
                                placeholder: 'assets/images/logo.png',
                                image:
                                    'https://cdn1.iconfinder.com/data/icons/user-pictures/101/malecostume-512.png',
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
              Expanded(
                child: new MaterialButton(
                  onPressed: () => _showWarningDialog(context),
                  color: Color(0xFFE91E63),
                  splashColor: Color(0xFF23AFB1),
                  textColor: Colors.white,
                  elevation: 0.2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: new Text("حذف",
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
      ),
    );
  }

  //To show dialog button for confirm deleting doctor
  _showWarningDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('هل أنت متأكد؟',
              style: TextStyle(
                fontFamily: ArabicFonts.Cairo,
                package: 'google_fonts_arabic',
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Color(0xFFE91E63),
              )),
          content: Text('ستفم بعملية حذف الطبيب!',
              style: TextStyle(
                  fontFamily: ArabicFonts.Cairo,
                  package: 'google_fonts_arabic',
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey)),
          actions: <Widget>[
            FlatButton(
              child: Text('إلغاء',
                  style: TextStyle(
                    fontFamily: ArabicFonts.Cairo,
                    package: 'google_fonts_arabic',
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFE91E63),
                  )),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            FlatButton(
                child: Text('إستمرار',
                    style: TextStyle(
                      fontFamily: ArabicFonts.Cairo,
                      package: 'google_fonts_arabic',
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFE91E63),
                    )),
                onPressed: () {
                  _deleteDoctor();
                  Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) => Doctors()));
                })
          ],
        );
      },
    );
  }

  //To delete a doctor by ID
  void _deleteDoctor() {
    var url = 'http://23.111.185.155:4000/takaful/api/doctor';
    http.post(url, body: {'doc_id': widget.doc_id});
  }
}
