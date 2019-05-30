//_ShowRattingAlert() {
//	return showDialog(
//			context: context,
//			builder: (BuildContext context) {
//				return AlertDialog(
//					shape: RoundedRectangleBorder(
//							borderRadius: BorderRadius.all(Radius.circular(32.0))),
//					contentPadding: EdgeInsets.only(top: 10.0),
//					content: Container(
//						width: 300.0,
//						child: Column(
//							mainAxisAlignment: MainAxisAlignment.start,
//							crossAxisAlignment: CrossAxisAlignment.stretch,
//							mainAxisSize: MainAxisSize.min,
//							children: <Widget>[
//								Row(
//									mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//									mainAxisSize: MainAxisSize.min,
//									children: <Widget>[
//										Text("تقييم",
//												style: TextStyle(
//													fontFamily: ArabicFonts.Cairo,
//													package: 'google_fonts_arabic',
//													fontSize: 25.0,
//													fontWeight: FontWeight.bold,
//												)),
//										Row(
//											mainAxisSize: MainAxisSize.min,
//											children: <Widget>[
//												Icon(
//													Icons.star_border,
//													color: Colors.yellow,
//													size: 30.0,
//												),
//												Icon(
//													Icons.star_border,
//													color: Colors.yellow,
//													size: 30.0,
//												),
//												Icon(
//													Icons.star_border,
//													color: Colors.yellow,
//													size: 30.0,
//												),
//												Icon(
//													Icons.star_border,
//													color: Colors.yellow,
//													size: 30.0,
//												),
//												Icon(
//													Icons.star_border,
//													color: Colors.yellow,
//													size: 30.0,
//												),
//											],
//										),
//									],
//								),
//								SizedBox(
//									height: 5.0,
//								),
//								Divider(
//									color: Colors.grey,
//									height: 4.0,
//								),
//								Padding(
//									padding: EdgeInsets.only(left: 30.0, right: 30.0),
//									child: TextField(
//										decoration: InputDecoration(
//												hintText: "إضافة ملاحظة",
//												border: InputBorder.none,
//												hintStyle: TextStyle(
//													fontFamily: ArabicFonts.Cairo,
//													package: 'google_fonts_arabic',
//													fontSize: 15.0,
//												)),
//										maxLines: 8,
//									),
//								),
//								InkWell(
//									child: Container(
//										padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
//										decoration: BoxDecoration(
//											color: Color(0xFFE91E63),
//											borderRadius: BorderRadius.only(
//													bottomLeft: Radius.circular(32.0),
//													bottomRight: Radius.circular(32.0)),
//										),
//										child: Text(
//											"إضافة تقيم",
//											style: TextStyle(
//													fontFamily: ArabicFonts.Cairo,
//													package: 'google_fonts_arabic',
//													fontSize: 15.0,
//													fontWeight: FontWeight.bold,
//													color: Colors.white),
//											textAlign: TextAlign.center,
//										),
//									),
//								),
//							],
//						),
//					),
//				);
//			});
//}
