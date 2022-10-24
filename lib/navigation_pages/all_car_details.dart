import 'dart:io';

import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:newtruck/models/utils.dart';
import 'package:newtruck/navigation_pages/components/specific_card.dart';

class allCarDetail extends StatelessWidget {
  final formatCurrency =
  NumberFormat.simpleCurrency(locale: Platform.localeName, name: 'NGN');
  // String id;
  String year;
  String brand;
  String model;
  String drivingtype;
  String fueltank;
  String tire;
  String bodytype;
  String color;
  String enginetype;
  String tonnage;
  String wheelbase;
  String maxspeed;
  String maxtorque;
  String clutch;
  String transmissionmodel;
  String rearaxle;
  String steeringtech;
  String milage;
  String price;
  String imageurl;
  String trucknumber;

  allCarDetail(
      {
        // required this.id,
        required this.year,
        required this.brand,
        required this.model,
        required this.drivingtype,
        required this.fueltank,
        required this.tire,
        required this.bodytype,
        required this.color,
        required this.enginetype,
        required this.tonnage,
        required this.wheelbase,
        required this.maxspeed,
        required this.maxtorque,
        required this.clutch,
        required this.transmissionmodel,
        required this.rearaxle,
        required this.steeringtech,
        required this.milage,
        required this.price,
        required this.imageurl,
        required this.trucknumber,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor:Color(0xFF0FA958),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 0.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment:CrossAxisAlignment.start,
            children: [
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment:CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment:CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
                                child: Text('${model == 'null' ? 'n/a' : model}', style: MainHeading,textAlign: TextAlign.left,),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0,),
                                child: Text(
                                  '${brand == 'null' ? 'n/a' : brand}',
                                  style:TextStyle(fontSize: 20, ),textAlign: TextAlign.left,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SpecificsAmount(
                          name: 'Amount',
                          name2: '${price == 'null' ? 'n/a' : formatCurrency.format(
                              double.parse(
                                  (price)
                                      .toString()))}',
                        )
                      ],
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20.0),
                        child: Hero(tag: '${model == 'null' ? 'n/a' : model}', child: Image.network('${imageurl == 'null' ? 'n/a' : imageurl}', width: 300,)),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SpecificsCard(
                          name: 'Engine Type',
                          name2: '${enginetype == 'null' ? 'n/a' : enginetype}',
                          imageurl: 'engine.png',
                        ),

                        SizedBox(width: 5),
                        SpecificsCard(
                          name: 'Fuel Tank',
                          name2: '${fueltank == 'null' ? 'n/a' : '${fueltank} Ltrs'}',
                          imageurl: 'fueltank.png',
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SpecificsCard(
                          name: 'Number of Tires',
                          name2: '${tire == 'null' ? 'n/a' : tire}',
                          imageurl: 'tire.png',
                        ),
                        SizedBox(width: 5),
                        SpecificsCard(
                          name: 'Mileage',
                          name2: '${milage == 'null' ? 'n/a' : '${milage}km'}',
                          imageurl: 'millage.png',
                        )
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SpecificsCard(
                          name: 'Year',
                          name2: '${year == 'null' ? 'n/a' : year}',
                          imageurl: 'year.jpg',
                        ),
                        SizedBox(width: 5),
                        SpecificsCard(
                          name: 'Speed',
                          name2: '${maxspeed == 'null' ? 'n/a' : '${maxspeed}km/h'}',
                          imageurl: 'speed.png',
                        )
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  'Specifications',
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          color: Colors.black87,
                          fontSize: 15,
                          fontWeight: FontWeight.bold)),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SpecificsCard2(
                          name: 'Axle',
                          name2: '${rearaxle == 'null' ? 'n/a' : rearaxle}',
                          imageurl: 'transmission.png',
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SpecificsCard2(
                          name: 'Max Torque',
                          name2: '${maxtorque == 'null' ? 'n/a' : maxtorque}',
                          imageurl: 'torque.png',
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SpecificsCard2(
                          name: 'Tonnage Capacity',
                          name2: '${tonnage == 'null' ? 'n/a' : tonnage}',
                          imageurl: 'tonnage.png',
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        SpecificsCard2(
                          name: 'Transmission',
                          name2: '${transmissionmodel == 'null' ? 'n/a' : transmissionmodel}',
                          imageurl: 'transmitt.png',
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        SpecificsCard2(
                          name: 'Driving Type',
                          name2: '${drivingtype == 'null' ? 'n/a' : drivingtype}',
                          imageurl: 'driving.png',
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        SpecificsCard2(
                          name: 'Clutch Type',
                          name2: '${clutch == 'null' ? 'n/a' : clutch}',
                          imageurl: 'clutch.png',
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}