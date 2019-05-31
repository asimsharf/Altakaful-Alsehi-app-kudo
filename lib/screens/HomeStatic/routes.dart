import 'package:flutter/material.dart';
import 'package:takaful/TestsFolder/LoginTow/screens/home/home_screen.dart';
import 'package:takaful/TestsFolder/LoginTow/screens/login/login_screen.dart';
import 'package:takaful/google_maps/Google.dart';
import 'package:takaful/language/language_selector_page.dart';
import 'package:takaful/screens/account_center/CenterLogin.dart';
import 'package:takaful/screens/account_center/CenterOffers.dart';
import 'package:takaful/screens/account_client/ProfilePage.dart';
import 'package:takaful/screens/account_client/RequestCard.dart';
import 'package:takaful/screens/account_client/UserLogin.dart';

import '../Home.dart';
import '../SubscriptionPage.dart';

//  '/login': (BuildContext context) => new LoginScreen(),
//  '/home': (BuildContext context) => new HomeScreen(),
//  '/': (BuildContext context) => new LoginScreen(),

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
  '/GoogleMaps': (BuildContext context) => new Home(),
};
