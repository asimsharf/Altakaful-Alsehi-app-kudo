import 'package:flutter/material.dart';
import 'package:takaful/TestsFolder/LoginTow/screens/home/home_screen.dart';
import 'package:takaful/TestsFolder/LoginTow/screens/login/login_screen.dart';
import 'package:takaful/google_maps/GoogleMapPage.dart';
import 'package:takaful/language/language_selector_page.dart';
import 'package:takaful/screens/Home.dart';
import 'package:takaful/screens/SubscriptionPage.dart';
import 'package:takaful/screens/account_center/CenterLogin.dart';
import 'package:takaful/screens/account_center/CenterOffers.dart';
import 'package:takaful/screens/account_client/ProfilePage.dart';
import 'package:takaful/screens/account_client/RequestCard.dart';
import 'package:takaful/screens/account_client/UserLogin.dart';
import 'package:takaful/screens/dashboard/Add/AddDepartment.dart';
import 'package:takaful/screens/dashboard/Add/AddNews.dart';
import 'package:takaful/screens/dashboard/Add/AddOffers.dart';
import 'package:takaful/screens/dashboard/Add/AddServices.dart';
import 'package:takaful/screens/dashboard/Edit/EditAdministrator.dart';
import 'package:takaful/screens/dashboard/Edit/EditDepartment.dart';
import 'package:takaful/screens/dashboard/Edit/EditNews.dart';
import 'package:takaful/screens/dashboard/Edit/EditOffers.dart';
import 'package:takaful/screens/dashboard/Edit/EditSerivces.dart';

final routes = <String, WidgetBuilder>{
  '/Home': (BuildContext context) => HomeMainPage(),
  '/ProfilePage': (BuildContext context) => ProfilePage(),
  '/Subscription': (BuildContext context) => Subscription(),
  '/RequestCard': (BuildContext context) => RequestCard(),
  '/CenterOffers': (BuildContext context) => CenterOffers(),
  '/CenterLogin': (BuildContext context) => CenterLogin(),
  '/UserLogin': (BuildContext context) => UserLogin(),
  '/LanguageSelectorPage': (BuildContext context) => LanguageSelectorPage(),
  '/LoginScreen': (BuildContext context) => new LoginScreen(),
  '/HomeScreen': (BuildContext context) => new HomeScreen(),
  '/HomeGoogleMap': (BuildContext context) => new HomeGoogleMap(),
  '/AddOffers': (BuildContext context) => new AddOffers(),
  '/EditOffers': (BuildContext context) => new EditOffers(),
  '/AddServices': (BuildContext context) => new AddServices(),
  '/EditServices': (BuildContext context) => new EditServices(),
  '/EditAdministrator': (BuildContext context) => new EditAdministrator(),
  '/AddDepartment': (BuildContext context) => new AddDepartment(),
  '/EditDepartment': (BuildContext context) => new EditDepartment(),
  '/AddNews': (BuildContext context) => new AddNews(),
  '/EditNews': (BuildContext context) => new EditNews(),
};
