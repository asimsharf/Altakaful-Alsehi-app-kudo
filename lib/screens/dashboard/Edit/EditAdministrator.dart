import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:takaful/api/APIsServices.dart';
import 'package:takaful/model/ModelCenters.dart';

class EditAdministrator extends StatefulWidget {
  int admin_id;
  String administrator;
  String identity_number;
  String phone;
  String email;
  String password;

  EditAdministrator({
    this.admin_id,
    this.administrator,
    this.identity_number,
    this.phone,
    this.email,
    this.password,
  });

  @override
  State createState() => _EditAdministrator();
}

class _EditAdministrator extends State<EditAdministrator>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  ModelCenters newModelCenters = new ModelCenters();

//==================================================================
  bool _obscureText = true;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

//==================================================================

//==================================================================
  @override
  void initState() {
    administratorController = TextEditingController(text: widget.administrator);
    identityNumberController =
        TextEditingController(text: widget.identity_number);
    phoneController = TextEditingController(text: widget.phone);
    emailController = TextEditingController(text: widget.email);
    passwordController = TextEditingController(text: widget.password);
    rePasswordController = TextEditingController(text: widget.password);

    super.initState();
  }

//==================================================================

//==================================================================
  TextEditingController administratorController;
  TextEditingController identityNumberController;
  TextEditingController phoneController;
  TextEditingController emailController;
  TextEditingController passwordController;
  TextEditingController rePasswordController;

//==================================================================

//==================================================================
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scaffoldKey,
      body: new Padding(
        padding: EdgeInsets.all(16),
        child: Material(
          elevation: 1,
          clipBehavior: Clip.antiAlias,
          borderRadius: BorderRadius.circular(8),
          child: new Form(
            key: _formKey,
            //autovalidate: true,
            child: new ListView(
              padding: const EdgeInsets.all(5.0),
              children: <Widget>[
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
                  onSaved: (val) => newModelCenters.administrator = val,
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
                  onSaved: (val) => newModelCenters.phone = val,
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
                  onSaved: (val) => newModelCenters.email = val,
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
                      onSaved: (val) => newModelCenters.password = val,
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
                  onSaved: (val) => newModelCenters.identity_number = val,
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
      var cardService = new ApiEditAdministratorServices();
      cardService.editAdministrator(newModelCenters).then(
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
