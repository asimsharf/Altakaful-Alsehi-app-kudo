import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:http/http.dart' as http;
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:takaful/model/ModelServices.dart';
import 'package:takaful/screens/FilterSearch.dart';
import 'package:takaful/screens/account_client/ProfilePage.dart';

class Serivces extends StatefulWidget {
  @override
  _SerivcesState createState() => _SerivcesState();
}

class _SerivcesState extends State<Serivces> {
  TextEditingController editingController = TextEditingController();
  final duplicateItems = List<String>.generate(100, (i) => " $i");
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
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: IconButton(
                icon: Icon(Icons.add_circle_outline),
                onPressed: () => _onAddServicesPressed(context),
                tooltip: 'إضافة مركز جديد'),
          ),
        ],
        //بيانات الخدمة
        title: const Text('إدارة الخدمات',
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
                    hintText: "بحث بإسم الخدمة...",
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
                  : _buildProductList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductList() {
    Widget ServicesList;
    if (_Model_Services.length > 0) {
      ServicesList = new ListView.builder(
        padding: EdgeInsets.all(1.0),
        itemExtent: 114.0,
        shrinkWrap: true,
        itemCount: _Model_Services.length,
        itemBuilder: (BuildContext context, index) {
          final ServicesObj = _Model_Services[index];
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
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Text(
                                    ' نسبة الخصم %${ServicesObj.discount}',
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
                                      'السعر قبل الخصم  ${ServicesObj.price}ريال ',
                                      style: TextStyle(
                                        fontSize: 10.0,
                                        color: Colors.grey,
                                        fontFamily: ArabicFonts.Cairo,
                                        package: 'google_fonts_arabic',
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'السعر بعد الخصم  ${ServicesObj.price}ريال ',
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
      ServicesList = Center(
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
    return ServicesList;
  }

  // التعديل على بيانات الخدمة
  _onEditServicesPressed(context) {
    Alert(
        context: context,
        title: "تعديل الخدمة",
        content: Column(
          children: <Widget>[
            //نوع الخدمة
            new TextFormField(
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
            // السعر قبل الخصم
            new TextFormField(
              decoration: new InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
                  counterStyle: TextStyle(color: Color(0xFF37505D)),
                  labelText: "السعر قبل الخصم *",
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
            // السعر بعد الخصم
            new TextFormField(
              decoration: new InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
                  counterStyle: TextStyle(color: Color(0xFF37505D)),
                  labelText: "السعر بعد الخصم *",
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
            // نسبة الخصم
            new TextFormField(
              decoration: new InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
                  counterStyle: TextStyle(color: Color(0xFF37505D)),
                  labelText: "نسبة الخصم *",
                  fillColor: Color(0xFF37505D),
                  prefixIcon: Icon(FontAwesomeIcons.percent),
                  labelStyle: TextStyle(
                      fontFamily: ArabicFonts.Cairo,
                      fontSize: 10.0,
                      package: 'google_fonts_arabic',
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF37505D))),
              keyboardType: TextInputType.number,
              inputFormatters: [new LengthLimitingTextInputFormatter(30)],
              validator: (val) => val.isEmpty ? 'يرجى إدخال الخصم' : null,
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
        title: "إضافة خدمة جديدة",
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            //نوع الخدمة
            new TextFormField(
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
            // السعر قبل الخصم
            new TextFormField(
              decoration: new InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
                  counterStyle: TextStyle(color: Color(0xFF37505D)),
                  labelText: "السعر قبل الخصم *",
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
            // السعر بعد الخصم
            new TextFormField(
              decoration: new InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
                  counterStyle: TextStyle(color: Color(0xFF37505D)),
                  labelText: "السعر بعد الخصم *",
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
            // نسبة الخصم
            new TextFormField(
              decoration: new InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
                  counterStyle: TextStyle(color: Color(0xFF37505D)),
                  labelText: "نسبة الخصم *",
                  fillColor: Color(0xFF37505D),
                  prefixIcon: Icon(FontAwesomeIcons.percent),
                  labelStyle: TextStyle(
                      fontFamily: ArabicFonts.Cairo,
                      package: 'google_fonts_arabic',
                      fontSize: 10.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF37505D))),
              keyboardType: TextInputType.number,
              inputFormatters: [new LengthLimitingTextInputFormatter(30)],
              validator: (val) => val.isEmpty ? 'يرجى إدخال الخصم' : null,
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
