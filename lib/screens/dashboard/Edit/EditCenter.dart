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

class EditCreate extends StatefulWidget {
  int center_id;
  String address;
  String center;
  String description;
  String logo;
  String profile;
  String join_date;
  String open_at;
  String close_at;
  String website;
  String facebook;
  String google;
  String twitter;
  String linkedin;

  EditCreate({
    this.center_id,
    this.address,
    this.center,
    this.description,
    this.logo,
    this.profile,
    this.join_date,
    this.open_at,
    this.close_at,
    this.website,
    this.facebook,
    this.google,
    this.twitter,
    this.linkedin,
  });
  @override
  State createState() => _EditCreate();
}

class _EditCreate extends State<EditCreate>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  ModelCenters newModelCenters = new ModelCenters();

//==================================================================

/*
 *fetch all Centers types
 */

  String _myCenterTypeSelection;
  List centersData = List(); //edited line
  Future<String> getCentersType() async {
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

//==================================================================

/*
 * Get all country
 */

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

//==================================================================
/*
 * Get all cities by country id
 */
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
//==================================================================

//==================================================================
//  bool _obscureText = true;
//  void _toggle() {
//    setState(() {
//      _obscureText = !_obscureText;
//    });
//  }
//==================================================================

//==================================================================
  @override
  void initState() {
    addressController = TextEditingController(text: widget.address);
    centerController = TextEditingController(text: widget.center);
    descriptionController = TextEditingController(text: widget.description);
    websiteController = TextEditingController(text: widget.website);
    facebookController = TextEditingController(text: widget.facebook);
    googleController = TextEditingController(text: widget.google);
    twitterController = TextEditingController(text: widget.twitter);
    linkedinController = TextEditingController(text: widget.linkedin);
    super.initState();
    this.getCentersType();
    this.getCountry();
    this.getCityByCountryId();
  }
//==================================================================

//==================================================================
  TextEditingController addressController;
  TextEditingController centerController;
  TextEditingController descriptionController;
  TextEditingController websiteController;
  TextEditingController facebookController;
  TextEditingController googleController;
  TextEditingController twitterController;
  TextEditingController linkedinController;
//==================================================================

//==================================================================
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
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
                  onSaved: (val) => newModelCenters.center = val,
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
                  onSaved: (val) => newModelCenters.address = val,
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
                              newModelCenters.type_id = newVal;
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
                              newModelCenters.city_id = newVal;
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
                  onSaved: (val) => newModelCenters.website = val,
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
                  onSaved: (val) => newModelCenters.facebook = val,
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
                  onSaved: (val) => newModelCenters.google = val,
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
                  onSaved: (val) => newModelCenters.twitter = val,
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
                  onSaved: (val) => newModelCenters.linkedin = val,
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
                  onSaved: (val) => newModelCenters.description = val,
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: new Container(
        color: Colors.white,
        child: Row(
          children: <Widget>[
            Expanded(
              child: new MaterialButton(
                onPressed: () => _submitForm(),
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
//==================================================================

//==================================================================
  bool isValidPhoneNumber(String input) {
    final RegExp regex = new RegExp(r'^\d\d\d\d\d\d\d\d\d\d$');
    return regex.hasMatch(input);
  }
//==================================================================

//==================================================================
  bool isValidIdNumber(String input) {
    final RegExp regex = new RegExp(r'^\d\d\d\d\d\d\d\d\d\d\d\d\d\d$');
    return regex.hasMatch(input);
  }
//==================================================================

//==================================================================
  bool isValidEmail(String input) {
    final RegExp regex = new RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
    return regex.hasMatch(input);
  }
//==================================================================

//==================================================================
  void _submitForm() {
    final FormState form = _formKey.currentState;

    if (!form.validate()) {
      showMessage('يرجى إدخال البيانات');
    } else {
      form.save(); //This invokes each onSaved event
      print('***********************************************************');
      print('Form save called, newModelCenters is now up to date...');
      print('administrator: ${newModelCenters.administrator}');
      print('password: ${newModelCenters.password}');
      print('Identity Number: ${newModelCenters.identity_number}');
      print('phone: ${newModelCenters.phone}');
      print('Email: ${newModelCenters.email}');
      print('logo: ${newModelCenters.logo}');
      print('type_id: ${newModelCenters.type_id}');
      print('city_id: ${newModelCenters.city_id}');
      print('Address: ${newModelCenters.address}');
      print('longitude: ${newModelCenters.longitude}');
      print('latitude: ${newModelCenters.latitude}');
      print('center: ${newModelCenters.center}');
      print('description: ${newModelCenters.description}');
      print('open_at: ${newModelCenters.open_at}');
      print('close_at: ${newModelCenters.close_at}');
      print('website: ${newModelCenters.website}');
      print('facebook: ${newModelCenters.facebook}');
      print('google: ${newModelCenters.google}');
      print('twitter: ${newModelCenters.twitter}');
      print('linkedin: ${newModelCenters.linkedin}');
      print('***********************************************************');
      print('Submitting to back end...');
      var cardService = new ApiEditCentersServices();
      cardService.editCenters(newModelCenters).then(
          (value) => showMessage(' تم تعديل البيانات  بنجاح  ! ', Colors.blue));
      print('######################################################');
    }
  }
//==================================================================

// ==================================================================
  void showMessage(String message, [MaterialColor color = Colors.red]) {
    _scaffoldKey.currentState.showSnackBar(
        new SnackBar(backgroundColor: color, content: new Text(message)));
  }
//==================================================================

}
