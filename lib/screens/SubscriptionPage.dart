import 'package:flutter/material.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:takaful/language/app_translations.dart';

import './account_center/CenterCreate.dart';
import './account_client/CreateClients.dart';
import './account_doctor/CreateDoctor.dart';
import './account_employee/CreateEmployee.dart';
import './account_marketing/CreateMarketter.dart';

class Subscription extends StatefulWidget {
  @override
  _SubscriptionState createState() => _SubscriptionState();
}

class _SubscriptionState extends State<Subscription> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            AppTranslations.of(context).text("tab_subscription"),
            //AppTranslations.of(context).text("title_select_language"),
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: ArabicFonts.Cairo,
              package: 'google_fonts_arabic',
            ),
          ),
        ),
        body: Column(
          children: <Widget>[
            new InkWell(
              splashColor: Color(0xFFFF1B5E),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CenterCreate(),
                  ),
                );
              },
              child: new Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.all(2.0),
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1.0,
                      color: Color(0xFFDFDAD6),
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(5.0), //   ,      <--- border radius here
                    ),
                  ),
                  child: new Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(
                        "إشتراك مراكز طبية",
                        style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontFamily: ArabicFonts.Cairo,
                            package: 'google_fonts_arabic'),
                      ),
                    ],
                  )),
            ),
            new InkWell(
              splashColor: Color(0xFFFF1B5E),
              onTap: () {
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (context) => new CreateClients()));
              },
              child: new Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.all(2.0),
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1.0,
                      color: Color(0xFFDFDAD6),
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(5.0), //   ,      <--- border radius here
                    ),
                  ),
                  child: new Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(
                        "إشتراك مستخدم",
                        style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontFamily: ArabicFonts.Cairo,
                            package: 'google_fonts_arabic'),
                      ),
                    ],
                  )),
            ),
            new InkWell(
              splashColor: Color(0xFFFF1B5E),
              onTap: () {
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (context) => new CreateMarketter()));
              },
              child: new Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.all(2.0),
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1.0,
                      color: Color(0xFFDFDAD6),
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(5.0), //   ,      <--- border radius here
                    ),
                  ),
                  child: new Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(
                        "إشتراك مسوق",
                        style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontFamily: ArabicFonts.Cairo,
                            package: 'google_fonts_arabic'),
                      ),
                    ],
                  )),
            ),
            new InkWell(
              splashColor: Color(0xFFFF1B5E),
              onTap: () {
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => CreateDoctor()));
              },
              child: new Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.all(2.0),
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1.0,
                      color: Color(0xFFDFDAD6),
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(5.0), //   ,      <--- border radius here
                    ),
                  ),
                  child: new Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(
                        "إشتراك طبيب",
                        style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontFamily: ArabicFonts.Cairo,
                            package: 'google_fonts_arabic'),
                      ),
                    ],
                  )),
            ),
            new InkWell(
              splashColor: Color(0xFFFF1B5E),
              onTap: () {
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => CreateEmployee()));
              },
              child: new Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.all(2.0),
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1.0,
                      color: Color(0xFFDFDAD6),
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(5.0), //   ,      <--- border radius here
                    ),
                  ),
                  child: new Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(
                        "إشتراك موظف",
                        style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontFamily: ArabicFonts.Cairo,
                            package: 'google_fonts_arabic'),
                      ),
                    ],
                  )),
            ),
          ],
        ));
  }
}
