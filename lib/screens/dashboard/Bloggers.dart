import 'package:flutter/material.dart';
import 'package:google_fonts_arabic/fonts.dart';

class Bloggers extends StatefulWidget {
  @override
  _BloggersState createState() => _BloggersState();
}

class _BloggersState extends State<Bloggers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
