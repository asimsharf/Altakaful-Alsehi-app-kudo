import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:takaful/screens/image/image_picker_handler.dart';

class EditProfilePage extends StatefulWidget {
  @override
  State createState() => _Register();
}

class _Register extends State<EditProfilePage>
    with
        SingleTickerProviderStateMixin,
        TickerProviderStateMixin,
        ImagePickerListener {
  Animation<double> _iconAnimation;
  AnimationController _iconAnimationController;
  File _image;
  AnimationController _controllers;
  ImagePickerHandler imagePicker;
  @override
  void initState() {
    super.initState();
    _controllers = new AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    imagePicker = new ImagePickerHandler(this, _controllers);
    imagePicker.init();

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
  void dispose() {
    _controllers.dispose();
    super.dispose();
  }

  List<String> _countrys = <String>[
    '',
    'المملكة العربية السعودية',
    'البحرين',
  ];
  String _country = '';
  List<String> _citys = <String>[
    '',
    'الرياض',
    'مكى',
  ];
  String _city = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('تعديل الملف الشخصي',
            style: TextStyle(
                fontFamily: ArabicFonts.Cairo,
                package: 'google_fonts_arabic',
                fontWeight: FontWeight.bold,
                fontSize: 20.0)),
      ),
      body: Stack(fit: StackFit.expand, children: <Widget>[
        SafeArea(
          top: false,
          bottom: false,
          child: Form(
            autovalidate: true,
            child: ListView(
              padding: const EdgeInsets.all(20.0),
              children: <Widget>[
                GestureDetector(
                  onTap: () => imagePicker.showDialog(context),
                  child: new Center(
                    child: _image == null
                        ? new Stack(
                            children: <Widget>[
                              new Center(
                                child: new CircleAvatar(
                                  radius: 50.0,
                                  backgroundColor: const Color(0xFFFFF6E8),
                                ),
                              ),
                              new Center(
                                child: new Image.asset(
                                  "assets/images/photo_camera.png",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          )
                        : new Container(
                            height: 100.0,
                            width: 100.0,
                            decoration: new BoxDecoration(
                              color: const Color(0xFFFF1B5E),
                              image: new DecorationImage(
                                image: new ExactAssetImage(_image.path),
                                fit: BoxFit.cover,
                              ),
                              border: Border.all(
                                  color: Color(0xFFE91E63), width: 2.0),
                              borderRadius: new BorderRadius.all(
                                  const Radius.circular(80.0)),
                            ),
                          ),
                  ),
                ),
                //الاسم بالكامل
                new TextFormField(
                  maxLength: 32,
                  decoration: new InputDecoration(
                      counterStyle: TextStyle(color: Color(0xFF37505D)),
                      prefixIcon: Icon(Icons.person),
                      labelText: "الاسم بالكامل *",
                      labelStyle: TextStyle(
                          fontFamily: ArabicFonts.Cairo,
                          package: 'google_fonts_arabic',
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF37505D))),
                  keyboardType: TextInputType.text,
                ),
                //رقم الهاتف
                new TextFormField(
                  maxLength: 10,
                  decoration: new InputDecoration(
                      labelText: "رقم الهاتف *",
                      fillColor: Color(0xFF37505D),
                      prefixIcon: Icon(Icons.phone),
                      labelStyle: TextStyle(
                          fontFamily: ArabicFonts.Cairo,
                          package: 'google_fonts_arabic',
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF37505D))),
                  keyboardType: TextInputType.phone,
                ),
                //البريد الالكتروني
                new TextFormField(
                  decoration: new InputDecoration(
                    labelText: "البريد الإلكتروني (إختياري)",
                    prefixIcon: Icon(Icons.email),
                    fillColor: Color(0xFF37505D),
                    labelStyle: TextStyle(
                      fontFamily: ArabicFonts.Cairo,
                      package: 'google_fonts_arabic',
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF37505D),
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                //الدولة
                new FormField<String>(
                  builder: (FormFieldState<String> state) {
                    return InputDecorator(
                      decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.symmetric(vertical: 10.0),
                        prefixIcon: const Icon(Icons.home),
                        labelText: 'الدولة *',
                        labelStyle: TextStyle(
                          color: Color(0xFF37505D),
                          fontWeight: FontWeight.bold,
                          fontFamily: ArabicFonts.Cairo,
                          package: 'google_fonts_arabic',
                        ),
                        errorText: state.hasError ? state.errorText : null,
                      ),
                      isEmpty: _country == '',
                      child: new DropdownButtonHideUnderline(
                        child: new DropdownButton<String>(
                          //hint: Text("إختيار الدولة"),
                          value: _country,
                          isDense: true,
                          onChanged: (String newValue) {
                            setState(() {
                              //New_Model_Card.gender = newValue;
                              _country = newValue;
                              state.didChange(newValue);
                            });
                          },
                          items: _countrys.map((String value) {
                            return new DropdownMenuItem<String>(
                              value: value,
                              child: new Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    );
                  },
                ),
                //المدينة
                new FormField<String>(
                  builder: (FormFieldState<String> state) {
                    return InputDecorator(
                      decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.symmetric(vertical: 10.0),
                        prefixIcon: const Icon(Icons.location_city),
                        labelText: 'المدينة *',
                        labelStyle: TextStyle(
                          color: Color(0xFF37505D),
                          fontWeight: FontWeight.bold,
                          fontFamily: ArabicFonts.Cairo,
                          package: 'google_fonts_arabic',
                        ),
                        errorText: state.hasError ? state.errorText : null,
                      ),
                      isEmpty: _city == '',
                      child: new DropdownButtonHideUnderline(
                        child: new DropdownButton<String>(
                          //hint: Text("إختيار المدينة"),
                          value: _city,
                          isDense: true,
                          onChanged: (String newValue) {
                            setState(() {
                              //New_Model_Card.gender = newValue;
                              _city = newValue;
                              state.didChange(newValue);
                            });
                          },
                          items: _citys.map((String value) {
                            return new DropdownMenuItem<String>(
                              value: value,
                              child: new Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    );
                  },
                ),
                //العنوان
                new TextFormField(
                  decoration: new InputDecoration(
                      labelText: "العنوان *",
                      fillColor: Color(0xFF37505D),
                      prefixIcon: Icon(Icons.add_location),
                      labelStyle: TextStyle(
                          fontFamily: ArabicFonts.Cairo,
                          package: 'google_fonts_arabic',
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF37505D))),
                  keyboardType: TextInputType.text,
                ),
                new Padding(
                  padding: const EdgeInsets.only(
                      left: 8.0, right: 8.0, bottom: 10.0),
                ),
                new MaterialButton(
                  height: 40.0,
                  minWidth: 150.0,
                  color: Color(0xFFE91E63),
                  splashColor: Color(0xFFFF1B5E),
                  textColor: Colors.white,
                  child: new Text("حفظ البيانات",
                      style: TextStyle(
                          fontFamily: ArabicFonts.Cairo,
                          package: 'google_fonts_arabic',
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                  onPressed: () => _onBasicAlertPressed(context),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }

  // The easiest way for creating RFlutter Alert
  _onBasicAlertPressed(context) {
    Alert(
      context: context,
      type: AlertType.success,
      title: "تعديل بيانات",
      desc: "تمت عملية حفظ البيانات بنجاح",
      buttons: [
        DialogButton(
          child: Text(
            "موافق",
            style: TextStyle(
                fontFamily: ArabicFonts.Cairo,
                package: 'google_fonts_arabic',
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
          onPressed: () => Navigator.pop(context),
          color: Color(0xFFE91E63),
          width: 120,
        )
      ],
    ).show();
  }

  @override
  userImage(File _image) {
    setState(() {
      this._image = _image;
    });
  }
}
