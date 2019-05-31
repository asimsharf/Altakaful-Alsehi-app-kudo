import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:http/http.dart' as http;
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:takaful/language/app_translations.dart';
import 'package:takaful/model/ModelCenters.dart';
import 'package:takaful/screens/About.dart';
import 'package:takaful/screens/CallUs.dart';
import 'package:takaful/screens/FilterSearch.dart';
import 'package:takaful/screens/account_center/CenterDetails.dart';
import 'package:takaful/ui_widgets/TextIcon.dart';

class HomeMainPage extends StatefulWidget {
  final Widget child;
  HomeMainPage({Key key, this.child}) : super(key: key);
  _HomeMainPageState createState() => _HomeMainPageState();
}

class _HomeMainPageState extends State<HomeMainPage> {
  TextEditingController __editingController = TextEditingController();
  final _duplicateItems = List<String>.generate(100, (i) => "إسم المركز $i");
  var _items = List<String>();

  bool _loading = false;

  List<ModelCenters> _modelCenters = <ModelCenters>[];

  Future<List<ModelCenters>> getCenters() async {
    String link = "http://23.111.185.155:4000/takaful/api/center";
    var res = await http
        .get(Uri.encodeFull(link), headers: {"Accept": "application/json"});
    setState(() {
      if (res.statusCode == 200) {
        var data = json.decode(res.body);
        var rest = data['response'] as List;
        _modelCenters = rest
            .map<ModelCenters>((rest) => ModelCenters.fromJson(rest))
            .toList();
        _loading = false;
      }
    });
    return _modelCenters;
  }

