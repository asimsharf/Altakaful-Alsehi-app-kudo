import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:http/http.dart' as http;
import 'package:takaful/model/ModelDoctors.dart';
import 'package:takaful/screens/FilterSearch.dart';
import 'package:takaful/screens/dashboard/DoctorsDetails.dart';
import 'package:takaful/ui_widgets/TextIcon.dart';

class DoctorsPages extends StatefulWidget {
  int hos_id;
  String hospital;
  DoctorsPages({this.hos_id, this.hospital});
  @override
  _DoctorsState createState() => _DoctorsState();
}

class _DoctorsState extends State<DoctorsPages> {
  TextEditingController editingController = TextEditingController();
  final duplicateItems =
      List<String>.generate(100, (i) => " الدكتور علي بن حجاج$i");
  var items = List<String>();

  bool loading = false;
  List<ModelDoctors> _Model_Doctors = <ModelDoctors>[];
  Future<List<ModelDoctors>> getCenters() async {
    String link =
        "http://23.111.185.155:4000/takaful/api/center/${widget.hos_id}/doctor";
    var res = await http
        .get(Uri.encodeFull(link), headers: {"Accept": "application/json"});
    setState(() {
      if (res.statusCode == 200) {
        var data = json.decode(res.body);
        var rest = data['response'] as List;
        _Model_Doctors = rest
            .map<ModelDoctors>((rest) => ModelDoctors.fromJson(rest))
            .toList();
        loading = false;
      }
    });
    return _Model_Doctors;
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
          'قائمة الأطباء',
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
                  top: 0.0, right: 0.0, left: 0.0, bottom: 2.0),
              child: TextField(
                onChanged: (value) {
                  filterSearchResults(value);
                },
                controller: editingController,
                decoration: InputDecoration(
                    hintText: "بحث بإسم الطبيب...",
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
                  : ListView.builder(
                      padding: EdgeInsets.all(1.0),
                      itemExtent: 114.0,
                      shrinkWrap: true,
                      itemCount: _Model_Doctors.length,
                      itemBuilder: (BuildContext context, index) {
                        final DoctorsObj = _Model_Doctors[index];
                        return new GestureDetector(
                          child: Card(
                            elevation: 0.0,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(7.0)),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 0.0),
                              //This is the list view search result
                              child: Container(
                                height: 140.0,
                                child: Padding(
                                  padding: const EdgeInsets.all(0.0),
                                  child: Row(
                                    children: <Widget>[
                                      Container(
                                        height: 100.0,
                                        width: 90.0,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          child: FadeInImage.assetNetwork(
                                            fit: BoxFit.fill,
                                            placeholder:
                                                'assets/images/logo.png',
                                            image:
                                                'https://cdn1.iconfinder.com/data/icons/user-pictures/101/malecostume-512.png',
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10.0,
                                      ),
                                      Expanded(
                                        child: Container(
                                          padding: const EdgeInsets.all(0.0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Row(
                                                children: <Widget>[
                                                  Expanded(
                                                    child: Text(
                                                      '${DoctorsObj.name}',
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                        fontSize: 15.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontFamily:
                                                            ArabicFonts.Cairo,
                                                        package:
                                                            'google_fonts_arabic',
                                                      ),
                                                    ),
                                                  ),
                                                  TextIcon(
                                                    text: "5.1",
                                                    icon: Icons.star,
                                                    isColumn: false,
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: <Widget>[
                                                  Expanded(
                                                    child: Text(
                                                      "أخصائي جراحة قلب",
                                                      style: TextStyle(
                                                        fontSize: 8.0,
                                                        fontFamily:
                                                            ArabicFonts.Cairo,
                                                        package:
                                                            'google_fonts_arabic',
                                                      ),
                                                    ),
                                                  ),
                                                  TextIcon(
                                                    text: "متصل الان",
                                                    icon: FontAwesomeIcons
                                                        .snowman,
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
                                                      'مشفى الزهراء التخصصي',
                                                      style: TextStyle(
                                                        fontSize: 8.0,
                                                        color:
                                                            Colors.pinkAccent,
                                                        fontFamily:
                                                            ArabicFonts.Cairo,
                                                        package:
                                                            'google_fonts_arabic',
                                                      ),
                                                    ),
                                                  ),
                                                  TextIcon(
                                                    text: "العنوان",
                                                    icon: Icons.my_location,
                                                    isColumn: false,
                                                  ),
                                                  TextIcon(
                                                    text:
                                                        "${9.30}م الى ${2.30}ص",
                                                    icon: Icons.timer,
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
                                builder: (context) => DoctorsDetails(),
                              ),
                            );
                          },
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
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
