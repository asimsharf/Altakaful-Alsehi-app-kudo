import 'package:flutter/material.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:takaful/language/app_translations.dart';
import 'package:takaful/screens/dashboard/Admins.dart';
import 'package:takaful/screens/dashboard/Doctors.dart';
import 'package:takaful/screens/dashboard/Serivces.dart';

import 'Bloggers.dart';
import 'Bookings.dart';
import 'Centers.dart';
import 'Department.dart';
import 'Offers.dart';
import 'Settings.dart';

class DashboardManageCenter extends StatelessWidget {
  DashboardManageCenter({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text(AppTranslations.of(context).text("tab_manage_centers"),
            style: TextStyle(
                fontFamily: ArabicFonts.Cairo,
                package: 'google_fonts_arabic',
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
                color: Colors.white)),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 18.0, horizontal: 2.0),
        child: GridView.count(
          crossAxisCount: 3,
          padding: EdgeInsets.all(3.0),
          children: <Widget>[
            GestureDetector(
              child: makeDashboardItem(
                  AppTranslations.of(context).text("center"), Icons.home),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Centers(),
                  ),
                );
              },
            ),
            GestureDetector(
              child: makeDashboardItem(
                  AppTranslations.of(context).text("administrator"),
                  Icons.person),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Admins(),
                  ),
                );
              },
            ),
            GestureDetector(
              child: makeDashboardItem(
                  AppTranslations.of(context).text("department"), Icons.list),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Department(),
                  ),
                );
              },
            ),
            GestureDetector(
              child: makeDashboardItem(
                  AppTranslations.of(context).text("services"),
                  Icons.local_offer),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Serivces(),
                  ),
                );
              },
            ),
            GestureDetector(
              child: makeDashboardItem(
                  AppTranslations.of(context).text("offers"),
                  Icons.call_received),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Offers(),
                  ),
                );
              },
            ),
            GestureDetector(
              child: makeDashboardItem(
                  AppTranslations.of(context).text("doctors"),
                  Icons.supervisor_account),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Doctors(),
                  ),
                );
              },
            ),
            GestureDetector(
              child: makeDashboardItem(
                  AppTranslations.of(context).text("blogger"),
                  Icons.show_chart),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Bloggers(),
                  ),
                );
              },
            ),
            GestureDetector(
              child: makeDashboardItem(
                  AppTranslations.of(context).text("booking"), Icons.book),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Bookings(),
                  ),
                );
              },
            ),
            GestureDetector(
              child: makeDashboardItem(
                  AppTranslations.of(context).text("settings"), Icons.settings),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Settings(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Card makeDashboardItem(String title, IconData icon) {
    return Card(
        color: Color(0xFFFF1B5E),
        elevation: 10.0,
        margin: new EdgeInsets.all(1.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Color(0xFFFF1B5E),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            verticalDirection: VerticalDirection.down,
            children: <Widget>[
              SizedBox(height: 20.0),
              Center(
                  child: Icon(
                icon,
                size: 40.0,
                color: Colors.white,
              )),
              SizedBox(height: 18.0),
              new Center(
                child: new Text(
                  title,
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: ArabicFonts.Cairo,
                      package: 'google_fonts_arabic',
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0),
                ),
              )
            ],
          ),
        ));
  }
}
