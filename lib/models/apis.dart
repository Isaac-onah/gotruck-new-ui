import 'dart:convert';
import 'package:get/get.dart';

String emailStatusFromJson(String stre) {
  var tagObjsJson = jsonDecode(stre)['msg'];
  return tagObjsJson;
}


List<trucksfrom> trucksFromJson(String stre) {
  var tagObjsJson = jsonDecode(stre)['trucks'] as List;
  return List<trucksfrom>.from(tagObjsJson.map((x) => trucksfrom.fromJson(x)));
}

class trucksfrom {
  trucksfrom({
    required this.id,
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
    required this.frame,
    required this.imageurl,
    required this.trucknumber,
    required this.price,
    required this.status,
    required this.taken,
    required this.createdAt,
    required this.updatedAt,
  });

  String id;
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
  String frame;
  String imageurl;
  String trucknumber;
  int price;
  String status;
  String taken;
  String createdAt;
  String updatedAt;


  factory trucksfrom.fromJson(Map<String, dynamic> json) => trucksfrom(

    id: json["id"].toString(),
    year: json["year"].toString(),
    brand: json["brand"].toString(),
    model: json["model"].toString(),
    drivingtype: json["drivingtype"].toString(),
    fueltank: json["fueltank"].toString(),
    tire: json["tire"].toString(),
    bodytype: json["bodytype"].toString(),
    color: json["color"].toString(),
    enginetype: json["enginetype"].toString(),
    tonnage: json["tonnage"].toString(),
    wheelbase: json["wheelbase"].toString(),
    maxspeed: json["maxspeed"].toString(),
    maxtorque: json["maxtorque"].toString(),
    clutch: json["clutch"].toString(),
    transmissionmodel: json["transmissionmodel"].toString(),
    rearaxle: json["rearaxle"].toString(),
    steeringtech: json["steeringtech"].toString(),
    milage: json["milage"].toString(),
    frame: json["frame"].toString(),
    imageurl: json["imageurl"].toString(),
    trucknumber: json["trucknumber"].toString(),
    price: json["price"],
    status: json["status"].toString(),
    taken: json["taken"].toString(),
    createdAt: json["createdAt"].toString(),
    updatedAt: json["updatedAt"].toString(),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "year": year,
    "brand": brand,
    "model": model,
    "drivingtype": drivingtype,
    "fueltank": fueltank,
    "tire": tire,
    "bodytype": bodytype,
    "color": color,
    "enginetype": enginetype,
    "tonnage": tonnage,
    "wheelbase": wheelbase,
    "maxspeed": maxspeed,
    "maxtorque": maxtorque,
    "clutch": clutch,
    "transmissionmodel": transmissionmodel,
    "rearaxle": rearaxle,
    "steeringtech": steeringtech,
    "milage": milage,
    "frame": frame,
    "imageurl": imageurl,
    "trucknumber": trucknumber,
    "price": price,
    "status": status,
    "taken": taken,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
  };
}

///
/// get all drivers
///
///get all drivers
///
List<driversfrom> driversFromJson(String stre) {
  var tagObjsJson = jsonDecode(stre)['users'] as List;
  return List<driversfrom>.from(tagObjsJson.map((x) => driversfrom.fromJson(x)));
}

class driversfrom {
  driversfrom({
    required this.firstname,
    required this.lastname,
    required this.phone,
    required this.email,
    required this.address,
    required this.dob,
    required this.driverlicencenumber,
    required this.yearsofexperience,
    required this.nextofkinname,
    required this.nextofkinaddress,
    required this.guarantorname,
    required this.guarantoraddress,
    required this.guarantorphone,
    required this.guarantorpassporturl,
    required this.passporturl,
    required this.trucknumber,
    required this.usertype,
    required this.password,
    required this.status,
    required this.createdAt,
    required this.updatedAt,

  });

  String firstname;
  String lastname;
  String phone;
  String email;
  String address;
  String dob;
  String driverlicencenumber;
  String yearsofexperience;
  String nextofkinname;
  String nextofkinaddress;
  String guarantorname;
  String guarantoraddress;
  String guarantorphone;
  String guarantorpassporturl;
  String passporturl;
  String trucknumber;
  String usertype;
  String password;
  String status;
  String createdAt;
  String updatedAt;


  factory driversfrom.fromJson(Map<String, dynamic> json) => driversfrom(
    firstname: json["firstname"].toString(),
    lastname: json["lastname"].toString(),
    phone: json["phone"].toString(),
    email: json["email"].toString(),
    address: json["address"].toString(),
    dob: json["dob"].toString(),
    driverlicencenumber: json["driverlicencenumber"].toString(),
    yearsofexperience: json["yearsofexperience"].toString(),
    nextofkinname: json["nextofkinname"].toString(),
    nextofkinaddress: json["nextofkinaddress"].toString(),
    guarantorname: json["guarantorname"].toString(),
    guarantoraddress: json["guarantoraddress"].toString(),
    guarantorphone: json["guarantorphone"].toString(),
    guarantorpassporturl: json["guarantorpassporturl"].toString(),
    passporturl: json["passporturl"].toString(),
    trucknumber: json["trucknumber"].toString(),
    usertype: json["usertype"].toString(),
    password: json["password"].toString(),
    status: json["status"].toString(),
    createdAt: json["createdAt"].toString(),
    updatedAt: json["updatedAt"].toString(),
  );

  Map<String, dynamic> toJson() => {
    "firstname":firstname,
    "lastname":lastname,
    "phone":phone,
    "email":email,
    "address":address,
    "dob":dob,
    "driverlicencenumber":driverlicencenumber,
    "yearsofexperience":yearsofexperience,
    "nextofkinname":nextofkinname,
    "nextofkinaddress":nextofkinaddress,
    "guarantorname":guarantorname,
    "guarantoraddress":guarantoraddress,
    "guarantorphone":guarantorphone,
    "guarantorpassporturl":guarantorpassporturl,
    "passporturl":passporturl,
    "trucknumber":trucknumber,
    "usertype":usertype,
    "password":password,
    "status":status,
    "createdAt":createdAt,
    "updatedAt":updatedAt,
  };
}