import 'package:flutter/material.dart';
import 'package:google_fonts_arabic/fonts.dart';

class News extends StatefulWidget {
  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: IconButton(
                icon: Icon(Icons.add_circle_outline),
                onPressed: () {
                  Navigator.popAndPushNamed(context, '/AddNews');
                },
                tooltip: 'إضافة خبر جديد'),
          ),
        ],
        title: Text('إدارة الأخبار',
            style: TextStyle(
                fontFamily: ArabicFonts.Cairo,
                package: 'google_fonts_arabic',
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
                color: Colors.white)),
      ),
    );
  }
}