  @override
  void initState() {
    super.initState();
    _items.addAll(_duplicateItems);
    this.getCenters();
    setState(() {
      _loading = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldHomeMainPagePageKey =
        new GlobalKey<ScaffoldState>();

    return new Scaffold(
      key: _scaffoldHomeMainPagePageKey,
      appBar: new AppBar(
        title: Text(
          AppTranslations.of(context).text("takaful_alsehi"),
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: ArabicFonts.Cairo,
            package: 'google_fonts_arabic',
          ),
        ),
      ),
      drawer: new Drawer(
          child: new Container(
        alignment: Alignment.topCenter,
        decoration: new BoxDecoration(
          image: new DecorationImage(
            image: new AssetImage("assets/images/drawerbg.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: new ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Padding(
                padding: const EdgeInsets.all(0.0),
                child: Text(
                  AppTranslations.of(context).text("takaful_alsehi"),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: ArabicFonts.Cairo,
                    fontSize: 18.0,
                    package: 'google_fonts_arabic',
                  ),
                ),
              ),
              accountEmail: new Text(
                "wael@altakafulalsehi.com",
                style: TextStyle(
                  fontSize: 14.0,
                  fontFamily: ArabicFonts.Cairo,
                  package: 'google_fonts_arabic',
                ),
              ),
              currentAccountPicture: new CircleAvatar(
                backgroundColor: new Color(0xFFE91E63),
                child: new Container(
                  height: 80.0,
                  width: 80.0,
                  decoration: new BoxDecoration(
                      borderRadius: new BorderRadius.circular(50.0),
                      image: new DecorationImage(
                        image: new AssetImage("assets/images/person.png"),
                        fit: BoxFit.cover,
                      ),
                      color: Color(0xFFFFF6E8)),
                ),
              ),
            ),
            new ListTile(
              leading: CircleAvatar(
                backgroundColor: Color(0xFFE91E63),
                child: Icon(
                  Icons.home,
                  color: Color(0xFFF1F1F1),
                  size: 20.0,
                ),
              ),
              title: Text(AppTranslations.of(context).text("tab_home"),
                  style: TextStyle(
                      color: Color(0xFF37505D),
                      fontFamily: ArabicFonts.Cairo,
                      fontWeight: FontWeight.bold,
                      package: 'google_fonts_arabic',
                      fontSize: 20.0)),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            new ListTile(
              leading: CircleAvatar(
                backgroundColor: Color(0xFFE91E63),
                child: Icon(
                  Icons.person_pin,
                  color: Color(0xFFF1F1F1),
                  size: 20.0,
                ),
              ),
              title: Text(AppTranslations.of(context).text("tab_profile"),
                  style: TextStyle(
                      color: Color(0xFF37505D),
                      fontFamily: ArabicFonts.Cairo,
                      package: 'google_fonts_arabic',
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0)),
              onTap: () {
                Navigator.popAndPushNamed(context, '/ProfilePage');
              },
            ),
            new ListTile(
              leading: CircleAvatar(
                backgroundColor: Color(0xFFE91E63),
                child: Icon(
                  Icons.person_add,
                  color: Color(0xFFF1F1F1),
                  size: 20.0,
                ),
              ),
              title: Text(AppTranslations.of(context).text("tab_subscription"),
                  style: TextStyle(
                      color: Color(0xFF37505D),
                      fontFamily: ArabicFonts.Cairo,
                      fontWeight: FontWeight.bold,
                      package: 'google_fonts_arabic',
                      fontSize: 20.0)),
              onTap: () {
                Navigator.popAndPushNamed(context, '/Subscription');
              },
            ),
            new ListTile(
              leading: CircleAvatar(
                backgroundColor: Color(0xFFE91E63),
                child: Icon(
                  Icons.credit_card,
                  color: Color(0xFFF1F1F1),
                  size: 20.0,
                ),
              ),
              title: Text(AppTranslations.of(context).text("tab_req_card"),
                  style: TextStyle(
                      color: Color(0xFF37505D),
                      fontFamily: ArabicFonts.Cairo,
                      package: 'google_fonts_arabic',
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0)),
              onTap: () {
                Navigator.popAndPushNamed(context, '/RequestCard');
              },
            ),
            new ListTile(
              leading: CircleAvatar(
                backgroundColor: Color(0xFFE91E63),
                child: Icon(
                  Icons.local_offer,
                  color: Color(0xFFF1F1F1),
                  size: 20.0,
                ),
              ),
              title: Text(AppTranslations.of(context).text("tab_offers"),
                  style: TextStyle(
                      color: Color(0xFF37505D),
                      fontFamily: ArabicFonts.Cairo,
                      package: 'google_fonts_arabic',
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0)),
              onTap: () {
                Navigator.popAndPushNamed(context, '/CenterOffers');
              },
            ),
            new ListTile(
              leading: CircleAvatar(
                backgroundColor: Color(0xFFE91E63),
                child: Icon(
                  Icons.chat,
                  color: Color(0xFFF1F1F1),
                  size: 20.0,
                ),
              ),
              title: Text(AppTranslations.of(context).text("tab_Chat"),
                  style: TextStyle(
                      color: Color(0xFF37505D),
                      fontFamily: ArabicFonts.Cairo,
                      fontWeight: FontWeight.bold,
                      package: 'google_fonts_arabic',
                      fontSize: 20.0)),
              onTap: () {
                //Navigator.popAndPushNamed(context, '/Chat');
              },
            ),
            new ListTile(
              leading: CircleAvatar(
                backgroundColor: Color(0xFFE91E63),
                child: Icon(
                  Icons.format_align_center,
                  color: Color(0xFFF1F1F1),
                  size: 20.0,
                ),
              ),
              title: Text(
                  AppTranslations.of(context).text("tab_manage_centers"),
                  style: TextStyle(
                      color: Color(0xFF37505D),
                      fontFamily: ArabicFonts.Cairo,
                      fontWeight: FontWeight.bold,
                      package: 'google_fonts_arabic',
                      fontSize: 20.0)),
              onTap: () {
                Navigator.popAndPushNamed(context, '/CenterLogin');
              },
            ),
            new ListTile(
              leading: CircleAvatar(
                backgroundColor: Color(0xFFE91E63),
                child: Icon(
                  Icons.language,
                  color: Color(0xFFF1F1F1),
                  size: 20.0,
                ),
              ),
              title: Text(AppTranslations.of(context).text("tab_language"),
                  style: TextStyle(
                      color: Color(0xFF37505D),
                      fontFamily: ArabicFonts.Cairo,
                      package: 'google_fonts_arabic',
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0)),
              onTap: () {
                Navigator.popAndPushNamed(context, '/LanguageSelectorPage');
              },
            ),
            new Divider(
              color: Color(0xFFE91E63),
            ),
            new ListTile(
                trailing: CircleAvatar(
                  backgroundColor: Color(0xFFE91E63),
                  child: Icon(
                    Icons.exit_to_app,
                    color: Color(0xFFF1F1F1),
                    size: 20.0,
                  ),
                ),
                title: Text(AppTranslations.of(context).text("tab_login"),
                    style: TextStyle(
                        color: Color(0xFF37505D),
                        fontFamily: ArabicFonts.Cairo,
                        fontWeight: FontWeight.bold,
                        package: 'google_fonts_arabic',
                        fontSize: 20.0)),
                onTap: () {
                  Navigator.popAndPushNamed(context, '/UserLogin');
                }),
            new ListTile(
                trailing: CircleAvatar(
                  backgroundColor: Color(0xFFE91E63),
                  child: Icon(
                    Icons.call,
                    color: Color(0xFFF1F1F1),
                    size: 20.0,
                  ),
                ),
                title: Text(
                    AppTranslations.of(context).text("tab_tech_support"),
                    style: TextStyle(
                        color: Color(0xFF37505D),
                        fontFamily: ArabicFonts.Cairo,
                        fontWeight: FontWeight.bold,
                        package: 'google_fonts_arabic',
                        fontSize: 20.0)),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CallUs(),
                    ),
                  );
                }),
            new ListTile(
                trailing: CircleAvatar(
                  backgroundColor: Color(0xFFE91E63),
                  child: Icon(
                    Icons.call,
                    color: Color(0xFFF1F1F1),
                    size: 20.0,
                  ),
                ),
                title: Text('Login Screen',
                    style: TextStyle(
                        color: Color(0xFF37505D),
                        fontFamily: ArabicFonts.Cairo,
                        fontWeight: FontWeight.bold,
                        package: 'google_fonts_arabic',
                        fontSize: 20.0)),
                onTap: () {
                  Navigator.popAndPushNamed(context, '/LoginScreen');
                }),
            new ListTile(
                trailing: CircleAvatar(
                  backgroundColor: Color(0xFFE91E63),
                  child: Icon(
                    Icons.info,
                    color: Color(0xFFF1F1F1),
                    size: 20.0,
                  ),
                ),
                title: Text(AppTranslations.of(context).text("tab_about"),
                    style: TextStyle(
                        color: Color(0xFF37505D),
                        fontFamily: ArabicFonts.Cairo,
                        fontWeight: FontWeight.bold,
                        package: 'google_fonts_arabic',
                        fontSize: 20.0)),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => About(),
                    ),
                  );
                }),
          ],
        ),
      )),
      body: new Container(
        child: new Column(
          children: <Widget>[
            new Padding(
              padding: const EdgeInsets.only(
                  top: 0.0, right: 0.0, left: 0.0, bottom: 5.0),
              child: new TextField(
                onChanged: (value) {
                  filterSearchResults(value);
                },
                controller: __editingController,
                decoration: new InputDecoration(
                    hintText: AppTranslations.of(context)
                        .text("search_by_center_name"),
                    hintStyle: TextStyle(
                      fontFamily: ArabicFonts.Cairo,
                      package: 'google_fonts_arabic',
                    ),
                    suffixIcon: InkWell(
                      splashColor: Color(0xFFD04668),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FilterSearch(),
                          ),
                        );
                      },
                      child: Icon(
                        FontAwesomeIcons.slidersH,
                        color: Color(0xFFE91E63),
                      ),
                    ),
                    prefixIcon: GestureDetector(
                      child: Icon(
                        Icons.search,
                        color: Color(0xFFE91E63),
                      ),
                      onTap: () {},
                    ),
                    border: UnderlineInputBorder()),
              ),
            ),
            new Expanded(
                child: _loading
                    ? new Center(child: new CircularProgressIndicator())
                    : _buildProductList()),
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: () {
          Navigator.popAndPushNamed(context, '/GoogleMaps');
        },
        child: Icon(
          Icons.location_on,
        ),
        backgroundColor: Color(0xFFE91E63),
      ),
    );
  }

  Widget _buildProductList() {
    Widget CentersList;
    if (_modelCenters.length > 0) {
      CentersList = new ListView.builder(
        padding: EdgeInsets.all(1.0),
        itemExtent: 114.0,
        shrinkWrap: true,
        itemCount: _modelCenters.length,
        itemBuilder: (BuildContext context, index) {
          final CentersObj = _modelCenters[index];
          return new GestureDetector(
            child: Card(
              elevation: 0.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(7.0)),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0.0),
                //This is the list view search result
                child: Container(
                  height: 140.0,
                  child: Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: Row(
                      children: <Widget>[
                        Container(
                          height: 100.0,
                          width: 90.0,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: FadeInImage.assetNetwork(
                              fit: BoxFit.fill,
                              placeholder: 'assets/images/logo.png',
                              image: '${CentersObj.logo}',
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding:
                                const EdgeInsets.only(left: 5.0, right: 5.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Text(
                                        '${CentersObj.center}',
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: ArabicFonts.Cairo,
                                          package: 'google_fonts_arabic',
                                        ),
                                      ),
                                    ),
                                    SmoothStarRating(
                                      rating: 3.2,
                                      size: 15,
                                      color: Colors.yellow,
                                      borderColor: Colors.grey,
                                      starCount: 5,
                                    )
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Text(
                                        "${CentersObj.description}",
                                        style: TextStyle(
                                          fontSize: 8.0,
                                          fontFamily: ArabicFonts.Cairo,
                                          package: 'google_fonts_arabic',
                                        ),
                                      ),
                                    ),
                                    TextIcon(
                                      size: 10.0,
                                      text: "من ${CentersObj.open_at}",
                                      icon: Icons.access_time,
                                      isColumn: false,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Text(
                                        '${CentersObj.type_ar}',
                                        style: TextStyle(
                                          fontSize: 8.0,
                                          color: Colors.pinkAccent,
                                          fontFamily: ArabicFonts.Cairo,
                                          package: 'google_fonts_arabic',
                                        ),
                                      ),
                                    ),
                                    TextIcon(
                                      size: 10.0,
                                      text: "الى ${CentersObj.close_at}",
                                      icon: Icons.timer_off,
                                      isColumn: false,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CenterDetails(
                        center_id: CentersObj.center_id,
                        address: CentersObj.address,
                        longitude: CentersObj.longitude,
                        latitude: CentersObj.latitude,
                        center: CentersObj.center,
                        description: CentersObj.description,
                        logo: CentersObj.logo,
                        profile: CentersObj.profile,
                        open_at: CentersObj.open_at,
                        close_at: CentersObj.close_at,
                        website: CentersObj.website,
                        facebook: CentersObj.facebook,
                        google: CentersObj.google,
                        twitter: CentersObj.twitter,
                        linkedin: CentersObj.linkedin,
                        administrator: CentersObj.administrator,
                        identity_number: CentersObj.identity_number,
                        email: CentersObj.email,
                        phone: CentersObj.phone,
                        join_date: CentersObj.join_date,
                        Expire_from: CentersObj.Expire_from,
                        Expire_to: CentersObj.Expire_to,
                        license: CentersObj.license,
                        country_ar: CentersObj.country_ar,
                        country_en: CentersObj.country_en,
                        country_code: CentersObj.country_code,
                        city_ar: CentersObj.city_ar,
                        city_en: CentersObj.city_en,
                        type_ar: CentersObj.type_ar,
                        type_en: CentersObj.type_en,
                      ),
                ),
              );
            },
          );
        },
      );
    } else {
      CentersList = Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Icon(Icons.hourglass_empty),
            ),
            Text(
              'عفواً لا توجد خدمات !',
              style: TextStyle(
                  fontFamily: ArabicFonts.Cairo,
                  package: 'google_fonts_arabic',
                  fontSize: 20.0,
                  color: Colors.red,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      );
    }
    return CentersList;
  }

  void filterSearchResults(String query) {
    List<String> dummySearchList = List<String>();
    dummySearchList.addAll(_duplicateItems);
    if (query.isNotEmpty) {
      List<String> dummyListData = List<String>();
      dummySearchList.forEach((item) {
        if (item.contains(query)) {
          dummyListData.add(item);
        }
      });
      setState(() {
        _items.clear();
        _items.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        _items.clear();
        _items.addAll(_duplicateItems);
      });
    }
  }
}
