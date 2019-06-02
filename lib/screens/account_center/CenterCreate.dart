import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:http/http.dart' as http;
import 'package:takaful/api/APIsServices.dart';
import 'package:takaful/language/app_translations.dart';
import 'package:takaful/model/ModelCenters.dart';

class CenterCreate extends StatefulWidget {
  @override
  State createState() => _CenterCreate();
}

class _CenterCreate extends State<CenterCreate>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  Animation<double> _iconAnimation;
  AnimationController _iconAnimationController;

  ModelCenters New_Model_Centers = new ModelCenters();

  //fetch all Centers
  String _myCenterTypeSelection;
  List centersData = List(); //edited line
  Future<String> getCenters() async {
    final String centersUrl =
        "http://23.111.185.155:4000/takaful/api/center_type";
    var centersRes = await http.get(Uri.encodeFull(centersUrl),
        headers: {"Accept": "application/json"});
    var centersResBody = json.decode(centersRes.body);
    setState(() {
      centersData = centersResBody['response'];
    });
    return "Sucess";
  }

//==================================================================
  //Get all country
  String _myCountrySelection;
  List countryData = List(); //edited line
  Future<String> getCountry() async {
    final String countryUrl = "http://23.111.185.155:4000/takaful/api/country";
    var countryRes = await http.get(Uri.encodeFull(countryUrl),
        headers: {"Accept": "application/json"});
    var countryResBody = json.decode(countryRes.body);
    setState(() {
      countryData = countryResBody['response'];
    });
    return "Sucess";
  }

//==================================================================
  //Get all cities by country id
  String _myCitySelection;
  List cityData = List(); //edited line
  Future<String> getCityByCountryId() async {
    final String _cityUrl =
        "http://23.111.185.155:4000/takaful/api/country/2/city";

    print(_cityUrl);
    var _cityRes = await http
        .get(Uri.encodeFull(_cityUrl), headers: {"Accept": "application/json"});
    var cityResBody = json.decode(_cityRes.body);
    setState(() {
      cityData = cityResBody['response'];
    });
    return "Sucess";
  }

  // specific password value
  bool _obscureText = true;
  // show password state
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  void initState() {
    super.initState();
    this.getCenters();
    this.getCountry();
    this.getCityByCountryId();

    _iconAnimationController = new AnimationController(
        vsync: this, duration: new Duration(milliseconds: 500));
    _iconAnimation = new CurvedAnimation(
      parent: _iconAnimationController,
      curve: Curves.bounceOut,
    );
    _iconAnimation.addListener(() => this.setState(() {}));
    _iconAnimationController.forward();
  }

//==================================================================
  TextEditingController addressController = TextEditingController();
  TextEditingController centerController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController websiteController = TextEditingController();
  TextEditingController facebookController = TextEditingController();
  TextEditingController googleController = TextEditingController();
  TextEditingController twitterController = TextEditingController();
  TextEditingController linkedinController = TextEditingController();
  TextEditingController administratorController = TextEditingController();
  TextEditingController identityNumberController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();
