import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:http/http.dart' as http;
import 'package:takaful/model/ModelDoctors.dart';
import 'package:takaful/screens/FilterSearch.dart';
import 'package:takaful/screens/dashboard/DoctorsDetails.dart';

class Doctors extends StatefulWidget {
  int center_id;
  Doctors({this.center_id});
  @override
  _DoctorsState createState() => _DoctorsState();
}

class _DoctorsState extends State<Doctors> {
  TextEditingController editingController = TextEditingController();
  final duplicateItems =
      List<String>.generate(100, (i) => " الدكتور علي بن حجاج$i");
  var items = List<String>();

  bool loading = false;
  List<ModelDoctors> _Model_Doctors = <ModelDoctors>[];
  Future<List<ModelDoctors>> getCenters() async {
    String link = "http://23.111.185.155:4000/takaful/api/center/5/doctor";
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
          'إدارة الأطباء',
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
                                  padding: const EdgeInsets.all(1.0),
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
                                        width: 5.0,
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
                                                ],
                                              ),
                                              Row(
                                                children: <Widget>[
                                                  Expanded(
                                                    child: Text(
                                                      "${DoctorsObj.ar_degree}",
                                                      style: TextStyle(
                                                        fontSize: 8.0,
                                                        fontFamily:
                                                            ArabicFonts.Cairo,
                                                        package:
                                                            'google_fonts_arabic',
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Text(
                                                      "${DoctorsObj.ar_department}",
                                                      style: TextStyle(
                                                        fontSize: 8.0,
                                                        fontFamily:
                                                            ArabicFonts.Cairo,
                                                        package:
                                                            'google_fonts_arabic',
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              new Row(
                                                children: <Widget>[
                                                  Expanded(
                                                    child: Text(
                                                      "${DoctorsObj.phone}",
                                                      style: TextStyle(
                                                        fontSize: 8.0,
                                                        fontFamily:
                                                            ArabicFonts.Cairo,
                                                        package:
                                                            'google_fonts_arabic',
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 2.0,
                                                  ),
                                                  Expanded(
                                                    child: Text(
                                                      "${DoctorsObj.doc_email}",
                                                      style: TextStyle(
                                                        fontSize: 8.0,
                                                        fontFamily:
                                                            ArabicFonts.Cairo,
                                                        package:
                                                            'google_fonts_arabic',
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
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
                                builder: (context) => DoctorsDetails(
                                      center_id: DoctorsObj.center_id,
                                      department_id: DoctorsObj.department_id,
                                      doc_id: DoctorsObj.doc_id,
                                      center: DoctorsObj.center,
                                      center_address: DoctorsObj.center_address,
                                      center_website: DoctorsObj.center_website,
                                      ar_department: DoctorsObj.ar_department,
                                      en_department: DoctorsObj.en_department,
                                      ar_degree: DoctorsObj.ar_degree,
                                      en_degree: DoctorsObj.en_degree,
                                      name: DoctorsObj.name,
                                      phone: DoctorsObj.phone,
                                      doc_email: DoctorsObj.doc_email,
                                      hire_date: DoctorsObj.hire_date,
                                      visits_per_day: DoctorsObj.visits_per_day,
                                      consult_price: DoctorsObj.consult_price,
                                      gender: DoctorsObj.gender,
                                    ),
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
