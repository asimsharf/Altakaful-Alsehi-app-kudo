import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:takaful/api/APIsServices.dart';
import 'package:takaful/language/app_translations.dart';
import 'package:takaful/model/ModelCard.dart';

class RequestCard extends StatefulWidget {
  @override
  _RequestCardState createState() => new _RequestCardState();
}

class _RequestCardState extends State<RequestCard> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  final TextEditingController _controller = new TextEditingController();
  List<String> _genders = <String>[
    '',
    'ذكر',
    'انثى',
  ];
  String _gender = '';

  //جلب كل المدن على
  String _myCitySelection;
  List CityData = List(); //edited line
  Future<String> getCityById() async {
    final String _CityUrl = "http://23.111.185.155:4000/takaful/api/city";
    var _CityRes = await http
        .get(Uri.encodeFull(_CityUrl), headers: {"Accept": "application/json"});
    var CityResBody = json.decode(_CityRes.body);
    setState(() {
      CityData = CityResBody['response'];
    });
    return "Sucess";
  }

  ModelCard New_Model_Card = new ModelCard();

  //إعدادات إختيار الوقت والتاريخ
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

  //التحكم في الحقول
  TextEditingController full_nameController = TextEditingController();
  TextEditingController nationalityController = TextEditingController();
  TextEditingController identity_numberController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  @override
  void initState() {
    super.initState();
    this.getCityById();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scaffoldKey,
      body: new Stack(fit: StackFit.passthrough, children: <Widget>[
        SafeArea(
          top: true,
          bottom: false,
          child: new Form(
            key: _formKey,
            autovalidate: false,
            child: new ListView(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 1.0),
              children: <Widget>[
                Center(
                  child: new Text(
                    AppTranslations.of(context).text("tab_req_card"),
                    style: TextStyle(
                        fontFamily: ArabicFonts.Cairo,
                        fontSize: 20.0,
                        package: 'google_fonts_arabic',
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF37505D)),
                  ),
                ),

                //الاسم بالكامل
                new TextFormField(
                  controller: full_nameController,
                  //onChanged: (val) => full_nameController.text = val,
                  maxLength: 32,
                  autofocus: true,
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
                  onSaved: (val) => New_Model_Card.full_name = val,
                ),
                //الجنسية
                new TextFormField(
                  controller: nationalityController,
                  maxLength: 20,
                  autofocus: true,
                  decoration: const InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 1.0),
                    prefixIcon: const Icon(Icons.perm_identity),
                    hintText: 'إدخل الجنسية',
                    labelText: 'الجنسية *',
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
                  inputFormatters: [new LengthLimitingTextInputFormatter(30)],
                  validator: (val) => val.isEmpty ? 'يردى إدخال الجنسية' : null,
                  onSaved: (val) => New_Model_Card.nationality = val,
                ),
                //رقم الهوية
                new TextFormField(
                  controller: identity_numberController,
                  maxLength: 14,
                  autofocus: true,
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
                        new RegExp(r'^[\d -]{1,15}$')),
                  ],
                  validator: (value) => isValidIdNumber(value)
                      ? null
                      : 'يجب إدخال رقم الهوية كـ (----------)',
                  onSaved: (val) => New_Model_Card.identity_number = val,
                ),
                //الهاتف
                new TextFormField(
                  controller: phoneController,
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
                        new RegExp(r'^[\d -]{1,15}$')),
                  ],
                  validator: (value) => isValidPhoneNumber(value)
                      ? null
                      : 'يجب إدخال رقم الهاتف كـ (###) ### - ####',
                  onSaved: (val) => New_Model_Card.phone = val,
                ),
                //البريد الالكتروني
                new TextFormField(
                  controller: emailController,
                  autofocus: true,
                  decoration: const InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 1.0),
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
                  onSaved: (val) => New_Model_Card.email = val,
                ),
                //المدينة
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
                      isEmpty: CityData == '',
                      child: new DropdownButtonHideUnderline(
                        child: new DropdownButton(
                          items: CityData.map((item) {
                            return new DropdownMenuItem(
                              child: new Text(item['ar_title']),
                              value: item['id'].toString(),
                            );
                          }).toList(),
                          onChanged: (newVal) {
                            setState(() {
                              New_Model_Card.city_code = newVal;
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
                //العنوان
                new TextFormField(
                  controller: addressController,
                  maxLength: 40,
                  autofocus: true,
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
                  inputFormatters: [new LengthLimitingTextInputFormatter(30)],
                  validator: (val) => val.isEmpty ? 'يرجى إدخال العنوان' : null,
                  onSaved: (val) => New_Model_Card.address = val,
                ),
                //تاريخ الميلاد
                new Row(children: <Widget>[
                  new Expanded(
                      child: new TextFormField(
                    autofocus: true,
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
                        isValidDob(val) ? null : 'ليس تاريخ صالح',
                    onSaved: (val) =>
                        New_Model_Card.birth_date = convertToDate(val),
                  )),
                ]),
                //الجنس
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
                              New_Model_Card.gender = newValue;
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
                //طلب بطاقة
                new Container(
                    padding: const EdgeInsets.only(left: 0.0, top: 10.0),
                    child: new RaisedButton(
                      color: Color(0xFFE91E63),
                      child: const Text(
                        'طلب',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: ArabicFonts.Cairo,
                          package: 'google_fonts_arabic',
                        ),
                      ),
                      onPressed: _submitForm,
                    )),
              ],
            ),
          ),
        ),
      ]),
    );
  }

  bool isValidDob(String birth_date) {
    if (birth_date.isEmpty) return true;
    var d = convertToDate(birth_date);
    return d != null && d.isBefore(new DateTime.now());
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
      print('Form save called, New_Model_Card is now up to date...');
      //print('Client ID: ${New_Model_Card.client_id}');
      print('Full Name: ${New_Model_Card.full_name}');
      print('Phone: ${New_Model_Card.phone}');
      print('Email: ${New_Model_Card.email}');
      print('Nationality: ${New_Model_Card.nationality}');
      print('Address: ${New_Model_Card.address}');
      print('Gender: ${New_Model_Card.gender}');
      print('Identity Number: ${New_Model_Card.identity_number}');
      print('Birth Date: ${New_Model_Card.birth_date}');
      print('City Code: ${New_Model_Card.city_code}');
      print('***********************************************************');
      print('Submitting to back end...');
      print('TODO - we will write the submission part next...');
      var cardService = new ApiCardServices();
      cardService.createCard(New_Model_Card).then(
          (value) => showMessage(' تم إنشاء حساب مشترك جديد  ! ', Colors.blue));
      print('######################################################');
    }
  }

  void showMessage(String message, [MaterialColor color = Colors.red]) {
    _scaffoldKey.currentState.showSnackBar(
        new SnackBar(backgroundColor: color, content: new Text(message)));
  }
}
