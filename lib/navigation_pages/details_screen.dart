import 'dart:io';

import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../constants/constants.dart';
import '../models/cart_controller.dart';
import '../models/utils.dart';
import 'components/shimmer.dart';




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
    final cartController = Get.put(CartController());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor:const Color(0xFF0FA958),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment:CrossAxisAlignment.start,
          children: [
            Padding(
              padding:  const EdgeInsets.symmetric(horizontal: 15.0),
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
                              padding:const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
                              child: Text(model == 'null' ? 'n/a' : model, style: MainHeading,textAlign: TextAlign.left,),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0,),
                              child: Text(
                                brand == 'null' ? 'n/a' : brand,
                                style:const TextStyle(fontSize: 20, ),textAlign: TextAlign.left,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SpecificsAmount(
                        name: 'Amount',
                        name2: price == 'null' ? 'n/a' : formatCurrency.format(
                            double.parse(
                                (price)
                                    .toString())),
                      )
                    ],
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20.0),
                      child: Hero(tag: model == 'null' ? 'n/a' : model, child: Image.network(imageurl == 'null' ? 'n/a' : imageurl, width: 300,)),
                    ),
                  ),
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
                              padding:const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
                              child: Text(model == 'null' ? 'n/a' : model, style: MainHeading,textAlign: TextAlign.left,),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0,),
                              child: Text(
                                brand == 'null' ? 'n/a' : brand,
                                style:const TextStyle(fontSize: 20, ),textAlign: TextAlign.left,
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                          padding: EdgeInsets.all(0),
                          onPressed: (){
                            cartController.addProduct(usar);
                          },
                          icon: const Icon(CommunityMaterialIcons.cart_plus, color:kPrimaryColor,size: 20,))
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(

                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment:CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SpecificsCard(
                            name: 'Engine Type',
                            name2: enginetype == 'null' ? 'n/a' : enginetype,
                            imageurl: 'engine.svg',
                          ),

                          const SizedBox(width: 5),
                          SpecificsCard(
                            name: 'Fuel Tank',
                            name2: fueltank == 'null' ? 'n/a' : '${fueltank} Ltrs',
                            imageurl: 'gas.svg',
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SpecificsCard(
                            name: 'Number of Tires',
                            name2: tire == 'null' ? 'n/a' : tire,
                            imageurl: 'tire.svg',
                          ),
                          const SizedBox(width: 5),
                          SpecificsCard(
                            name: 'Mileage',
                            name2: milage == 'null' ? 'n/a' : '${milage}km',
                            imageurl: 'digital-display-svgrepo-com.svg',
                          )
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SpecificsCard(
                            name: 'Year',
                            name2: year == 'null' ? 'n/a' : year,
                            imageurl: 'calendar.svg',
                          ),
                          const SizedBox(width: 5),
                          SpecificsCard(
                            name: 'Speed',
                            name2: maxspeed == 'null' ? 'n/a' : '${maxspeed}km/h',
                            imageurl: 'speed.svg',
                          )
                        ],
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          'Specifications',
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  color: Colors.black87,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SpecificsCard(
                                name: 'Axle',
                                name2: rearaxle == 'null' ? 'n/a' : rearaxle,
                                imageurl: 'truck.svg',
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SpecificsCard(
                                name: 'Max Torque',
                                name2: maxtorque == 'null' ? 'n/a' : maxtorque,
                                imageurl: 'wrench.svg',
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SpecificsCard(
                                name: 'Tonnage Capacity',
                                name2: tonnage == 'null' ? 'n/a' : tonnage,
                                imageurl: 'weti.svg',
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              SpecificsCard(
                                name: 'Transmission',
                                name2: transmissionmodel == 'null' ? 'n/a' : transmissionmodel,
                                imageurl: 'manual.svg',
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              SpecificsCard(
                                name: 'Driving Type',
                                name2: drivingtype == 'null' ? 'n/a' : drivingtype,
                                imageurl: 'steering.svg',
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              SpecificsCard(
                                name: 'Clutch Type',
                                name2: clutch == 'null' ? 'n/a' : clutch,
                                imageurl: 'tyy.svg',
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}