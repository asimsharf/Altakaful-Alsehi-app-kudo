import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:takaful/screens/account_client/ProfilePage.dart';

class Admins extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  Admins({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: const Text('بيانات المسؤول',
              style: TextStyle(
                  fontFamily: ArabicFonts.Cairo,
                  package: 'google_fonts_arabic',
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  color: Colors.white)),
        ),
        body: new LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints:
                    BoxConstraints(minHeight: viewportConstraints.maxHeight),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: new Column(
                    children: <Widget>[
                      Container(
                        height: 130.0,
                        decoration: BoxDecoration(
                          image: new DecorationImage(
                            image: new AssetImage("assets/images/avatar.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      //بيانات المسؤول
                      new Padding(
                        padding: const EdgeInsets.only(top: 0.0),
                        child: new Text(
                          "بيانات المسؤول",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: ArabicFonts.Cairo,
                              fontSize: 25.0,
                              package: 'google_fonts_arabic',
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF23AFB1)),
                        ),
                      ),
                      new Divider(
                        color: Color(0xFFE91E63),
                      ),
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
                      //زر التعديل
                      new SizedBox(height: 8.0),
                      new Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          new MaterialButton(
                            height: 40.0,
                            //minWidth: 100.0,
                            color: Color(0xFFE91E63),
                            splashColor: Color(0xFFFF1B5E),
                            textColor: Colors.white,
                            child: new Text("تعديل",
                                style: TextStyle(
                                    fontFamily: ArabicFonts.Cairo,
                                    package: 'google_fonts_arabic',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.0,
                                    color: Colors.white)),
                            onPressed: () => _onEditAdminPressed(context),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ));
  }

  // التعديل على بيانات المسؤول
  _onEditAdminPressed(context) {
    new Alert(
        context: context,
        title: "تعديل بيانات المسؤول",
        content: new Column(
          children: <Widget>[
            //إسم المسؤول
            new TextFormField(
              maxLength: 32,
              decoration: new InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 0.0),
                  counterStyle: new TextStyle(color: Color(0xFF37505D)),
                  prefixIcon: new Icon(FontAwesomeIcons.user),
                  labelText: "الإسم *",
                  hintText: 'يرجى إدخال الإسم بالكامل',
                  labelStyle: new TextStyle(
                      fontFamily: ArabicFonts.Cairo,
                      package: 'google_fonts_arabic',
                      fontSize: 10.0,
                      fontWeight: FontWeight.bold,
                      color: new Color(0xFF37505D))),
              keyboardType: TextInputType.text,
              inputFormatters: [new LengthLimitingTextInputFormatter(30)],
              validator: (val) => val.isEmpty ? 'يرجى إدخال إسم المسؤول' : null,
            ),
            //رقم الهاتف
            new TextFormField(
              maxLength: 10,
              decoration: new InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 0.0),
                counterStyle: new TextStyle(color: new Color(0xFF37505D)),
                fillColor: new Color(0xFF37505D),
                prefixIcon: new Icon(Icons.phone),
                hintText: 'يرجى إدخال الهاتف',
                labelText: 'الهاتف *',
                labelStyle: new TextStyle(
                  color: new Color(0xFF37505D),
                  fontWeight: FontWeight.bold,
                  fontSize: 10.0,
                  fontFamily: ArabicFonts.Cairo,
                  package: 'google_fonts_arabic',
                ),
                hintStyle: new TextStyle(
                  fontFamily: ArabicFonts.Cairo,
                  package: 'google_fonts_arabic',
                ),
              ),
              keyboardType: TextInputType.phone,
              inputFormatters: [
                new WhitelistingTextInputFormatter(
                    new RegExp(r'^[\d -]{1,15}$')),
              ],
              validator: (value) => isValidPhoneNumber(value)
                  ? null
                  : 'يجب إدخال رقم الهاتف كـ (###) ### - ####',
            ),
            //البريد الالكتروني
            new TextFormField(
              decoration: new InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 0.0),
                counterStyle: TextStyle(color: Color(0xFF37505D)),
                hintText: 'أدخل عنوان البريد الإلكتروني',
                labelText: 'البريد الإلكتروني (إختياري)',
                prefixIcon: new Icon(Icons.email),
                fillColor: new Color(0xFF37505D),
                labelStyle: new TextStyle(
                  color: new Color(0xFF37505D),
                  fontWeight: FontWeight.bold,
                  fontSize: 10.0,
                  fontFamily: ArabicFonts.Cairo,
                  package: 'google_fonts_arabic',
                ),
                hintStyle: new TextStyle(
                  fontFamily: ArabicFonts.Cairo,
                  package: 'google_fonts_arabic',
                ),
              ),
              validator: (value) => isValidEmail(value)
                  ? null
                  : 'من فضلك أدخل بريد أليكترونى صحيح',
              keyboardType: TextInputType.emailAddress,
            ),
            //رقم الهوية
            new TextFormField(
              maxLength: 14,
              decoration: new InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 0.0),
                  counterStyle: new TextStyle(color: Color(0xFF37505D)),
                  labelText: "رقم الهوية *",
                  hintText: 'يرجى إدخال رقم الهوية',
                  prefixIcon: new Icon(Icons.confirmation_number),
                  fillColor: new Color(0xFF37505D),
                  labelStyle: new TextStyle(
                      fontFamily: ArabicFonts.Cairo,
                      package: 'google_fonts_arabic',
                      fontWeight: FontWeight.bold,
                      fontSize: 10.0,
                      color: new Color(0xFF37505D))),
              keyboardType: TextInputType.number,
              inputFormatters: [new LengthLimitingTextInputFormatter(30)],
              validator: (val) => val.isEmpty ? 'يرجى إدخال رقم الهوية' : null,
            ),
          ],
        ),
        buttons: [
          new DialogButton(
            onPressed: () => _onBasicAlertPressedOkay(context),
            color: new Color(0xFFE91E63),
            child: new Text(
              "تعديل",
              style: new TextStyle(color: Colors.white, fontSize: 20),
            ),
          )
        ]).show();
  }

// التحقق من البطاقة
  _onBasicAlertPressedOkay(context) {
    Alert(
      context: context,
      title: "التحقق من البطاقة",
      type: AlertType.success,
      desc: "تمت عملية التحقق من البطاقة بنجاح",
      buttons: [
        DialogButton(
          child: Text(
            "موافق",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProfilePage(),
              )),
          color: Color(0xFFE91E63),
        )
      ],
    ).show();
  }

//التحقق من ان رقم الجوال صحيح
  bool isValidPhoneNumber(String input) {
    final RegExp regex = new RegExp(r'^\d\d\d\d\d\d\d\d\d\d$');
    return regex.hasMatch(input);
  }

//التحقق من ان رقم البطقة صحيح
  bool isValidIdNumber(String input) {
    final RegExp regex = new RegExp(r'^\d\d\d\d\d\d\d\d\d\d\d\d\d\d$');
    return regex.hasMatch(input);
  }

//التحقق من ان الايميل صحيح
  bool isValidEmail(String input) {
    final RegExp regex = new RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
    return regex.hasMatch(input);
  }

//إظهار رسالة في حالة وجود خطأ او غلط
  void showMessage(String message, [MaterialColor color = Colors.red]) {
    _scaffoldKey.currentState.showSnackBar(
        new SnackBar(backgroundColor: color, content: new Text(message)));
  }
}
