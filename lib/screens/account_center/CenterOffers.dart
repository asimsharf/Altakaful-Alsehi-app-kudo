import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:http/http.dart' as http;
import 'package:takaful/language/app_translations.dart';
import 'package:takaful/model/ModelServices.dart';
import 'package:takaful/screens/FilterSearch.dart';

class CenterOffers extends StatefulWidget {
  int hos_id;
  String specialist_ar_name;
  CenterOffers({this.hos_id, this.specialist_ar_name});
  @override
  _CenterOffersState createState() => _CenterOffersState();
}

class _CenterOffersState extends State<CenterOffers> {
  TextEditingController editingController = TextEditingController();
  final duplicateItems =
      List<String>.generate(100, (i) => " الدكتور علي بن حجاج$i");
  var items = List<String>();

  bool loading = false;
  List<ModelServices> _Model_Services = <ModelServices>[];
  Future<List<ModelServices>> getCenters() async {
    String link = "http://23.111.185.155:4000/takaful/api/center/5/service";
    var res = await http
        .get(Uri.encodeFull(link), headers: {"Accept": "application/json"});
    setState(() {
      if (res.statusCode == 200) {
        var data = json.decode(res.body);
        var rest = data['response'] as List;
        _Model_Services = rest
            .map<ModelServices>((rest) => ModelServices.fromJson(rest))
            .toList();
        loading = false;
      }
    });
    return _Model_Services;
  }

  @override
  void initState() {
    items.addAll(duplicateItems);
    super.initState();
    this.getCenters();
    setState(() {
      loading = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text(
          AppTranslations.of(context).text("tab_offers"),
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: ArabicFonts.Cairo,
            package: 'google_fonts_arabic',
          ),
        ),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                  top: 0.0, right: 0.0, left: 0.0, bottom: 5.0),
              child: TextField(
                onChanged: (value) {
                  filterSearchResults(value);
                },
                controller: editingController,
                decoration: InputDecoration(
                    hintText: "بحث بإسم التخصص...",
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
            Expanded(
                child: loading
                    ? Center(child: CircularProgressIndicator())
                    : _buildProductList()),
          ],
        ),
      ),
    );
  }

  Widget _buildProductList() {
    Widget OffersList;
    if (_Model_Services.length > 0) {
      OffersList = new ListView.builder(
        padding: EdgeInsets.all(1.0),
        itemExtent: 114.0,
        shrinkWrap: true,
        itemCount: _Model_Services.length,
        itemBuilder: (BuildContext context, index) {
          final ServicesObj = _Model_Services[index];
          return new GestureDetector(
            child: Card(
              elevation: 0.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0.0),
                //This is the list view search result
                child: Container(
                  height: 150.0,
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
                              placeholder: 'assets/images/avatar.png',
                              image:
                                  'https://www.rjeem.com/wp-content/uploads/2018/09/%D8%B9%D8%B1%D9%88%D8%B6-%D8%A7%D9%84%D9%8A%D9%88%D9%85-%D8%A7%D9%84%D9%88%D8%B7%D9%86%D9%8A-%D8%A7%D9%84%D8%B3%D8%B9%D9%88%D8%AF%D9%89-%D9%85%D9%86-%D8%A8%D8%B3%D8%AA%D8%A7%D9%86%D9%8A-%D8%B4%D9%88%D9%83%D9%88%D9%84%D8%A7%D8%AA%D9%87-.jpg',
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        new Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(0.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Text(
                                        '${ServicesObj.ar_service}',
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: ArabicFonts.Cairo,
                                          package: 'google_fonts_arabic',
                                        ),
                                      ),
                                    ),
                                    Text(
                                      '${ServicesObj.price}%  الخصم',
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        color: Colors.grey,
                                        fontFamily: ArabicFonts.Cairo,
                                        package: 'google_fonts_arabic',
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    Text(
                                      '${ServicesObj.discount}%  الخصم',
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        color: Colors.pinkAccent,
                                        fontFamily: ArabicFonts.Cairo,
                                        package: 'google_fonts_arabic',
                                      ),
                                    ),
                                  ],
                                ),
                                new Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Text(
                                        'السعر  ${ServicesObj.price}ريال ',
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          color: Colors.grey,
                                          fontFamily: ArabicFonts.Cairo,
                                          package: 'google_fonts_arabic',
                                        ),
                                      ),
                                    ),
                                    new MaterialButton(
                                      onPressed: () {},
                                      color: Color(0xFFE91E63),
                                      splashColor: Color(0xFFFF1B5E),
                                      textColor: Colors.white,
                                      elevation: 0.2,
                                      child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: new Text("أحجز الأن",
                                            style: TextStyle(
                                                fontFamily: ArabicFonts.Cairo,
                                                package: 'google_fonts_arabic',
                                                fontSize: 12.0,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white)),
                                      ),
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
                  builder: (context) => CenterOffers(),
                ),
              );
            },
          );
        },
      );
    } else {
      OffersList = Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Icon(Icons.hourglass_empty),
            ),
            Text(
              'عفواً لا توجد عروض !',
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
    return OffersList;
  }

  void filterSearchResults(String query) {
    List<String> dummySearchList = List<String>();
    dummySearchList.addAll(duplicateItems);
    if (query.isNotEmpty) {
      List<String> dummyListData = List<String>();
      dummySearchList.forEach((item) {
        if (item.contains(query)) {
          dummyListData.add(item);
        }
      });
      setState(() {
        items.clear();
        items.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        items.clear();
        items.addAll(duplicateItems);
      });
    }
  }
}
