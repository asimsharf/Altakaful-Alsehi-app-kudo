import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts_arabic/fonts.dart';

class onWillPop extends StatefulWidget {
  @override
  _onWillPopPageState createState() => new _onWillPopPageState();
}

class _onWillPopPageState extends State<onWillPop> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final formKey = new GlobalKey<FormState>();
  bool saved = false;

  void _submit() {
    final form = formKey.currentState;
    if (!form.validate()) {
      return;
    }

    saved = true;
    _scaffoldKey.currentState.showSnackBar(new SnackBar(
        backgroundColor: Colors.black,
        content: new Text(
          "تمت عملية الحفظ بنجاح",
          style: TextStyle(
              fontFamily: ArabicFonts.Cairo,
              package: 'google_fonts_arabic',
              color: Color(0xFFE91E63),
              fontSize: 20),
        )));
  }

  Future<bool> _canLeave(BuildContext context) {
    if (saved) {
      return new Future<bool>.value(true);
    } else
      return _prompt(context);
  }

  Future<bool> _prompt(BuildContext context) {
    return showDialog(
          context: context,
          child: new AlertDialog(
            title: new Text(
              'عفواً لم تقم بحفظ البيانات',
              style: TextStyle(
                  fontFamily: ArabicFonts.Cairo,
                  package: 'google_fonts_arabic',
                  color: Color(0xFFE91E63),
                  fontSize: 20),
            ),
            content: new Text(
              'هل ترغب في اكمال البيانات ؟',
              style: TextStyle(
                  fontFamily: ArabicFonts.Cairo,
                  package: 'google_fonts_arabic',
                  color: Color(0xFFE91E63),
                  fontSize: 20),
            ),
            actions: <Widget>[
              new FlatButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: new Text(
                  'لا',
                  style: TextStyle(
                      fontFamily: ArabicFonts.Cairo,
                      package: 'google_fonts_arabic',
                      color: Color(0xFFE91E63),
                      fontSize: 20),
                ),
              ),
              new FlatButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: new Text(
                  'نعم',
                  style: TextStyle(
                      fontFamily: ArabicFonts.Cairo,
                      package: 'google_fonts_arabic',
                      color: Color(0xFFE91E63),
                      fontSize: 20),
                ),
              ),
            ],
          ),
        ) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scaffoldKey,
      appBar: new AppBar(
        title: new Text(
          'تجربة البيانات',
          style: TextStyle(
              fontFamily: ArabicFonts.Cairo,
              package: 'google_fonts_arabic',
              color: Color(0xFFE91E63),
              fontSize: 20),
        ),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: new Padding(
        padding: const EdgeInsets.all(16.0),
        child: new Form(
          key: formKey,
          autovalidate: true,
          child: new Column(
            children: [
              new TextFormField(
                  decoration: new InputDecoration(labelText: 'إدخل شئ ما'),
                  validator: (val) => val.isEmpty ? "يجب إدخال شئ ما" : null),
              new RaisedButton(
                onPressed: _submit,
                child: new Text(
                  'حفظ',
                  style: TextStyle(
                      fontFamily: ArabicFonts.Cairo,
                      package: 'google_fonts_arabic',
                      color: Color(0xFFE91E63),
                      fontSize: 20),
                ),
              ),
            ],
          ),
          onWillPop: () => _canLeave(context),
        ),
      ),
    );
  }
}

//  new WillPopScope(
//  onWillPop: () => _exitApp(context),
//  child: );

//
//Future<bool> _exitApp(BuildContext context) {
//  return showDialog(
//    context: context,
//    // ignore: deprecated_member_use
//    child: new AlertDialog(
//      title: new Text(
//        'هل ترغب في الخروج من التطبيق؟',
//        style: TextStyle(
//            fontFamily: ArabicFonts.Cairo,
//            package: 'google_fonts_arabic',
//            color: Color(0xFFE91E63),
//            fontSize: 20),
//      ),
//      content: new Text(
//        'نكره ان نراك تغادر...',
//        style: TextStyle(
//            fontFamily: ArabicFonts.Cairo,
//            package: 'google_fonts_arabic',
//            color: Color(0xFFE91E63),
//            fontSize: 20),
//      ),
//      actions: <Widget>[
//        new FlatButton(
//          onPressed: () => Navigator.of(context).pop(false),
//          child: new Text(
//            'لا',
//            style: TextStyle(
//                fontFamily: ArabicFonts.Cairo,
//                package: 'google_fonts_arabic',
//                color: Color(0xFFE91E63),
//                fontSize: 20),
//          ),
//        ),
//        new FlatButton(
//          onPressed: () => Navigator.of(context).pop(true),
//          child: new Text(
//            'نعم',
//            style: TextStyle(
//                fontFamily: ArabicFonts.Cairo,
//                package: 'google_fonts_arabic',
//                color: Color(0xFFE91E63),
//                fontSize: 20),
//          ),
//        ),
//      ],
//    ),
//  ) ??
//      false;
//}
