import 'package:flutter/material.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:takaful/language/app_translations.dart';
import 'package:takaful/language/application.dart';

class LanguageSelectorPage extends StatefulWidget {
  @override
  _LanguageSelectorPageState createState() => _LanguageSelectorPageState();
}

class _LanguageSelectorPageState extends State<LanguageSelectorPage> {
  static final List<String> languagesList = application.supportedLanguages;
  static final List<String> languageCodesList =
      application.supportedLanguagesCodes;

  final Map<dynamic, dynamic> languagesMap = {
    languagesList[0]: languageCodesList[0],
    languagesList[1]: languageCodesList[1],
    languagesList[2]: languageCodesList[2],
    languagesList[3]: languageCodesList[3],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppTranslations.of(context).text("title_select_language"),
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: ArabicFonts.Cairo,
            package: 'google_fonts_arabic',
          ),
        ),
      ),
      body: _buildLanguagesList(),
    );
  }

  _buildLanguagesList() {
    return ListView.builder(
      itemCount: languagesList.length,
      itemBuilder: (context, index) {
        return _buildLanguageItem(languagesList[index]);
      },
    );
  }

  _buildLanguageItem(String language) {
    return InkWell(
      splashColor: Color(0xFFFF1B5E),
      onTap: () {
        print(language);
        application.onLocaleChanged(Locale(languagesMap[language]));
      },
      child: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.all(2.0),
          padding: const EdgeInsets.all(10.0),
          decoration: myBoxDecoration(), //       <--- BoxDecoration here
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(
                language,
                style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontFamily: ArabicFonts.Cairo,
                    package: 'google_fonts_arabic'),
              ),
            ],
          )),
    );
  }

  BoxDecoration myBoxDecoration() {
    return BoxDecoration(
      border: Border.all(
        width: 1.0,
        color: Color(0xFFDFDAD6),
      ),
      borderRadius: BorderRadius.all(
        Radius.circular(5.0), //   ,      <--- border radius here
      ),
    );
  }
}