//==================================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Material(
          elevation: 1,
          clipBehavior: Clip.antiAlias,
          borderRadius: BorderRadius.circular(8),
          child: Form(
            key: _formKey,
            //autovalidate: true,
            child: new ListView(
              padding: const EdgeInsets.all(5.0),
              children: <Widget>[
                //#####Center Information#####//
                new Padding(
                  padding: const EdgeInsets.only(top: 2.0),
                  child: new Text(
                    AppTranslations.of(context).text("center_info"),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: ArabicFonts.Cairo,
                        fontSize: 25.0,
                        package: 'google_fonts_arabic',
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF23AFB1)),
                  ),
                ),
                //Center Name
                new TextFormField(
                  controller: centerController,
                  maxLength: 32,
                  decoration: new InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 0.0),
                    counterStyle: TextStyle(color: Color(0xFF37505D)),
                    prefixIcon: Icon(FontAwesomeIcons.centercode),
                    hintText: 'إدخل إسم المركز',
                    labelText: "إسم المركز *",
                    labelStyle: TextStyle(
                        fontFamily: ArabicFonts.Cairo,
                        package: 'google_fonts_arabic',
                        fontWeight: FontWeight.bold,
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
                  onSaved: (val) => New_Model_Centers.center = val,
                ),
                //Address
                new TextFormField(
                  controller: addressController,
                  maxLength: 40,
                  decoration: new InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 0.0),
                    counterStyle: TextStyle(color: Color(0xFF37505D)),
                    hintText: 'إدخل العنوان',
                    labelText: "العنوان *",
                    fillColor: Color(0xFF37505D),
                    prefixIcon: Icon(FontAwesomeIcons.streetView),
                    labelStyle: TextStyle(
                        fontFamily: ArabicFonts.Cairo,
                        package: 'google_fonts_arabic',
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF37505D)),
                    hintStyle: TextStyle(
                      fontFamily: ArabicFonts.Cairo,
                      package: 'google_fonts_arabic',
                    ),
                  ),
                  keyboardType: TextInputType.text,
                  inputFormatters: [new LengthLimitingTextInputFormatter(30)],
                  validator: (val) => val.isEmpty ? 'يرجى إدخال العنوان' : null,
                  onSaved: (val) => New_Model_Centers.address = val,
                ),
                //Center type
                new FormField<String>(
                  builder: (FormFieldState<String> state) {
                    return InputDecorator(
                      decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.symmetric(vertical: 1.0),
                        prefixIcon: const Icon(Icons.line_style),
                        hintText: 'إدخل نوع المركز',
                        labelText: 'نوع المركز *',
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
                        errorText: state.hasError ? state.errorText : null,
                      ),
                      isEmpty: centersData == '',
                      child: new DropdownButtonHideUnderline(
                        child: new DropdownButton(
                          items: centersData.map((item) {
                            return new DropdownMenuItem(
                              child: new Text(item['ar_name']),
                              value: item['id'].toString(),
                            );
                          }).toList(),
                          value: _myCenterTypeSelection,
                          onChanged: (newVal) {
                            setState(() {
                              New_Model_Centers.type_id = newVal;
                              _myCenterTypeSelection = newVal;
                              state.didChange(newVal);
                            });
                          },
                        ),
                      ),
                    );
                  },
                ),
                //Country
                new FormField<String>(
                  builder: (FormFieldState<String> state) {
                    return InputDecorator(
                      decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.symmetric(vertical: 1.0),
                        prefixIcon: const Icon(Icons.home),
                        hintText: 'إدخل الدولة',
                        labelText: 'الدولة *',
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
                        errorText: state.hasError ? state.errorText : null,
                      ),
                      isEmpty: countryData == '',
                      child: new DropdownButtonHideUnderline(
                        child: new DropdownButton(
                          items: countryData.map((item) {
                            return new DropdownMenuItem(
                              child: new Text(item['ar_title']),
                              value: item['id'].toString(),
                            );
                          }).toList(),
                          onChanged: (newVal) {
                            setState(() {
                              _myCountrySelection = newVal;
                            });
                          },
                          value: _myCountrySelection,
                        ),
                      ),
                    );
                  },
                ),
                //City
                new FormField<String>(
                  builder: (FormFieldState<String> state) {
                    return InputDecorator(
                      decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.symmetric(vertical: 1.0),
                        counterStyle: TextStyle(color: Color(0xFF37505D)),
                        prefixIcon: const Icon(Icons.location_city),
                        hintText: 'إدخل المدينة',
                        labelText: 'المدينة *',
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
                        errorText: state.hasError ? state.errorText : null,
                      ),
                      isEmpty: cityData == '',
                      child: new DropdownButtonHideUnderline(
                        child: new DropdownButton(
                          items: cityData.map((item) {
                            return new DropdownMenuItem(
                              child: new Text(item['ar_title']),
                              value: item['id'].toString(),
                            );
                          }).toList(),
                          onChanged: (newVal) {
                            setState(() {
                              New_Model_Centers.city_id = newVal;
                              _myCitySelection = newVal;
                              state.didChange(newVal);
                            });
                          },
                          value: _myCitySelection,
                        ),
                      ),
                    );
                  },
                ),
                //Website
                new TextFormField(
                  controller: websiteController,
                  decoration: new InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 0.0),
                    counterStyle: TextStyle(color: Color(0xFF37505D)),
                    labelText: "الموقع الإلكتروني (إختياري)",
                    fillColor: Colors.red,
                    prefixIcon: Icon(FontAwesomeIcons.sitemap),
                    labelStyle: TextStyle(
                        fontFamily: ArabicFonts.Cairo,
                        package: 'google_fonts_arabic',
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF37505D)),
                    hintStyle: TextStyle(
                      fontFamily: ArabicFonts.Cairo,
                      package: 'google_fonts_arabic',
                    ),
                  ),
                  keyboardType: TextInputType.text,
                  onSaved: (val) => New_Model_Centers.website = val,
                ),
                //Facebook
                new TextFormField(
                  controller: facebookController,
                  decoration: new InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(vertical: 0.0),
                      counterStyle: TextStyle(color: Color(0xFF37505D)),
                      labelText: "رابط الفيسبوك (إختياري)",
                      fillColor: Colors.red,
                      prefixIcon: Icon(FontAwesomeIcons.facebookF),
                      labelStyle: TextStyle(
                          fontFamily: ArabicFonts.Cairo,
                          package: 'google_fonts_arabic',
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF37505D))),
                  keyboardType: TextInputType.text,
                  onSaved: (val) => New_Model_Centers.facebook = val,
                ),
                //Google
                new TextFormField(
                  controller: googleController,
                  decoration: new InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(vertical: 0.0),
                      counterStyle: TextStyle(color: Color(0xFF37505D)),
                      labelText: "رابط قوقل بلص (إختياري)",
                      fillColor: Colors.red,
                      prefixIcon: Icon(FontAwesomeIcons.googlePlusG),
                      labelStyle: TextStyle(
                          fontFamily: ArabicFonts.Cairo,
                          package: 'google_fonts_arabic',
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF37505D))),
                  keyboardType: TextInputType.text,
                  onSaved: (val) => New_Model_Centers.google = val,
                ),
                //Twitter
                new TextFormField(
                  controller: twitterController,
                  decoration: new InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(vertical: 0.0),
                      counterStyle: TextStyle(color: Color(0xFF37505D)),
                      labelText: "رابط تويتر (إختياري)",
                      fillColor: Colors.red,
                      prefixIcon: Icon(FontAwesomeIcons.twitter),
                      labelStyle: TextStyle(
                          fontFamily: ArabicFonts.Cairo,
                          package: 'google_fonts_arabic',
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF37505D))),
                  keyboardType: TextInputType.text,
                  onSaved: (val) => New_Model_Centers.twitter = val,
                ),
                //Linkedin
                new TextFormField(
                  controller: linkedinController,
                  decoration: new InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(vertical: 0.0),
                      counterStyle: TextStyle(color: Color(0xFF37505D)),
                      labelText: "رابط لينكدان (إختياري)",
                      fillColor: Colors.red,
                      prefixIcon: Icon(Icons.location_city),
                      labelStyle: TextStyle(
                          fontFamily: ArabicFonts.Cairo,
                          package: 'google_fonts_arabic',
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF37505D))),
                  keyboardType: TextInputType.text,
                  onSaved: (val) => New_Model_Centers.linkedin = val,
                ),
                //Description
                new TextFormField(
                  controller: descriptionController,
                  decoration: new InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(vertical: 0.0),
                      counterStyle: TextStyle(color: Color(0xFF37505D)),
                      labelText: "وصف المركز *",
                      fillColor: Colors.red,
                      prefixIcon: Icon(FontAwesomeIcons.discord),
                      labelStyle: TextStyle(
                          fontFamily: ArabicFonts.Cairo,
                          package: 'google_fonts_arabic',
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF37505D))),
                  keyboardType: TextInputType.text,
                  inputFormatters: [new LengthLimitingTextInputFormatter(30)],
                  validator: (val) =>
                      val.isEmpty ? 'يرجى إدخال وصف المركز' : null,
                  onSaved: (val) => New_Model_Centers.description = val,
                ),
                //#####Adminstrator inforomation#####//
                new Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: new Text(
                    "بيانات المسؤل",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: ArabicFonts.Cairo,
                        fontSize: 25.0,
                        package: 'google_fonts_arabic',
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF23AFB1)),
                  ),
                ),
                //Adminstrator
                new TextFormField(
                  controller: administratorController,
                  maxLength: 32,
                  decoration: new InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(vertical: 0.0),
                      counterStyle: TextStyle(color: Color(0xFF37505D)),
                      prefixIcon: Icon(FontAwesomeIcons.user),
                      labelText: "الإسم *",
                      labelStyle: TextStyle(
                          fontFamily: ArabicFonts.Cairo,
                          package: 'google_fonts_arabic',
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF37505D))),
                  keyboardType: TextInputType.text,
                  inputFormatters: [new LengthLimitingTextInputFormatter(30)],
                  validator: (val) =>
                      val.isEmpty ? 'يرجى إدخال إسم المسؤول' : null,
                  onSaved: (val) => New_Model_Centers.administrator = val,
                ),
                //Phone
                new TextFormField(
                  controller: phoneController,
                  maxLength: 10,
                  decoration: new InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 0.0),
                    counterStyle: TextStyle(color: Color(0xFF37505D)),
                    fillColor: Color(0xFF37505D),
                    prefixIcon: Icon(Icons.phone),
                    hintText: 'يرجى إدخال الهاتف',
                    labelText: 'الهاتف *',
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
                  keyboardType: TextInputType.phone,
                  inputFormatters: [
                    new WhitelistingTextInputFormatter(
                        new RegExp(r'^[\d -]{1,15}$')),
                  ],
                  validator: (value) => isValidPhoneNumber(value)
                      ? null
                      : 'يجب إدخال رقم الهاتف كـ (###) ### - ####',
                  onSaved: (val) => New_Model_Centers.phone = val,
                ),
                //email
                new TextFormField(
                  controller: emailController,
                  decoration: new InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 0.0),
                    counterStyle: TextStyle(color: Color(0xFF37505D)),
                    hintText: 'you@example.com',
                    labelText: 'البريد الإلكتروني (إختياري)',
                    prefixIcon: Icon(Icons.email),
                    fillColor: Color(0xFF37505D),
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
                  validator: (value) => isValidEmail(value)
                      ? null
                      : 'من فضلك أدخل بريد أليكترونى صحيح',
                  keyboardType: TextInputType.emailAddress,
                  onSaved: (val) => New_Model_Centers.email = val,
                ),
                //Password
                new Column(
                  children: <Widget>[
                    new TextFormField(
                      controller: passwordController,
                      maxLength: 10,
                      decoration: new InputDecoration(
                          counterStyle: TextStyle(color: Color(0xFF37505D)),
                          prefixIcon: Icon(Icons.lock),
                          suffixIcon: FlatButton(
                              onPressed: _toggle,
                              child:
                                  new Text(_obscureText ? "إظهار" : "إخفاء")),
                          hintText: 'إدخل كلمة المرور',
                          labelText: "كلمة المرور *",
                          labelStyle: TextStyle(
                              fontFamily: ArabicFonts.Cairo,
                              package: 'google_fonts_arabic',
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF37505D))),
                      keyboardType: TextInputType.text,
                      inputFormatters: [
                        new LengthLimitingTextInputFormatter(30)
                      ],
                      validator: (val) => val.length < 6 || val.isEmpty
                          ? 'يرجى إدخال كلمة مرور أكبر من 6 أحرف'
                          : null,
                      onSaved: (val) => New_Model_Centers.password = val,
                      obscureText: _obscureText,
                    ),
                  ],
                ),
                //Re type Password
                new Column(
                  children: <Widget>[
                    new TextFormField(
                      controller: rePasswordController,
                      maxLength: 10,
                      decoration: new InputDecoration(
                          counterStyle: TextStyle(color: Color(0xFF37505D)),
                          prefixIcon: Icon(Icons.lock),
                          suffixIcon: FlatButton(
                              onPressed: _toggle,
                              child:
                                  new Text(_obscureText ? "إظهار" : "إخفاء")),
                          hintText: 'إعادة إدخال كلمة المرور',
                          labelText: "إعادة كلمة المرور *",
                          labelStyle: TextStyle(
                              fontFamily: ArabicFonts.Cairo,
                              package: 'google_fonts_arabic',
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF37505D))),
                      keyboardType: TextInputType.text,
                      inputFormatters: [
                        new LengthLimitingTextInputFormatter(30)
                      ],
                      validator: (value) {
                        if (value != passwordController.text) {
                          return 'عفواً كلمة المرور لا تتطابق !';
                        }
                      },
                      obscureText: _obscureText,
                    ),
                  ],
                ),
                //Identity_number
                new TextFormField(
                  controller: identityNumberController,
                  maxLength: 14,
                  decoration: new InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(vertical: 0.0),
                      counterStyle: TextStyle(color: Color(0xFF37505D)),
                      labelText: "رقم الهوية *",
                      prefixIcon: Icon(Icons.confirmation_number),
                      fillColor: Color(0xFF37505D),
                      labelStyle: TextStyle(
                          fontFamily: ArabicFonts.Cairo,
                          package: 'google_fonts_arabic',
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF37505D))),
                  keyboardType: TextInputType.number,
                  inputFormatters: [new LengthLimitingTextInputFormatter(30)],
                  validator: (val) =>
                      val.isEmpty ? 'يرجى إدخال رقم الهوية' : null,
                  onSaved: (val) => New_Model_Centers.identity_number = val,
                ),
                new Padding(
                  padding: const EdgeInsets.only(
                      left: 8.0, right: 8.0, bottom: 10.0),
                ),
                //Register
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
                  onPressed: () => _submitForm(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool isValidPhoneNumber(String input) {
    final RegExp regex = new RegExp(r'^\d\d\d\d\d\d\d\d\d\d$');
    return regex.hasMatch(input);
  }

  bool isValidIdNumber(String input) {
    final RegExp regex = new RegExp(r'^\d\d\d\d\d\d\d\d\d\d\d\d\d\d$');
    return regex.hasMatch(input);
  }

  bool isValidEmail(String input) {
    final RegExp regex = new RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
    return regex.hasMatch(input);
  }

  void _submitForm() {
    final FormState form = _formKey.currentState;

    if (!form.validate()) {
      showMessage('يرجى إدخال البيانات');
    } else {
      form.save(); //This invokes each onSaved event
      print('***********************************************************');
      print('Form save called, New_Model_Centers is now up to date...');
      print('administrator: ${New_Model_Centers.administrator}');
      print('password: ${New_Model_Centers.password}');
      print('Identity Number: ${New_Model_Centers.identity_number}');
      print('phone: ${New_Model_Centers.phone}');
      print('Email: ${New_Model_Centers.email}');
      print('logo: ${New_Model_Centers.logo}');
      print('type_id: ${New_Model_Centers.type_id}');
      print('city_id: ${New_Model_Centers.city_id}');
      print('Address: ${New_Model_Centers.address}');
      print('longitude: ${New_Model_Centers.longitude}');
      print('latitude: ${New_Model_Centers.latitude}');
      print('center: ${New_Model_Centers.center}');
      print('description: ${New_Model_Centers.description}');
      print('open_at: ${New_Model_Centers.open_at}');
      print('close_at: ${New_Model_Centers.close_at}');
      print('website: ${New_Model_Centers.website}');
      print('facebook: ${New_Model_Centers.facebook}');
      print('google: ${New_Model_Centers.google}');
      print('twitter: ${New_Model_Centers.twitter}');
      print('linkedin: ${New_Model_Centers.linkedin}');
      print('***********************************************************');
      print('Submitting to back end...');
      var cardService = new Api_Centers_Services();
      cardService.createCenters(New_Model_Centers).then(
          (value) => showMessage(' تم إنشاء حساب مشترك جديد  ! ', Colors.blue));
      print('######################################################');
    }
  }

  void showMessage(String message, [MaterialColor color = Colors.red]) {
    _scaffoldKey.currentState.showSnackBar(
        new SnackBar(backgroundColor: color, content: new Text(message)));
  }
}
