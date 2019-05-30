import 'dart:async';
import 'dart:io';

import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:takaful/language/app_translations.dart';
import 'package:takaful/screens/account_client/EditProfilePage.dart';
import 'package:takaful/screens/account_client/RequestCard.dart';
import 'package:takaful/screens/image/image_picker_handler.dart';

class ProfilePage extends StatefulWidget {
  final String username;
  ProfilePage({this.username});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with
        SingleTickerProviderStateMixin,
        TickerProviderStateMixin,
        ImagePickerListener {
  File _image;
  AnimationController _controllers;
  ImagePickerHandler imagePicker;

  String result;

  Future _scanQR() async {
    try {
      String qrResult = await BarcodeScanner.scan();
      setState(() {
        result = qrResult;
      });
    } on PlatformException catch (ex) {
      if (ex.code == BarcodeScanner.CameraAccessDenied) {
        setState(() {
          result =
              AppTranslations.of(context).text("Camera_permission_was_denied");
        });
      } else {
        setState(() {
          result = "Unknown Error $ex";
        });
      }
    } on FormatException {
      setState(() {
        result = AppTranslations.of(context)
            .text("You_pressed_the_back_button_before_scanning_anything");
      });
    } catch (ex) {
      setState(() {
        result = "Unknown Error $ex";
      });
    }
  }

  @override
  void dispose() {
    _controllers.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controllers = new AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    imagePicker = new ImagePickerHandler(this, _controllers);
    imagePicker.init();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(AppTranslations.of(context).text("tab_profile"),
            style: TextStyle(
                fontFamily: ArabicFonts.Cairo,
                package: 'google_fonts_arabic',
                fontWeight: FontWeight.bold,
                fontSize: 20.0)),
      ),
      body: Stack(
        fit: StackFit.expand,
        alignment: Alignment.center,
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                height: 130.0,
                decoration: BoxDecoration(
                  image: new DecorationImage(
                    image: new AssetImage("assets/images/avatar.png"),
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: <Widget>[
                      Row(
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
                            "محمد علي ااحمد",
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
                            "0987654321",
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
                            "someOne@compay.com",
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
                      Row(
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
                      Row(
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
                      Row(
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
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("الدولة",
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
                            "المملكة",
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
                          Text("المدينة",
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
                            "الرياض",
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
                          Text("العنوان",
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
                            "الرياض الجديدة",
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
                          Text("حالة طلب البطاقة",
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
                            "منتهية الصلاحية",
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
          // Profile image
          Positioned(
            top: 10.0,
            child: Column(
              children: <Widget>[
                Container(
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
                                  const Radius.circular(50.0)),
                            ),
                          ),
                  ),
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditProfilePage(),
                    ),
                  );
                },
                color: Color(0xFFE91E63),
                splashColor: Color(0xFF23AFB1),
                textColor: Colors.white,
                elevation: 0.2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new Text("تعديل",
                      style: TextStyle(
                          fontFamily: ArabicFonts.Cairo,
                          package: 'google_fonts_arabic',
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                ),
              ),
            ),
            SizedBox(width: 3.0),
            Expanded(
              child: new MaterialButton(
                onPressed: () => _onValidBtnPressed(context),
                color: Color(0xFFE91E63),
                splashColor: Color(0xFF23AFB1),
                textColor: Colors.white,
                elevation: 0.2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new Text("إستعلام",
                      style: TextStyle(
                          fontFamily: ArabicFonts.Cairo,
                          package: 'google_fonts_arabic',
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                ),
              ),
            ),
            SizedBox(width: 3.0),
            Expanded(
              child: new MaterialButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RequestCard(),
                    ),
                  );
                },
                color: Color(0xFFE91E63),
                splashColor: Color(0xFF23AFB1),
                textColor: Colors.white,
                elevation: 0.2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new Text("طلب",
                      style: TextStyle(
                          fontFamily: ArabicFonts.Cairo,
                          package: 'google_fonts_arabic',
                          fontSize: 18.0,
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

  _onValidBtnPressed(context) {
    Alert(
        context: context,
        title: "إستعلام عن البطاقة",
        content: Column(
          children: <Widget>[
            new TextFormField(
              onEditingComplete: initState,
              initialValue: result,
              maxLength: 14,
              decoration: const InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
                prefixIcon: const Icon(Icons.card_membership),
                hintText: 'يرجى إدخال رقم البطاقة',
                labelText: 'رقم البطاقة *',
                labelStyle: TextStyle(
                  color: Color(0xFF37505D),
                  fontWeight: FontWeight.bold,
                  fontFamily: ArabicFonts.Cairo,
                  package: 'google_fonts_arabic',
                ),
                hintStyle: TextStyle(
                  fontFamily: ArabicFonts.Cairo,
                  package: 'google_fonts_arabic',
                ),
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [
                new WhitelistingTextInputFormatter(
                    new RegExp(r'^[\d -]{1,15}$')),
              ],
              validator: (value) => isValidIdNumber(value)
                  ? null
                  : 'يجب إدخال رقم البطاقة كـ (----------)',
              //onSaved: (val) => New_Model_Card.id_number = val,
            ),
          ],
        ),
        buttons: [
          DialogButton(
            onPressed: () => _onChackBtnPressedOkay(context),
            color: Color(0xFFE91E63),
            child: Text(
              "إستعلام",
              style: TextStyle(
                  fontFamily: ArabicFonts.Cairo,
                  package: 'google_fonts_arabic',
                  color: Colors.white,
                  fontSize: 20),
            ),
          ),
          DialogButton(
            onPressed: () => _scanQR(),
            color: Color(0xFFE91E63),
            child: Icon(
              Icons.camera_alt,
              color: Colors.white,
            ),
          )
        ]).show();
  }

  _onChackBtnPressedOkay(context) {
    Alert(
      context: context,
      title: "التحقق من البطاقة",
      type: AlertType.success,
      desc: "تمت عملية التحقق من البطاقة بنجاح",
      buttons: [
        DialogButton(
          child: Text(
            "موافق",
            style: TextStyle(
                fontFamily: ArabicFonts.Cairo,
                package: 'google_fonts_arabic',
                color: Colors.white,
                fontSize: 20),
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

  bool isValidIdNumber(String input) {
    final RegExp regex = new RegExp(r'^\d\d\d\d\d\d\d\d\d\d\d\d\d\d$');
    return regex.hasMatch(input);
  }

  @override
  userImage(File _image) {
    setState(() {
      this._image = _image;
    });
  }
}
