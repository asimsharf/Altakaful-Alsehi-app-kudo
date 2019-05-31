import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:takaful/screens/HomeStatic/SplashScreenPage.dart';

import './language/app_translations_delegate.dart';
import './language/application.dart';
import './screens/Home.dart';
import 'screens/HomeStatic/routes.dart';

void main() => runApp(App());

class App extends StatefulWidget {
  @override
  _AppState createState() => new _AppState();
}

class _AppState extends State<App> {
  AppTranslationsDelegate _newLocaleDelegate;
  @override
  void initState() {
    super.initState();
    _newLocaleDelegate = AppTranslationsDelegate(newLocale: null);
    application.onLocaleChanged = onLocaleChange;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        _newLocaleDelegate,
        const AppTranslationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale("en", "US"),
        const Locale("ar", "AE"),
        const Locale("ur", ""),
        const Locale("hin", ""),
      ],
      //locale: Locale("ar", "AE"),
      theme: Theme.of(context).copyWith(
          accentIconTheme:
              Theme.of(context).accentIconTheme.copyWith(color: Colors.white),
          accentColor: Color(0xFF23AFB1),
          primaryColor: Color(0xFF23AFB1),
          primaryIconTheme:
              Theme.of(context).primaryIconTheme.copyWith(color: Colors.white),
          primaryTextTheme: Theme.of(context)
              .primaryTextTheme
              .apply(bodyColor: Colors.white)),
      //home: SplashPageLoginTow(),
      home: SplashScreenPage(),
      routes: routes,
      onGenerateRoute: (RouteSettings settings) {
        final List<String> pathElements = settings.name.split('/');
        if (pathElements[0] != '') {
          return null;
        }
//        if (pathElements[1] == 'product') {
//          final int index = int.parse(pathElements[2]);
//          return MaterialPageRoute<bool>(
//              builder: (BuildContext context) => ProductsDetails());
//        }
        return null;
      },
      onUnknownRoute: (RouteSettings settings) {
        return MaterialPageRoute(
            builder: (BuildContext context) => HomeMainPage());
      },
    );
  }

  void onLocaleChange(Locale locale) {
    setState(() {
      _newLocaleDelegate = AppTranslationsDelegate(newLocale: locale);
    });
  }
}
