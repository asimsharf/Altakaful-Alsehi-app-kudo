import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:http/http.dart' as http;
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:takaful/model/ModelDepartment.dart';
import 'package:takaful/screens/FilterSearch.dart';
import 'package:takaful/screens/account_client/ProfilePage.dart';

class Department extends StatefulWidget {
  int center_id;
  String center;
  int consult_price;
  int visits_per_day;
  int department_id;

  Department({
    this.center_id,
    this.center,
    this.consult_price,
    this.visits_per_day,
    this.department_id,
  });

  @override
  _DepartmentState createState() => _DepartmentState();
}

class _DepartmentState extends State<Department> {
  TextEditingController editingController = TextEditingController();

  TextEditingController department_ar_name = TextEditingController();
  TextEditingController consult_price = TextEditingController();
  TextEditingController visits_per_day = TextEditingController();

  final duplicateItems = List<String>.generate(100, (i) => "$i");

  var items = List<String>();

  bool loading = false;
  List<ModelDepartment> _Model_Department = <ModelDepartment>[];
  Future<List<ModelDepartment>> getCenters() async {
    String link = "http://23.111.185.155:4000/takaful/api/center/5/department";
    var res = await http
        .get(Uri.encodeFull(link), headers: {"Accept": "application/json"});
    setState(() {
      if (res.statusCode == 200) {
        var data = json.decode(res.body);
        var rest = data['response'] as List;
        _Model_Department = rest
            .map<ModelDepartment>((rest) => ModelDepartment.fromJson(rest))
            .toList();
        loading = false;
      }
    });
    return _Model_Department;
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
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: IconButton(
                icon: Icon(Icons.add_circle_outline),
                onPressed: () => _onAddServicesPressed(context),
                tooltip: 'إضافة قسم جديد'),
          ),
        ],
        //بيانات الخدمة
        title: const Text('إدارة الأقسام',
            style: TextStyle(
                fontFamily: ArabicFonts.Cairo,
                package: 'google_fonts_arabic',
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
                color: Colors.white)),
      ),
      body: new Container(
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
                    hintText: "بحث بإسم ...",
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
    Widget DepartmentList;
    if (_Model_Department.length > 0) {
      DepartmentList = new ListView.builder(
        padding: EdgeInsets.all(1.0),
        itemExtent: 114.0,
        shrinkWrap: true,
        itemCount: _Model_Department.length,
        itemBuilder: (BuildContext context, index) {
          final ServicesObj = _Model_Department[index];
          return new Card(
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
                                'http://www.parthadental.com/assets/products/offers1.jpg',
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
                              new Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Text(
                                      '${ServicesObj.ar_name}',
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: ArabicFonts.Cairo,
                                        package: 'google_fonts_arabic',
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Text(
                                    ' سعر الإستشارة${ServicesObj.consult_price} ريال',
                                    style: TextStyle(
                                      fontSize: 15.0,
                                      color: Colors.green,
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
                                      '${widget.center} widget center name',
                                      overflow: TextOverflow.visible,
                                      style: TextStyle(
                                        fontSize: 10.0,
                                        color: Colors.grey,
                                        fontFamily: ArabicFonts.Cairo,
                                        package: 'google_fonts_arabic',
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'عدد الزوار اليومي  ${ServicesObj.visits_per_day}زائر ',
                                    style: TextStyle(
                                      fontSize: 10.0,
                                      color: Colors.red,
                                      fontFamily: ArabicFonts.Cairo,
                                      package: 'google_fonts_arabic',
                                    ),
                                  ),
                                ],
                              ),
                              new Row(
                                children: <Widget>[
                                  Expanded(
                                    child: new MaterialButton(
                                      onPressed: () {},
                                      color: Color(0xFFE91E63),
                                      splashColor: Color(0xFFFF1B5E),
                                      textColor: Colors.white,
                                      elevation: 0.2,
                                      child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: new Text("حذف",
                                            style: TextStyle(
                                                fontFamily: ArabicFonts.Cairo,
                                                package: 'google_fonts_arabic',
                                                fontSize: 12.0,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white)),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 2.0,
                                  ),
                                  Expanded(
                                    child: new MaterialButton(
                                      onPressed: () =>
                                          _onEditServicesPressed(context),
                                      color: Color(0xFFE91E63),
                                      splashColor: Color(0xFFFF1B5E),
                                      textColor: Colors.white,
                                      elevation: 0.2,
                                      child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: new Text("تعديل",
                                            style: TextStyle(
                                                fontFamily: ArabicFonts.Cairo,
                                                package: 'google_fonts_arabic',
                                                fontSize: 12.0,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white)),
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
          );
        },
      );
    } else {
      DepartmentList = Center(
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
    return DepartmentList;
  }

  // التعديل على بيانات الخدمة
  _onEditServicesPressed(context) {
    Alert(
        context: context,
        title: "تعديل القسم",
        content: Column(
          children: <Widget>[
            //نوع الخدمة
            new TextFormField(
              decoration: new InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
                  counterStyle: TextStyle(color: Color(0xFF37505D)),
                  prefixIcon: Icon(FontAwesomeIcons.typo3),
                  labelText: "إسم القسم *",
                  labelStyle: TextStyle(
                      fontFamily: ArabicFonts.Cairo,
                      package: 'google_fonts_arabic',
                      fontSize: 10.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF37505D))),
              keyboardType: TextInputType.text,
              inputFormatters: [new LengthLimitingTextInputFormatter(30)],
              validator: (val) => val.isEmpty ? 'يرجى إدخال إسم القسم' : null,
            ),
            // سعر الإستشارة
            new TextFormField(
              decoration: new InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
                  counterStyle: TextStyle(color: Color(0xFF37505D)),
                  labelText: "سعر الإستشارة *",
                  fillColor: Color(0xFF37505D),
                  prefixIcon: Icon(FontAwesomeIcons.cashRegister),
                  labelStyle: TextStyle(
                      fontFamily: ArabicFonts.Cairo,
                      package: 'google_fonts_arabic',
                      fontSize: 10.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF37505D))),
              keyboardType: TextInputType.phone,
            ),
            // عدد زوار اليوم
            new TextFormField(
              decoration: new InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
                  counterStyle: TextStyle(color: Color(0xFF37505D)),
                  labelText: "عدد زوار اليوم *",
                  fillColor: Color(0xFF37505D),
                  prefixIcon: Icon(FontAwesomeIcons.cashRegister),
                  labelStyle: TextStyle(
                      fontFamily: ArabicFonts.Cairo,
                      package: 'google_fonts_arabic',
                      fontSize: 10.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF37505D))),
              keyboardType: TextInputType.phone,
            ),
          ],
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

//إضافة خدمة جديدة
  _onAddServicesPressed(context) {
    Alert(
        context: context,
        title: "إضافة قسم جديدة",
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            //نوع الخدمة
            new TextFormField(
              controller: department_ar_name,
              decoration: new InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
                  counterStyle: TextStyle(color: Color(0xFF37505D)),
                  prefixIcon: Icon(FontAwesomeIcons.typo3),
                  labelText: "نوع الخدمة *",
                  labelStyle: TextStyle(
                      fontFamily: ArabicFonts.Cairo,
                      package: 'google_fonts_arabic',
                      fontSize: 10.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF37505D))),
              keyboardType: TextInputType.text,
              inputFormatters: [new LengthLimitingTextInputFormatter(30)],
              validator: (val) => val.isEmpty ? 'يرجى إدخال نوع الخدمة' : null,
            ),
            // سعر الإستشارة
            new TextFormField(
              controller: consult_price,
              decoration: new InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
                  counterStyle: TextStyle(color: Color(0xFF37505D)),
                  labelText: "سعر الإستشارة *",
                  fillColor: Color(0xFF37505D),
                  prefixIcon: Icon(FontAwesomeIcons.cashRegister),
                  labelStyle: TextStyle(
                      fontFamily: ArabicFonts.Cairo,
                      package: 'google_fonts_arabic',
                      fontWeight: FontWeight.bold,
                      fontSize: 10.0,
                      color: Color(0xFF37505D))),
              keyboardType: TextInputType.phone,
            ),
            // عدد زوار اليوم
            new TextFormField(
              controller: visits_per_day,
              decoration: new InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
                  counterStyle: TextStyle(color: Color(0xFF37505D)),
                  labelText: "عدد زوار اليوم *",
                  fillColor: Color(0xFF37505D),
                  prefixIcon: Icon(FontAwesomeIcons.cashRegister),
                  labelStyle: TextStyle(
                      fontFamily: ArabicFonts.Cairo,
                      package: 'google_fonts_arabic',
                      fontSize: 10.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF37505D))),
              keyboardType: TextInputType.phone,
            ),
          ],
        ),
        buttons: [
          DialogButton(
            onPressed: () => _onBasicAlertPressedOkay(context),
            color: Color(0xFFE91E63),
            child: Text(
              "إضافة",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          )
        ]).show();
  }

//تمت عملة التحقق بنجاح
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

//التحقق من ان رقم البطاقة صحيح
  bool isValidIdNumber(String input) {
    final RegExp regex = new RegExp(r'^\d\d\d\d\d\d\d\d\d\d\d\d\d\d$');
    return regex.hasMatch(input);
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
