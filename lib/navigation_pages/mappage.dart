import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:latlong2/latlong.dart';
import 'package:newtruck/constants/constants.dart';

class mappingPage extends StatefulWidget {
  const mappingPage({Key? key}) : super(key: key);

  @override
  _mappingPageState createState() => _mappingPageState();
}

class _mappingPageState extends State<mappingPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    Future.delayed(Duration.zero, () => showAlert(context));
    double height = MediaQuery.of(context).size.height;
    return Stack(
      children:[
        Positioned.fill(
          child: FlutterMap(
            options: MapOptions(
              center: LatLng(6.437976644713211, 3.5208400779106883),
              zoom: 16.0,
            ),
            layers: [
              TileLayerOptions(
                urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                subdomains: ['a', 'b', 'c'],
                // attributionBuilder: (_) {
                //   return Text("Gotruck.ng");
                // },
              ),
              MarkerLayerOptions(
                markers: [
                  Marker(
                    width: 80.0,
                    height: 80.0,
                    point: LatLng(6.437976644713211, 3.5208400779106883),
                    builder: (ctx) => Container(
                      child: Icon(
                        Icons.location_pin,
                        color: Colors.red,
                        size: 34,
                      ),
                    ),
                  ),
                  Marker(
                    width: 80.0,
                    height: 80.0,
                    point: LatLng(6.448976644713211, 3.2208400779106883),
                    builder: (ctx) => Container(
                      child: Icon(
                        Icons.location_pin,
                        color: kPrimaryColor,
                        size: 34,
                      ),
                    ),
                  ),
                  Marker(
                    width: 80.0,
                    height: 80.0,
                    point: LatLng(6.558976644713211, 3.1208400779106883),
                    builder: (ctx) => Container(
                      child: Icon(
                        Icons.location_pin,
                        color:kPrimaryColor,
                        size: 34,
                      ),
                    ),
                  ),
                  Marker(
                    width: 80.0,
                    height: 80.0,
                    point: LatLng(6.749976644713211, 3.2308400779106883),
                    builder: (ctx) => Container(
                      child: Icon(
                        Icons.location_pin,
                        color:kPrimaryColor,
                        size: 34,
                      ),
                    ),
                  ),
                  Marker(
                    width: 80.0,
                    height: 80.0,
                    point: LatLng(6.428976644713211, 3.5608400779106883),
                    builder: (ctx) => Container(
                      child: Icon(
                        Icons.location_pin,
                        color: kPrimaryColor,
                        size: 34,
                      ),
                    ),
                  ),
                  Marker(
                    width: 80.0,
                    height: 80.0,
                    point: LatLng(6.458976644713211, 3.5508400779106883),
                    builder: (ctx) => Container(
                      child: Icon(
                        Icons.location_pin,
                        color: kPrimaryColor,
                        size: 34,
                      ),
                    ),
                  ),
                  Marker(
                    width: 80.0,
                    height: 80.0,
                    point: LatLng(6.548976644713211, 3.5208400779106883),
                    builder: (ctx) => Container(
                      child: Icon(
                        Icons.location_pin,
                        color: kPrimaryColor,
                        size: 34,
                      ),
                    ),
                  ),
                  Marker(
                    width: 80.0,
                    height: 80.0,
                    point: LatLng(6.578976644713211, 3.6208400779106883),
                    builder: (ctx) => Container(
                      child: Icon(
                        Icons.location_pin,
                        color: kPrimaryColor,
                        size: 34,
                      ),
                    ),
                  ),
                  Marker(
                    width: 80.0,
                    height: 80.0,
                    point: LatLng(6.588976644713211, 3.5000000079106883),
                    builder: (ctx) => Container(
                      child: Icon(
                        Icons.location_pin,
                        color: kPrimaryColor,
                        size: 34,
                      ),
                    ),
                  ),
                  Marker(
                    width: 80.0,
                    height: 80.0,
                    point: LatLng(6.498976644713211, 3.3298400779106883),
                    builder: (ctx) => Container(
                      child: Icon(
                        Icons.location_pin,
                        color: kPrimaryColor,
                        size: 34,
                      ),
                    ),
                  ),
                  Marker(
                    width: 80.0,
                    height: 80.0,
                    point: LatLng(6.578976644713211, 3.3298400779106883),
                    builder: (ctx) => Container(
                      child: Icon(
                        Icons.location_pin,
                        color: kPrimaryColor,
                        size: 34,
                      ),
                    ),
                  ),
                  Marker(
                    width: 80.0,
                    height: 80.0,
                    point: LatLng(6.437976644713211, 3.5308400779106883),
                    builder: (ctx) => Container(
                      child: Icon(
                        Icons.location_pin,
                        color: kPrimaryColor,
                        size: 34,
                      ),
                    ),
                  ),
                  Marker(
                    width: 80.0,
                    height: 80.0,
                    point: LatLng(6.437976644713211, 3.4808400779106883),
                    builder: (ctx) => Container(
                      child: Icon(
                        Icons.location_pin,
                        color: kPrimaryColor,
                        size: 34,
                      ),
                    ),
                  ),
                  Marker(
                    width: 80.0,
                    height: 80.0,
                    point: LatLng(6.427976644713211, 3.5008400779106883),
                    builder: (ctx) => Container(
                      child: Icon(
                        Icons.location_pin,
                        color: kPrimaryColor,
                        size: 34,
                      ),
                    ),
                  ),
                  Marker(
                    width: 80.0,
                    height: 80.0,
                    point: LatLng(6.447976644713211, 3.5008400779106883),
                    builder: (ctx) => Container(
                      child: Icon(
                        Icons.location_pin,
                        color: kPrimaryColor,
                        size: 34,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          top: 90,
          left: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            child: Container(
              padding: EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width * 0.90,
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(.05),
                      blurRadius: 5,
                      spreadRadius: 3,
                      offset: Offset(1, 10),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(10.0)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(28),
                    ),
                    child: ListTile(
                      title: Text('Office: 3 Nicole Balogun Street, Igbo Efon, Lekki Lagos.',),
                      leading: Icon(
                        Icons.language,
                        color: kPrimaryLightColor,),),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(28),
                    ),
                    child: ListTile(
                      title: Text('+2348038199515'),
                      leading: Icon(
                        Icons.phone_in_talk_sharp,
                        color: kPrimaryLightColor,),),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
  void showAlert(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: Container(
            height: 200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: TextFormField(
                        cursorColor: kPrimaryColor,
                        style: TextStyle(
                            color: Colors.black87, fontFamily: 'SFUIDisplay'),
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide(
                              color:kPrimaryLightColor,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                                width: 1,
                                style: BorderStyle.solid,
                                color: kPrimaryColor),
                          ),
                          fillColor: Colors.grey.shade200,
                          filled: true,
                          labelText: 'Truck Id',
                          prefixIcon: Icon(
                            Icons.account_circle,
                            color: kPrimaryColor,
                          ),
                          labelStyle: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              color: kPrimaryColor,
                              fontWeight: FontWeight.normal,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        // validator: validateDetails,
                        // onSaved: (String? val) {
                        //   nameperson = val!;
                        // },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: TextFormField(
                        cursorColor: kPrimaryColor,
                        style: TextStyle(
                            color: Colors.black87, fontFamily: 'SFUIDisplay'),
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide(
                              color:kPrimaryLightColor,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                                width: 1,
                                style: BorderStyle.solid,
                                color: kPrimaryColor),
                          ),
                          fillColor: Colors.grey.shade200,
                          filled: true,
                          labelText: 'Tracking Id',
                          prefixIcon: Icon(
                            Icons.mail,
                            color: kPrimaryColor,
                          ),
                          labelStyle: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              color: kPrimaryColor,
                              fontWeight: FontWeight.normal,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        // validator: validateDetails,
                        // onSaved: (String? val) {
                        //   email = val!;
                        // },
                      ),
                    ),
                  ],
                ),
                FlatButton(
                  child: Text(
                    'Proceed',
                    style: TextStyle(color: Colors.white),
                  ),
                  color: kPrimaryColor,
                  onPressed: () {


                    // if (_key.currentState!.validate()) {
                    //   // No any error in validation
                    //   _key.currentState!.save();
                    //   submitComplaint(totalScore);
                    //
                    // } else {
                    //   // validation error
                    //   setState(() {
                    //     // _validate = true;
                    //   });
                    // }
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
