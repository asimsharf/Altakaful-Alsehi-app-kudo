import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:takaful/language/app_translations.dart';
import 'package:takaful/screens/account_client/ProfilePage.dart';

class Centers extends StatefulWidget {
  int center_id;
  int admin_id;
  String address;
  String center;
  String longitude;
  String latitude;
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
  String administrator;
  String identity_number;
  String email;
  String phone;
  String admin_join_date;
  String Expire_from;
  String Expire_to;
  String license;
  String country_ar;
  String country_en;
  String country_code;
  String city_ar;
  String city_en;
  String type_ar;
  String type_en;

  Centers({
    this.center_id,
    this.address,
    this.latitude,
    this.longitude,
    this.center,
    this.description,
    this.logo,
    this.phone,
    this.profile,
    this.join_date,
    this.open_at,
    this.close_at,
    this.website,
    this.facebook,
    this.google,
    this.twitter,
    this.linkedin,
    this.admin_id,
    this.administrator,
    this.identity_number,
    this.email,
    this.admin_join_date,
    this.Expire_from,
    this.Expire_to,
    this.license,
    this.country_ar,
    this.country_en,
    this.country_code,
    this.city_ar,
    this.city_en,
    this.type_ar,
    this.type_en,
  });
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

  var rating = 1.2;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text(
          AppTranslations.of(context).text("center_profile"),
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: ArabicFonts.Cairo,
            package: 'google_fonts_arabic',
          ),
        ),
      ),
      body: new CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            floating: false,
            expandedHeight: 256,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  FadeInImage.assetNetwork(
                    fit: BoxFit.cover,
                    placeholder: 'assets/images/avatar.png',
                    image:
                        'https://healthitsecurity.com/images/site/article_headers/_normal/2017-11-08large-data-breach.jpg',
                  ),
                  const DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: <Color>[Colors.black54, Color(0x00000000)],
                          stops: [0.0, 2.0],
                          begin: FractionalOffset.bottomCenter,
                          end: FractionalOffset.topCenter,
                          tileMode: TileMode.mirror),
                    ),
                  ),
                  new Positioned(
                    bottom: 20,
                    left: 0,
                    child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            stops: [0.7, 0.9],
                            colors: [
                              Colors.white10,
                              Colors.white12,
                            ],
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 16),
                        //color: Color.fromRGBO(255, 255, 255, 0.5),
                        child: SmoothStarRating(
                          rating: 3.2,
                          size: 25,
                          color: Colors.yellow,
                          borderColor: Colors.grey,
                          starCount: 5,
                          onRatingChanged: (value) {
                            setState(() {
                              rating = value;
                            });
                          },
                        )),
                  ),
                ],
              ),
            ),
          ),
          new SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: new Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(AppTranslations.of(context).text("center_name"),
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
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: new Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(AppTranslations.of(context).text("country"),
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
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: new Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(AppTranslations.of(context).text("city"),
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
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: new Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(AppTranslations.of(context).text("address"),
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
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: new Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(AppTranslations.of(context).text("website"),
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
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: new Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(AppTranslations.of(context).text("facebook"),
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
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: new Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(AppTranslations.of(context).text("google"),
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
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: new Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(AppTranslations.of(context).text("twitter"),
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
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: new Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(AppTranslations.of(context).text("linkedin"),
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
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: new Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(AppTranslations.of(context).text("description"),
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
              child: new FlatButton(
                onPressed: () => _onEditCenterPressed(context),
                color: Color(0xFFE91E63),
                splashColor: Color(0xFFFF1B5E),
                textColor: Colors.white,
                //elevation: 0.2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new Text(AppTranslations.of(context).text("edit"),
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
                  child: new Text(AppTranslations.of(context).text("add"),
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

  _ShowRattingAlert() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(32.0))),
            contentPadding: EdgeInsets.only(top: 10.0),
            content: Container(
              width: 300.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(AppTranslations.of(context).text("ratting"),
                          style: TextStyle(
                            fontFamily: ArabicFonts.Cairo,
                            package: 'google_fonts_arabic',
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                          )),
                      Row(
                        children: <Widget>[
                          SmoothStarRating(
                            rating: rating,
                            size: 30,
                            color: Colors.yellow,
                            starCount: 5,
                            onRatingChanged: (value) {
                              setState(() {
                                rating = value;
                              });
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Divider(
                    color: Colors.grey,
                    height: 4.0,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 30.0, right: 30.0),
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: AppTranslations.of(context).text("review"),
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                            fontFamily: ArabicFonts.Cairo,
                            package: 'google_fonts_arabic',
                            fontSize: 15.0,
                          )),
                      maxLines: 8,
                    ),
                  ),
                  InkWell(
                    child: Container(
                      padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                      decoration: BoxDecoration(
                        color: Color(0xFFE91E63),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(32.0),
                            bottomRight: Radius.circular(32.0)),
                      ),
                      child: Text(
                        AppTranslations.of(context).text("add_ratting"),
                        style: TextStyle(
                            fontFamily: ArabicFonts.Cairo,
                            package: 'google_fonts_arabic',
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  // To Edit center Information
  _onEditCenterPressed(context) {
    Alert(
        context: context,
        title: "تعديل معلومات المركز",
        content: Form(
          key: _formKey,
          autovalidate: true,
          child: Column(
            children: <Widget>[
              //Center Name
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
              //Website
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
              //Facebook
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
              //Google
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
              //twitter
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
              //Linkedin
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
              //Descriptions
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
