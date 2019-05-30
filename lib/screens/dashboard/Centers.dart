import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:takaful/screens/account_client/ProfilePage.dart';

class Centers extends StatefulWidget {
  @override
  _CentersState createState() => _CentersState();
}

class _CentersState extends State<Centers> with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  Animation<double> _iconAnimation;
  AnimationController _iconAnimationController;

  @override
  void initState() {
    super.initState();
    _iconAnimationController = new AnimationController(
        vsync: this, duration: new Duration(milliseconds: 500));
    _iconAnimation = new CurvedAnimation(
      parent: _iconAnimationController,
      curve: Curves.bounceOut,
    );
    _iconAnimation.addListener(() => this.setState(() {}));
    _iconAnimationController.forward();
  }

//قائمة بأسماء الدول
  List<String> _countrys = <String>[
    '',
    'المملكة العربية السعودية',
    'البحرين',
  ];
  String _country = '';
//قائمة بأسماء المدن
  List<String> _citys = <String>[
    '',
    'الرياض',
    'مكى',
  ];
  String _city = '';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text('بروفايل المراكز الطبية',
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
          // صورة تفاصيل المحامي
          Column(
            children: <Widget>[
              new Container(
                height: 200.0,
                child: FadeInImage.assetNetwork(
                  fit: BoxFit.cover,
                  placeholder: 'assets/images/avatar.png',
                  image:
                      'https://healthitsecurity.com/images/site/article_headers/_normal/2017-11-08large-data-breach.jpg',
                ),
              ),
              new Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("إسم المركز",
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
                            "مركز جرش الطبي",
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
                            "المملكة العربيةالسعودية",
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
                            "شارع الستين ابوالروم",
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
                          Text("الموقع الإلكتروني",
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
                            "https://www.takaful.com",
                            style: TextStyle(
                              fontFamily: ArabicFonts.Cairo,
                              package: 'google_fonts_arabic',
                            ),
                          )
                        ],
                      ),
                      //رابط الفيسبوك
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("رابط الفيسبوك",
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
                            "https://www.fb.com/takaful",
                            style: TextStyle(
                              fontFamily: ArabicFonts.Cairo,
                              package: 'google_fonts_arabic',
                            ),
                          )
                        ],
                      ),
                      //رابط قوقل بلص
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("رابط قوقل بلص",
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
                            "https://www.google.com/fakaful",
                            style: TextStyle(
                              fontFamily: ArabicFonts.Cairo,
                              package: 'google_fonts_arabic',
                            ),
                          )
                        ],
                      ),
                      //رابط تويتر
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("رابط تويتر",
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
                            "https://www.twitter.com/takaful",
                            style: TextStyle(
                              fontFamily: ArabicFonts.Cairo,
                              package: 'google_fonts_arabic',
                            ),
                          )
                        ],
                      ),
                      //رابط لنكدان
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("رابط لنكدان",
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
                            "https://www.linkin.com/takaful",
                            style: TextStyle(
                              fontFamily: ArabicFonts.Cairo,
                              package: 'google_fonts_arabic',
                            ),
                          )
                        ],
                      ),
                      //وصف المركز
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("وصف المركز",
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
                            "مركز عمران التخصصي لعلاج امراض الكلى",
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
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: new Container(
        color: Colors.white,
        child: Row(
          children: <Widget>[
            Expanded(
              child: new FlatButton(
                onPressed: () => _onEditCenterPressed(context),
                color: Color(0xFFE91E63),
                splashColor: Color(0xFFFF1B5E),
                textColor: Colors.white,
                //elevation: 0.2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new Text("تعديل",
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
              child: new FlatButton(
                onPressed: () => _onAddCenterPressed(context),
                color: Color(0xFFE91E63),
                splashColor: Color(0xFFFF1B5E),
                textColor: Colors.white,
                //elevation: 0.2,
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

  // التعديل على بيانات المركز
  _onEditCenterPressed(context) {
    Alert(
        context: context,
        title: "تعديل معلومات المركز",
        content: Form(
          key: _formKey,
          autovalidate: true,
          child: Column(
            children: <Widget>[
              //اسم المركز
              new TextFormField(
                maxLength: 32,
                decoration: new InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 5.0),
                  counterStyle: TextStyle(color: Color(0xFF37505D)),
                  prefixIcon: Icon(FontAwesomeIcons.centercode),
                  labelText: "إسم المركز *",
                  labelStyle: TextStyle(
                      fontFamily: ArabicFonts.Cairo,
                      package: 'google_fonts_arabic',
                      fontWeight: FontWeight.bold,
                      fontSize: 10.0,
                      color: Color(0xFF37505D)),
                  hintStyle: TextStyle(
                    fontFamily: ArabicFonts.Cairo,
                    package: 'google_fonts_arabic',
                  ),
                ),
                keyboardType: TextInputType.text,
                inputFormatters: [new LengthLimitingTextInputFormatter(30)],
                validator: (val) =>
                    val.isEmpty ? 'يرجى إدخال إسم المركز' : null,
              ),
              new FormField<String>(
                builder: (FormFieldState<String> state) {
                  return InputDecorator(
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(vertical: 5.0),
                      counterStyle: TextStyle(color: Color(0xFF37505D)),
                      prefixIcon: const Icon(Icons.location_city),
                      labelText: 'المدينة *',
                      labelStyle: TextStyle(
                        color: Color(0xFF37505D),
                        fontWeight: FontWeight.bold,
                        fontFamily: ArabicFonts.Cairo,
                        fontSize: 10.0,
                        package: 'google_fonts_arabic',
                      ),
                      hintStyle: TextStyle(
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
              //الموقع الإلكتروني
              new TextFormField(
                decoration: new InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 5.0),
                  counterStyle: TextStyle(color: Color(0xFF37505D)),
                  labelText: "الموقع الإلكتروني (إختياري)",
                  fillColor: Colors.red,
                  prefixIcon: Icon(FontAwesomeIcons.sitemap),
                  labelStyle: TextStyle(
                      fontFamily: ArabicFonts.Cairo,
                      package: 'google_fonts_arabic',
                      fontWeight: FontWeight.bold,
                      fontSize: 10.0,
                      color: Color(0xFF37505D)),
                  hintStyle: TextStyle(
                    fontFamily: ArabicFonts.Cairo,
                    package: 'google_fonts_arabic',
                  ),
                ),
                keyboardType: TextInputType.text,
              ),
              //رابط الفيسبوك
              new TextFormField(
                decoration: new InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 5.0),
                    counterStyle: TextStyle(color: Color(0xFF37505D)),
                    labelText: "رابط الفيسبوك (إختياري)",
                    fillColor: Colors.red,
                    prefixIcon: Icon(FontAwesomeIcons.facebookF),
                    labelStyle: TextStyle(
                        fontFamily: ArabicFonts.Cairo,
                        fontSize: 10.0,
                        package: 'google_fonts_arabic',
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF37505D))),
                keyboardType: TextInputType.text,
              ),
              //رابط قوقل بلص
              new TextFormField(
                decoration: new InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 5.0),
                    counterStyle: TextStyle(color: Color(0xFF37505D)),
                    labelText: "رابط قوقل بلص (إختياري)",
                    fillColor: Colors.red,
                    prefixIcon: Icon(FontAwesomeIcons.googlePlusG),
                    labelStyle: TextStyle(
                        fontFamily: ArabicFonts.Cairo,
                        package: 'google_fonts_arabic',
                        fontWeight: FontWeight.bold,
                        fontSize: 10.0,
                        color: Color(0xFF37505D))),
                keyboardType: TextInputType.text,
              ),
              //رابط تويتر
              new TextFormField(
                decoration: new InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 5.0),
                    counterStyle: TextStyle(color: Color(0xFF37505D)),
                    labelText: "رابط تويتر (إختياري)",
                    fillColor: Colors.red,
                    prefixIcon: Icon(FontAwesomeIcons.twitter),
                    labelStyle: TextStyle(
                        fontFamily: ArabicFonts.Cairo,
                        package: 'google_fonts_arabic',
                        fontWeight: FontWeight.bold,
                        fontSize: 10.0,
                        color: Color(0xFF37505D))),
                keyboardType: TextInputType.text,
              ),
              //رابط لنك ان
              new TextFormField(
                decoration: new InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 5.0),
                    counterStyle: TextStyle(color: Color(0xFF37505D)),
                    labelText: "رابط لينكدان (إختياري)",
                    fillColor: Colors.red,
                    prefixIcon: Icon(Icons.location_city),
                    labelStyle: TextStyle(
                        fontFamily: ArabicFonts.Cairo,
                        package: 'google_fonts_arabic',
                        fontWeight: FontWeight.bold,
                        fontSize: 10.0,
                        color: Color(0xFF37505D))),
                keyboardType: TextInputType.text,
              ),
              //وصف المركز
              new TextFormField(
                decoration: new InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 5.0),
                    counterStyle: TextStyle(color: Color(0xFF37505D)),
                    labelText: "وصف المركز *",
                    fillColor: Colors.red,
                    prefixIcon: Icon(FontAwesomeIcons.discord),
                    labelStyle: TextStyle(
                        fontFamily: ArabicFonts.Cairo,
                        package: 'google_fonts_arabic',
                        fontSize: 10.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF37505D))),
                keyboardType: TextInputType.text,
                inputFormatters: [new LengthLimitingTextInputFormatter(30)],
                validator: (val) =>
                    val.isEmpty ? 'يرجى إدخال وصف المركز' : null,
              ),
            ],
          ),
        ),
        buttons: [
          DialogButton(
            onPressed: () => _onBasicAlertPressedOkay(context),
            color: Color(0xFFE91E63),
            child: Text(
              "تعديل",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          )
        ]).show();
  }

  //إضافة مركز جديد
  _onAddCenterPressed(context) {
    Alert(
        context: context,
        title: "إضافة مركز فرع",
        content: Column(
          children: <Widget>[
            //اسم المركز
            new TextFormField(
              maxLength: 32,
              decoration: new InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 5.0),
                counterStyle: TextStyle(color: Color(0xFF37505D)),
                prefixIcon: Icon(FontAwesomeIcons.centercode),
                labelText: "إسم المركز *",
                labelStyle: TextStyle(
                    fontFamily: ArabicFonts.Cairo,
                    package: 'google_fonts_arabic',
                    fontWeight: FontWeight.bold,
                    fontSize: 10.0,
                    color: Color(0xFF37505D)),
                hintStyle: TextStyle(
                  fontFamily: ArabicFonts.Cairo,
                  package: 'google_fonts_arabic',
                ),
              ),
              keyboardType: TextInputType.text,
              inputFormatters: [new LengthLimitingTextInputFormatter(30)],
              validator: (val) => val.isEmpty ? 'يرجى إدخال إسم المركز' : null,
            ),
            new FormField<String>(
              builder: (FormFieldState<String> state) {
                return InputDecorator(
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 5.0),
                    counterStyle: TextStyle(color: Color(0xFF37505D)),
                    prefixIcon: const Icon(Icons.location_city),
                    labelText: 'المدينة *',
                    labelStyle: TextStyle(
                      color: Color(0xFF37505D),
                      fontWeight: FontWeight.bold,
                      fontFamily: ArabicFonts.Cairo,
                      fontSize: 10.0,
                      package: 'google_fonts_arabic',
                    ),
                    hintStyle: TextStyle(
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
            //الموقع الإلكتروني
            new TextFormField(
              decoration: new InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 5.0),
                counterStyle: TextStyle(color: Color(0xFF37505D)),
                labelText: "الموقع الإلكتروني (إختياري)",
                fillColor: Colors.red,
                prefixIcon: Icon(FontAwesomeIcons.sitemap),
                labelStyle: TextStyle(
                    fontFamily: ArabicFonts.Cairo,
                    package: 'google_fonts_arabic',
                    fontWeight: FontWeight.bold,
                    fontSize: 10.0,
                    color: Color(0xFF37505D)),
                hintStyle: TextStyle(
                  fontFamily: ArabicFonts.Cairo,
                  package: 'google_fonts_arabic',
                ),
              ),
              keyboardType: TextInputType.text,
            ),
            //رابط الفيسبوك
            new TextFormField(
              decoration: new InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 5.0),
                  counterStyle: TextStyle(color: Color(0xFF37505D)),
                  labelText: "رابط الفيسبوك (إختياري)",
                  fillColor: Colors.red,
                  prefixIcon: Icon(FontAwesomeIcons.facebookF),
                  labelStyle: TextStyle(
                      fontFamily: ArabicFonts.Cairo,
                      fontSize: 10.0,
                      package: 'google_fonts_arabic',
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF37505D))),
              keyboardType: TextInputType.text,
            ),
            //رابط قوقل بلص
            new TextFormField(
              decoration: new InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 5.0),
                  counterStyle: TextStyle(color: Color(0xFF37505D)),
                  labelText: "رابط قوقل بلص (إختياري)",
                  fillColor: Colors.red,
                  prefixIcon: Icon(FontAwesomeIcons.googlePlusG),
                  labelStyle: TextStyle(
                      fontFamily: ArabicFonts.Cairo,
                      package: 'google_fonts_arabic',
                      fontWeight: FontWeight.bold,
                      fontSize: 10.0,
                      color: Color(0xFF37505D))),
              keyboardType: TextInputType.text,
            ),
            //رابط تويتر
            new TextFormField(
              decoration: new InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 5.0),
                  counterStyle: TextStyle(color: Color(0xFF37505D)),
                  labelText: "رابط تويتر (إختياري)",
                  fillColor: Colors.red,
                  prefixIcon: Icon(FontAwesomeIcons.twitter),
                  labelStyle: TextStyle(
                      fontFamily: ArabicFonts.Cairo,
                      package: 'google_fonts_arabic',
                      fontWeight: FontWeight.bold,
                      fontSize: 10.0,
                      color: Color(0xFF37505D))),
              keyboardType: TextInputType.text,
            ),
            //رابط لنك ان
            new TextFormField(
              decoration: new InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 5.0),
                  counterStyle: TextStyle(color: Color(0xFF37505D)),
                  labelText: "رابط لينكدان (إختياري)",
                  fillColor: Colors.red,
                  prefixIcon: Icon(Icons.location_city),
                  labelStyle: TextStyle(
                      fontFamily: ArabicFonts.Cairo,
                      package: 'google_fonts_arabic',
                      fontWeight: FontWeight.bold,
                      fontSize: 10.0,
                      color: Color(0xFF37505D))),
              keyboardType: TextInputType.text,
            ),
            //وصف المركز
            new TextFormField(
              decoration: new InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 5.0),
                  counterStyle: TextStyle(color: Color(0xFF37505D)),
                  labelText: "وصف المركز *",
                  fillColor: Colors.red,
                  prefixIcon: Icon(FontAwesomeIcons.discord),
                  labelStyle: TextStyle(
                      fontFamily: ArabicFonts.Cairo,
                      package: 'google_fonts_arabic',
                      fontSize: 10.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF37505D))),
              keyboardType: TextInputType.text,
              inputFormatters: [new LengthLimitingTextInputFormatter(30)],
              validator: (val) => val.isEmpty ? 'يرجى إدخال وصف المركز' : null,
            ),
          ],
        ),
        buttons: [
          DialogButton(
            onPressed: () => _onBasicAlertPressedOkay(context),
            color: Color(0xFFE91E63),
            child: Text(
              "إستعلام",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          )
        ]).show();
  }

//تمت العملية بنجاح
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

//التحقق من رقم الهاتف
  bool isValidPhoneNumber(String input) {
    final RegExp regex = new RegExp(r'^\d\d\d\d\d\d\d\d\d\d$');
    return regex.hasMatch(input);
  }

//التحقق من رقم البطاقة
  bool isValidIdNumber(String input) {
    final RegExp regex = new RegExp(r'^\d\d\d\d\d\d\d\d\d\d\d\d\d\d$');
    return regex.hasMatch(input);
  }

//التحقق من البريد الالكتروني
  bool isValidEmail(String input) {
    final RegExp regex = new RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
    return regex.hasMatch(input);
  }

//إظهار رسالة التحقق من ان البيانات خطا او صواب
  void showMessage(String message, [MaterialColor color = Colors.red]) {
    _scaffoldKey.currentState.showSnackBar(
        new SnackBar(backgroundColor: color, content: new Text(message)));
  }
}
