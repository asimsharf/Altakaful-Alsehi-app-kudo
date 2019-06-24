import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:takaful/api/APIsServices.dart';
import 'package:takaful/language/app_translations.dart';
import 'package:takaful/model/ModelClient.dart';
import 'package:takaful/screens/image/image_picker_handler.dart';

class EditProfilePage extends StatefulWidget {
  EditProfilePage({Key key}) : super(key: key);
  @override
  _EditProfilePage createState() => new _EditProfilePage();
}

class _EditProfilePage extends State<EditProfilePage>
    with
        SingleTickerProviderStateMixin,
        TickerProviderStateMixin,
        ImagePickerListener {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  File _image;
  AnimationController _controllers;
  ImagePickerHandler imagePicker;

  List<String> _genders = <String>[
    '',
    'ذكر',
    'انثى',
  ];
  String _gender = '';

  Model_Client _newModelClient = new Model_Client();
  final TextEditingController _controller = new TextEditingController();
  //show date time pick up
  Future _chooseDate(BuildContext context, String initialDateString) async {
    var now = new DateTime.now();
    var initialDate = convertToDate(initialDateString) ?? now;
    initialDate = (initialDate.year >= 1900 && initialDate.isBefore(now)
        ? initialDate
        : now);
    var result = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: new DateTime(1900),
        lastDate: new DateTime.now());
    if (result == null) return;
    setState(() {
      _controller.text = new DateFormat.yMd().format(result);
    });
  }

  DateTime convertToDate(String input) {
    try {
      var d = new DateFormat.yMd().parseStrict(input);
      return d;
    } catch (e) {
      return null;
    }
  }

  //fetch all the counties
  String _mySelection;
  String getID;
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

  //fetch all cities by country ID
  String _myCitySelection;
  List cityData = List(); //edited line
  Future<String> getCityById() async {
    final String _cityUrl =
        "http://23.111.185.155:4000/takaful/api/country/2/city";
    var _cityRes = await http
        .get(Uri.encodeFull(_cityUrl), headers: {"Accept": "application/json"});
    var cityResBody = json.decode(_cityRes.body);
    setState(() {
      cityData = cityResBody['response'];
    });
    return "Sucess";
  }

  bool _obscureText = true;
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  userImage(File _image) {
    setState(() {
      this._image = _image;
    });
  }

  @override
  void dispose() {
    _controllers.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    this.getCountry();
    this.getCityById();
    _controllers = new AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    imagePicker = new ImagePickerHandler(this, _controllers);
    imagePicker.init();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('تعديل الملف الشخصي'),
      ),
      body: new Stack(fit: StackFit.passthrough, children: <Widget>[
        SafeArea(
          top: true,
          bottom: false,
          child: new Form(
            key: _formKey,
            autovalidate: false,
            child: new ListView(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 1.0),
              children: <Widget>[
                new Center(
                  child: new Text(
                    AppTranslations.of(context).text("register_client_account"),
                    style: TextStyle(
                        fontSize: 23.0,
                        fontFamily: ArabicFonts.Cairo,
                        package: 'google_fonts_arabic',
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF37505D)),
                  ),
                ),
                //Select image
                new GestureDetector(
                  onTap: () => imagePicker.showDialog(context),
                  child: new Center(
                    child: _image == null
                        ? new Stack(
                            children: <Widget>[
                              new Center(
                                child: new CircleAvatar(
                                  radius: 50.0,
                                  backgroundColor: Colors.white70,
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
                //full name
                new TextFormField(
                  autofocus: true,
                  maxLength: 32,
                  decoration: const InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 1.0),
                    prefixIcon: const Icon(Icons.person),
                    hintText: 'إدخل الاسم الاول الثاني',
                    labelText: 'الإسم بالكامل *',
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
                  keyboardType: TextInputType.text,
                  inputFormatters: [new LengthLimitingTextInputFormatter(30)],
                  validator: (val) => val.isEmpty ? 'يرجى إدخال الإسم' : null,
                  onSaved: (val) => _newModelClient.name = val,
                ),
                //ID number
                new TextFormField(
                  autofocus: true,
                  maxLength: 14,
                  decoration: const InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 1.0),
                    prefixIcon: const Icon(Icons.perm_identity),
                    hintText: 'يرجى إدخال رقم الهوية',
                    labelText: 'رقم الهويه *',
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
                        new RegExp(r'^[\d -]{1,14}$')),
                  ],
                  validator: (value) => isValidIdentityNumber(value)
                      ? null
                      : 'يجب إدخال رقم الهوية كـ (----------)',
                  onSaved: (val) => _newModelClient.identity_number = val,
                ),
                //phone
                new TextFormField(
                  autofocus: true,
                  maxLength: 12,
                  decoration: const InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 1.0),
                    prefixIcon: const Icon(Icons.phone),
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
                        new RegExp(r'^[\d -]{1,12}$')),
                  ],
                  validator: (value) => isValidPhoneNumber(value)
                      ? null
                      : 'يجب إدخال رقم الهاتف كـ (###) ### - ####',
                  onSaved: (val) => _newModelClient.phone = val,
                ),
                // email
                new TextFormField(
                  autofocus: true,
                  decoration: const InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
                    prefixIcon: const Icon(Icons.email),
                    hintText: 'أدخل عنوان البريد الإلكتروني',
                    labelText: 'البريد الإلكتروني (إختياري)',
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
                  keyboardType: TextInputType.emailAddress,
                  onSaved: (val) => _newModelClient.email = val,
                ),
                //password
                new TextFormField(
                  maxLength: 10,
                  decoration: new InputDecoration(
                      counterStyle: TextStyle(color: Color(0xFF37505D)),
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: FlatButton(
                          onPressed: _toggle,
                          child: new Text(_obscureText ? "إظهار" : "إخفاء")),
                      hintText: 'إدخل كلمة المرور',
                      labelText: "كلمة المرور *",
                      labelStyle: TextStyle(
                          fontFamily: ArabicFonts.Cairo,
                          package: 'google_fonts_arabic',
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF37505D))),
                  keyboardType: TextInputType.text,
                  inputFormatters: [new LengthLimitingTextInputFormatter(30)],
                  validator: (val) => val.length < 6 || val.isEmpty
                      ? 'يرجى إدخال كلمة مرور أكبر من 6 أحرف'
                      : null,
                  onSaved: (val) => _newModelClient.password = val,
                  obscureText: _obscureText,
                ),
                //address
                new TextFormField(
                  autofocus: true,
                  maxLength: 40,
                  decoration: const InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 1.0),
                    prefixIcon: const Icon(Icons.add_location),
                    hintText: 'إدخل العنوان',
                    labelText: 'العنوان *',
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
                  keyboardType: TextInputType.text,
                  inputFormatters: [new LengthLimitingTextInputFormatter(40)],
                  //validator: (val) => val.isEmpty ? 'يرجى إدخال العنوان' : null,
                  onSaved: (val) => _newModelClient.address_text = val,
                ),
                //gender
                new FormField<String>(
                  builder: (FormFieldState<String> state) {
                    return InputDecorator(
                      decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.symmetric(vertical: 1.0),
                        prefixIcon: const Icon(Icons.person_pin),
                        labelText: 'الجنس *',
                        labelStyle: TextStyle(
                          color: Color(0xFF37505D),
                          fontWeight: FontWeight.bold,
                          fontFamily: ArabicFonts.Cairo,
                          package: 'google_fonts_arabic',
                        ),
                        errorText: state.hasError ? state.errorText : null,
                      ),
                      isEmpty: _gender == '',
                      child: new DropdownButtonHideUnderline(
                        child: new DropdownButton<String>(
                          //hint: Text("إختيار الجنس"),
                          value: _gender,
                          isDense: true,
                          onChanged: (String newValue) {
                            setState(() {
                              _newModelClient.gender = newValue;
                              _gender = newValue;
                              state.didChange(newValue);
                            });
                          },
                          items: _genders.map((String value) {
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
                // dateBarth
                new Row(children: <Widget>[
                  new Expanded(
                      child: new TextFormField(
                    decoration: new InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(vertical: 1.0),
                      prefixIcon: const Icon(Icons.calendar_today),
                      suffixIcon: new IconButton(
                        icon: new Icon(Icons.date_range),
                        tooltip: 'اختر موعدا',
                        onPressed: (() {
                          _chooseDate(context, _controller.text);
                        }),
                      ),
                      hintText: 'يرجى إدخال تاريخ الميلاد',
                      labelText: 'تاريخ الميلاد *',
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
                    controller: _controller,
                    keyboardType: TextInputType.datetime,
                    validator: (val) =>
                        isValidDateBarth(val) ? null : 'ليس تاريخ صالح',
                    onSaved: (val) =>
                        _newModelClient.birth_date = convertToDate(val),
                  )),
                ]),
                //country
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
                            getID = item['id'].toString();
                            return new DropdownMenuItem(
                              child: new Text(item['ar_title']),
                              value: getID,
                            );
                          }).toList(),
                          onChanged: (newVal) {
                            setState(() {
                              _mySelection = newVal;
                            });
                          },
                          value: _mySelection,
                        ),
                      ),
                    );
                  },
                ),
                //city
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
                              _newModelClient.city_id = newVal;
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

                new Padding(
                  padding: const EdgeInsets.only(
                      left: 8.0, right: 8.0, bottom: 10.0),
                ),
                //update button
                new MaterialButton(
                  height: 40.0,
                  minWidth: 150.0,
                  color: Color(0xFFE91E63),
                  splashColor: Color(0xFFFF1B5E),
                  textColor: Colors.white,
                  child: new Text("تعديل البيانات",
                      style: TextStyle(
                          fontFamily: ArabicFonts.Cairo,
                          package: 'google_fonts_arabic',
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                  onPressed: _submitForm,
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }

  //check if the dateBarth is right or not
  bool isValidDateBarth(String birthDate) {
    if (birthDate.isEmpty) return true;
    var d = convertToDate(birthDate);
    return d != null && d.isBefore(new DateTime.now());
  }

//check if the phone number is right or not
  bool isValidPhoneNumber(String input) {
    final RegExp regex = new RegExp(r'^\d\d\d\d\d\d\d\d\d\d\d\d$');
    return regex.hasMatch(input);
  }

// check if the identity number is right
  bool isValidIdentityNumber(String input) {
    final RegExp regex = new RegExp(r'^\d\d\d\d\d\d\d\d\d\d\d\d\d\d$');
    return regex.hasMatch(input);
  }

//check if the email is valid
  bool isValidEmail(String input) {
    final RegExp regex = new RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
    return regex.hasMatch(input);
  }

  //this form use to save the data which submitted to the api
  void _submitForm() {
    final FormState form = _formKey.currentState;
    if (!form.validate()) {
      showMessage('يرجى إدخال البيانات');
    } else {
      form.save(); //This invokes each onSaved event
      print('***********************************************************');
      print('Form save called, _newModelClient is now up to date...');
      print('City ID: ${_newModelClient.city_id}');
      print('Full Name: ${_newModelClient.name}');
      print('Phone: ${_newModelClient.phone}');
      print('Email: ${_newModelClient.email}');
      print('Password: ${_newModelClient.password}');
      print('Nationality: ${_newModelClient.address_text}');
      print('Address: ${_newModelClient.address_text}');
      print('Gender: ${_newModelClient.gender}');
      print('Birth Date: ${_newModelClient.birth_date}');
      print('Identity Number: ${_newModelClient.identity_number}');
      print('***********************************************************');
      print('######################################################');
      print('Submitting to back end...');
      print('TODO - we will write the submission part next...');
      var cardService = new ApiClientServices();
      cardService
          .createClient(_newModelClient)
          .then((value) => showMessage(' تم تحديث حساب مشترك! ', Colors.blue));
      print('######################################################');
    }
  }

  //this function use to show message or SnackBar
  void showMessage(String message, [MaterialColor color = Colors.red]) {
    _scaffoldKey.currentState.showSnackBar(
        new SnackBar(backgroundColor: color, content: new Text(message)));
  }
}
