import 'package:flutter/material.dart';
import 'package:google_fonts_arabic/fonts.dart';

class CenterDoctorsDetails extends StatefulWidget {
  int center_id;
  int department_id;
  int doc_id;
  String center;
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

  CenterDoctorsDetails({
    this.center_id,
    this.department_id,
    this.doc_id,
    this.center,
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
  _CenterDoctorsDetailsState createState() => _CenterDoctorsDetailsState();
}

class _CenterDoctorsDetailsState extends State<CenterDoctorsDetails> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
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
                      new Row(
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
                            "${widget.phone}",
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
                            "${widget.doc_email}",
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
                      new Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("المركز",
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
                            "${widget.center}",
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
                          Text("الدرجة",
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
                      new Row(
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
                            "${widget.ar_department}",
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
                          Text("سعر الإستشارة",
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
                            "${widget.consult_price} ريال",
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
                onPressed: () {
//							    Navigator.push(
//								    context,
//								    MaterialPageRoute(
//									    builder: (context) => DoctorsPages(),
//								    ),
//							    );
                },
                color: Color(0xFFE91E63),
                splashColor: Color(0xFF23AFB1),
                textColor: Colors.white,
                elevation: 0.2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new Text("حجز موعد",
                      style: TextStyle(
                          fontFamily: ArabicFonts.Cairo,
                          package: 'google_fonts_arabic',
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                ),
              ),
            ),
            SizedBox(width: 3.0),
            Expanded(
              child: new MaterialButton(
                onPressed: () {},
                color: Color(0xFFE91E63),
                splashColor: Color(0xFF23AFB1),
                textColor: Colors.white,
                elevation: 0.2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new Text("إستشارة طبية",
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
