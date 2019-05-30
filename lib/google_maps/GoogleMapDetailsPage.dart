//import 'package:flutter/material.dart';
//import 'package:google_fonts_arabic/fonts.dart';
//import 'package:google_maps_flutter/google_maps_flutter.dart';
//import 'package:google_maps_webservice/places.dart';
//import 'package:takaful/screens/account_doctor/DoctorsPages.dart';
//
//const kGoogleApiKey = "AIzaSyBU7XxG0zI-MQzLnfWheKFTkWx-jTm19E0";
//GoogleMapsPlaces _places = GoogleMapsPlaces(apiKey: kGoogleApiKey);
//
//class PlaceDetailWidget extends StatefulWidget {
//  String placeId;
//
//  PlaceDetailWidget(String placeId) {
//    this.placeId = placeId;
//  }
//
//  @override
//  State<StatefulWidget> createState() {
//    return PlaceDetailState();
//  }
//}
//
//class PlaceDetailState extends State<PlaceDetailWidget> {
//  GoogleMapController mapController;
//  PlacesDetailsResponse place;
//  bool isLoading = false;
//  String errorLoading;
//
//  @override
//  void initState() {
//    fetchPlaceDetail();
//    super.initState();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    Widget bodyChild;
//    String title;
//    if (isLoading) {
//      title = "جاري تحميل التفاصيل ...";
//      bodyChild = Center(
//        child: CircularProgressIndicator(
//          value: null,
//        ),
//      );
//    } else if (errorLoading != null) {
//      title = "";
//      bodyChild = Center(
//        child: Text(errorLoading),
//      );
//    } else {
//      final placeDetail = place.result;
//      final location = place.result.geometry.location;
//      final lat = location.lat;
//      final lng = location.lng;
//      final center = LatLng(lat, lng);
//
//      title = placeDetail.name;
//      bodyChild = Column(
//        mainAxisAlignment: MainAxisAlignment.start,
//        crossAxisAlignment: CrossAxisAlignment.stretch,
//        children: <Widget>[
//          Container(
//            child: SizedBox(
//              height: 300.0,
//              child: GoogleMap(
//                onMapCreated: _onMapCreated,
//                options: GoogleMapOptions(
//                    myLocationEnabled: true,
//                    cameraPosition: CameraPosition(target: center, zoom: 15.0)),
//              ),
//            ),
//          ),
//          Expanded(
//            child: buildPlaceDetailList(placeDetail),
//          ),
//        ],
//      );
//    }
//
//    return Scaffold(
//      appBar: AppBar(
//        title: Text(title),
//      ),
//      body: bodyChild,
//      bottomNavigationBar: new Container(
//        color: Colors.white,
//        child: Row(
//          children: <Widget>[
//            Expanded(
//              child: new MaterialButton(
//                onPressed: () {
//                  Navigator.push(
//                    context,
//                    MaterialPageRoute(
//                      builder: (context) => DoctorsPages(),
//                    ),
//                  );
//                },
//                color: Color(0xFFE91E63),
//                splashColor: Color(0xFFFF1B5E),
//                textColor: Colors.white,
//                elevation: 0.2,
//                child: Padding(
//                  padding: const EdgeInsets.all(8.0),
//                  child: new Text("الأطباء",
//                      style: TextStyle(
//                          fontFamily: ArabicFonts.Cairo,
//                          fontSize: 20.0,
//                          package: 'google_fonts_arabic',
//                          fontWeight: FontWeight.bold,
//                          color: Colors.white)),
//                ),
//              ),
//            ),
//            SizedBox(width: 3.0),
//            Expanded(
//              child: new MaterialButton(
//                onPressed: () {},
//                color: Color(0xFFE91E63),
//                splashColor: Color(0xFFFF1B5E),
//                textColor: Colors.white,
//                elevation: 0.2,
//                child: Padding(
//                  padding: const EdgeInsets.all(8.0),
//                  child: new Text("التخصصات",
//                      style: TextStyle(
//                          fontFamily: ArabicFonts.Cairo,
//                          package: 'google_fonts_arabic',
//                          fontSize: 20.0,
//                          fontWeight: FontWeight.bold,
//                          color: Colors.white)),
//                ),
//              ),
//            ),
//          ],
//        ),
//      ),
//    );
//  }
//
//  void fetchPlaceDetail() async {
//    setState(() {
//      this.isLoading = true;
//      this.errorLoading = null;
//    });
//
//    PlacesDetailsResponse place =
//        await _places.getDetailsByPlaceId(widget.placeId);
//
//    if (mounted) {
//      setState(() {
//        this.isLoading = false;
//        if (place.status == "OK") {
//          this.place = place;
//        } else {
//          this.errorLoading = place.errorMessage;
//        }
//      });
//    }
//  }
//
//  void _onMapCreated(GoogleMapController controller) {
//    mapController = controller;
//    final placeDetail = place.result;
//    final location = place.result.geometry.location;
//    final lat = location.lat;
//    final lng = location.lng;
//    final center = LatLng(lat, lng);
//    var markerOptions = MarkerOptions(
//        position: center,
//        infoWindowText: InfoWindowText(
//            "${placeDetail.name}", "${placeDetail.formattedAddress}"));
//    mapController.addMarker(markerOptions);
//    mapController.animateCamera(CameraUpdate.newCameraPosition(
//        CameraPosition(target: center, zoom: 15.0)));
//  }
//
//  String buildPhotoURL(String photoReference) {
//    return "https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=${photoReference}&key=${kGoogleApiKey}";
//  }
//
//  ListView buildPlaceDetailList(PlaceDetails placeDetail) {
//    List<Widget> list = [];
//    if (placeDetail.photos != null) {
//      final photos = placeDetail.photos;
//      list.add(SizedBox(
//          height: 100.0,
//          child: ListView.builder(
//              scrollDirection: Axis.horizontal,
//              itemCount: photos.length,
//              itemBuilder: (context, index) {
//                return Padding(
//                    padding: EdgeInsets.only(right: 1.0),
//                    child: SizedBox(
//                      height: 100,
//                      child: Image.network(
//                          buildPhotoURL(photos[index].photoReference)),
//                    ));
//              })));
//    }
//
//    list.add(
//      Padding(
//          padding:
//              EdgeInsets.only(top: 4.0, left: 8.0, right: 8.0, bottom: 4.0),
//          child: Text(
//            placeDetail.name,
//            style: Theme.of(context).textTheme.subtitle,
//          )),
//    );
//
//    if (placeDetail.formattedAddress != null) {
//      list.add(
//        Padding(
//            padding:
//                EdgeInsets.only(top: 4.0, left: 8.0, right: 8.0, bottom: 4.0),
//            child: Text(
//              placeDetail.formattedAddress,
//              style: Theme.of(context).textTheme.body1,
//            )),
//      );
//    }
//
//    if (placeDetail.types?.first != null) {
//      list.add(
//        Padding(
//            padding:
//                EdgeInsets.only(top: 4.0, left: 8.0, right: 8.0, bottom: 0.0),
//            child: Text(
//              placeDetail.types.first.toUpperCase(),
//              style: Theme.of(context).textTheme.caption,
//            )),
//      );
//    }
//
//    if (placeDetail.formattedPhoneNumber != null) {
//      list.add(
//        Padding(
//            padding:
//                EdgeInsets.only(top: 4.0, left: 8.0, right: 8.0, bottom: 4.0),
//            child: Text(
//              placeDetail.formattedPhoneNumber,
//              style: Theme.of(context).textTheme.button,
//            )),
//      );
//    }
//
//    if (placeDetail.openingHours != null) {
//      final openingHour = placeDetail.openingHours;
//      var text = '';
//      if (openingHour.openNow) {
//        text = 'مفتوح الأن';
//      } else {
//        text = 'مغلق الأن';
//      }
//      list.add(
//        Padding(
//            padding:
//                EdgeInsets.only(top: 0.0, left: 8.0, right: 8.0, bottom: 4.0),
//            child: Text(text,
//                //style: Theme.of(context).textTheme.caption,
//                style: TextStyle(
//                    fontFamily: ArabicFonts.Cairo,
//                    package: 'google_fonts_arabic',
//                    //fontSize: 20.0,
//                    fontWeight: FontWeight.bold,
//                    color: Colors.green))),
//      );
//    }
//
//    if (placeDetail.website != null) {
//      list.add(
//        Padding(
//            padding:
//                EdgeInsets.only(top: 0.0, left: 8.0, right: 8.0, bottom: 4.0),
//            child: Text(placeDetail.website,
//                //style: Theme.of(context).textTheme.caption,
//                style: TextStyle(
//                    fontFamily: ArabicFonts.Cairo,
//                    package: 'google_fonts_arabic',
//                    //fontSize: 20.0,
//                    fontWeight: FontWeight.bold,
//                    color: Colors.blue))),
//      );
//    }
//
//    if (placeDetail.rating != null) {
//      list.add(
//        Padding(
//            padding:
//                EdgeInsets.only(top: 0.0, left: 8.0, right: 8.0, bottom: 4.0),
//            child: Text(" التقيمات : ${placeDetail.rating}",
//                //style: Theme.of(context).textTheme.caption,
//                style: TextStyle(
//                    fontFamily: ArabicFonts.Cairo,
//                    package: 'google_fonts_arabic',
//                    //fontSize: 20.0,
//                    fontWeight: FontWeight.bold,
//                    color: Colors.pink))),
//      );
//    }
//
//    return ListView(
//      shrinkWrap: true,
//      children: list,
//    );
//  }
//}
