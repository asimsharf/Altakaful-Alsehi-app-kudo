//import 'dart:async';
//
//import 'package:flutter/material.dart';
//import 'package:google_maps_flutter/google_maps_flutter.dart';
//
//class GoogleMaps extends StatefulWidget {
//  @override
//  _GoogleMapsState createState() => _GoogleMapsState();
//}
//
//class _GoogleMapsState extends State<GoogleMaps> {
//  Completer<GoogleMapController> _controller = Completer();
//  @override
//  void initState() {
//    super.initState();
//  }
//
//  double zoomVal = 5.0;
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        leading: IconButton(
//          icon: Icon(Icons.arrow_left),
//          onPressed: () {},
//        ),
//        title: Text("New Yourk"),
//        actions: <Widget>[
//          IconButton(
//            icon: Icon(Icons.search),
//            onPressed: () {},
//          )
//        ],
//      ),
//      body: Stack(
//        children: <Widget>[
//          _googlemap(context),
////          _zoomminusfunction(),
////          _zoomplusfunction(),
//          _buildController(),
//        ],
//      ),
//    );
//  }
//Widget _buildController(BuildContext context){
//  	return Align(
//		  alignment: Alignment.bottomLeft,
//		  child: Container(
//			  margin: EdgeInsets.symmetric(vertical: 20.0),
//			  height: 150.0,
//			  child: ListView(
//				  scrollDirection: Axis.horizontal,
//				  children: <Widget>[
//				  	SizedBox(width: 10.0),
//					  Padding(
//						  padding: const EdgeInsets.all(8.0),
//						  child: _boxes(
//								  "https://a;sdfa;sldf",
//								  40.738380,-73.988426,"Gramercy Taveen"
//						  ),
//					  ),
//					  SizedBox(width: 10.0),
//					  Padding(
//						  padding: const EdgeInsets.all(8.0),
//						  child: _boxes(
//								  "https://a;sdfa;sldf",
//								  40.738380,-73.988426,"Gramercy Taveen"
//						  ),
//					  ),
//					  SizedBox(width: 10.0),
//					  Padding(
//						  padding: const EdgeInsets.all(8.0),
//						  child: _boxes(
//								  "https://a;sdfa;sldf",
//								  40.738380,-73.988426,"Gramercy Taveen"
//						  ),
//					  ),
//				  ],
//			  ),
//		  ),
//	  )
//}
//  Widget _googlemap(BuildContext context) {
//    return Container(
//      height: MediaQuery.of(context).size.height,
//      width: MediaQuery.of(context).size.width,
//      child: GoogleMap(
//        mapType: MapType.normal,
//        initialCameraPosition:
//            CameraPosition(target: LatLng(40.712776, -74.005974), zoom: 12),
//        onMapCreated: (GoogleMapController controller) {
//          _controller.complete(controller);
//        },
//        markers: {newyourk1Marker, newyourk2Marker},
//      ),
//    );
//  }
//}
//
//Marker newyourk1Marker = Marker(
//  markerId: MarkerId('newyouk1'),
//  position: LatLng(40.742451, -74005959),
//  infoWindow: InfoWindow(title: 'Los Tacos'),
//  icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueViolet),
//);
//
//Marker newyourk2Marker = Marker(
//  markerId: MarkerId('newyouk1'),
//  position: LatLng(40.742451, -74005959),
//  infoWindow: InfoWindow(title: 'Los Tacos'),
//  icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueViolet),
//);
