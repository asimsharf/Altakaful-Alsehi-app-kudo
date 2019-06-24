import 'package:flutter/material.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:takaful/language/app_translations.dart';
import 'package:takaful/screens/dashboard/Edit/EditCenter.dart';

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
  @override
  void initState() {
    super.initState();
  }

  var rating = 1.2;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text(
              AppTranslations.of(context).text("center_profile"),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: ArabicFonts.Cairo,
                package: 'google_fonts_arabic',
              ),
            ),
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
                onPressed: () => EditCreate(),
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
                onPressed: () => EditCreate(),
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
}
