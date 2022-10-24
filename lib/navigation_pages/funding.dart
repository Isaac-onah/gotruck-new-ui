import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:newtruck/models/apis.dart';
import 'package:newtruck/models/invoice.dart';
import 'package:newtruck/navigation_pages/all_car_details.dart';
import 'package:newtruck/navigation_pages/components/pdf_api.dart';
import 'package:newtruck/navigation_pages/components/pdf_invoice_api.dart';

import 'components/specific_card.dart';

class truckFund extends StatefulWidget {
  @override
  State<truckFund> createState() => _truckFundState();
}

class _truckFundState extends State<truckFund> {
  GlobalKey<FormState> _key = new GlobalKey<FormState>();
  final formatCurrency =
  NumberFormat.simpleCurrency(locale: Platform.localeName, name: 'NGN');
  late List<trucksfrom> _users;
  List<trucksfrom> filterUsers = [];
  late bool _loading;
  late String email, Amount, nameperson;
  bool _validate = false;

  @override
  void initState() {
    super.initState();
    _loading = false;
    getAllTrucks();
  }
  generateInvoice() async {
    final date = DateTime.now();
    final dueDate = date.add(Duration(days: 7));
    String customername = nameperson;
    String customeremail = email;
    String aMOUNT = Amount;

    final invoice = Invoice(
        supplier: Supplier(
          name: 'Go-Truck',
          phone: "+2348038199515",
          address: '3 Nicole Balogun Street, Igbo Efon, Lekki Lagos.',
          paymentInfo: '1024347328',
        ),
        customer: Customer(
            name: customername, email: customeremail, phone: aMOUNT),
        info: InvoiceInfo(
          date: date,
          dueDate: dueDate,
          description: 'My description.',
          number: '${DateTime.now().millisecondsSinceEpoch}',

        ),
        items: [InvoiceItem(
          imageurl: _users[1].imageurl,
            description: '${_users[1].brand} ${_users[1].model}',
            quantity: "lool",
            date: DateTime.now(),
            unitPrice: double.parse(aMOUNT)
        )], total: 00

    );
    print(invoice.items[0].unitPrice);
    final pdfFile = await PdfInvoiceApi.generate(invoice);

    PdfApi.openFile(pdfFile);
  }
  void getAllTrucks() async {
    setState(() {
      _loading = true;
    });
    print("email");
    var headers = {
      'Accept': 'application/json',
      'accesstoken': 'aN5SUYufn6kU0rH1',
      'Content-Type': 'application/json'
    };
    var request = http.Request(
        'GET', Uri.parse('http://147.182.130.110:6001/truck/mobilegettruck'));
    request.body = '''''';
    request.headers.addAll(headers);
    http.StreamedResponse streamedresponse = await request.send();
    var response = await http.Response.fromStream(streamedresponse);
    late String emailStats;
    late List<trucksfrom> customertruck;



    if (response.statusCode == 200) {
      customertruck = trucksFromJson(response.body);
      setState(() {
        _users = customertruck;
        filterUsers = _users;
        _loading = false;
        print(filterUsers[0].imageurl);
      });
      trucksfrom user = filterUsers[0];
    } else {
      emailStats = emailStatusFromJson(response.body);
      setState(() {
        _loading = false;
      });
    }
  }
  submitComplaint() async {
    showDialog(
        context: context,
        builder: (context) => CustomDialog(
          title: 'Successful!',
          description: 'Form successfully submitted',
          onPressed: () {
            generateInvoice();
            Navigator.of(context, rootNavigator: true).pop('dialog');
          },));
  }
  Widget BottomSheetExample() {
    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: TextFormField(
                    cursorColor: Color(0xFF0FA958),
                    style: TextStyle(
                        color: Colors.black87, fontFamily: 'SFUIDisplay'),
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(
                          color: Colors.lightGreen,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                            width: 1,
                            style: BorderStyle.solid,
                            color: Color(0xFF0FA958)),
                      ),
                      fillColor: Colors.grey.shade200,
                      filled: true,
                      labelText: 'Full name',
                      prefixIcon: Icon(
                        Icons.account_circle,
                        color: Color(0xFF0FA958),
                      ),
                      labelStyle: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          color: Color(0xFF0FA958),
                          fontWeight: FontWeight.normal,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    validator: validateDetails,
                    onSaved: (String? val) {
                      nameperson = val!;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: TextFormField(
                    cursorColor: Color(0xFF0FA958),
                    style: TextStyle(
                        color: Colors.black87, fontFamily: 'SFUIDisplay'),
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(
                          color: Colors.lightGreen,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                            width: 1,
                            style: BorderStyle.solid,
                            color: Color(0xFF0FA958)),
                      ),
                      fillColor: Colors.grey.shade200,
                      filled: true,
                      labelText: 'Email Address',
                      prefixIcon: Icon(
                        Icons.mail,
                        color: Color(0xFF0FA958),
                      ),
                      labelStyle: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          color: Color(0xFF0FA958),
                          fontWeight: FontWeight.normal,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    validator: validateDetails,
                    onSaved: (String? val) {
                      email = val!;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: TextFormField(
                    cursorColor: Color(0xFF0FA958),
                    keyboardType: TextInputType.number,
                    style: TextStyle(
                        color: Colors.black87, fontFamily: 'SFUIDisplay'),
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(
                          color: Colors.lightGreen,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                            width: 1,
                            style: BorderStyle.solid,
                            color: Color(0xFF0FA958)),
                      ),
                      fillColor: Colors.grey.shade200,
                      filled: true,
                      labelText: 'Amount',
                      prefixIcon: Icon(
                        Icons.monetization_on,
                        color: Color(0xFF0FA958),
                      ),
                      labelStyle: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          color: Color(0xFF0FA958),
                          fontWeight: FontWeight.normal,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    validator: validateDetails,
                    onSaved: (String? val) {
                      Amount = val!;
                    },
                  ),
                ),
              ],
            ),
            FlatButton(
              child: Text(
                'Submit',
                style: TextStyle(color: Colors.white),
              ),
              color: Color(0xFF0FA958),
              onPressed: () {


                if (_key.currentState!.validate()) {
                  // No any error in validation
                  _key.currentState!.save();
                  submitComplaint();

                } else {
                  // validation error
                  setState(() {
                    _validate = true;
                  });
                }
              },
            ),
          ],
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Color(0xFF0FA958),
        title: Center(child: Text("Go-Funding")),
      ),
      body: Padding(
          padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.01),
          child: _loading
              ? Align(
            alignment: Alignment.center,
            child: Container(
              height: MediaQuery.of(context).size.width * 0.01,
              width: MediaQuery.of(context).size.width * 0.01,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('asset/yui.png'),
                    fit: BoxFit.fill,
                  )),
            ),
          )
              : ListView.builder(
            itemCount: null == filterUsers ? 0 : filterUsers.length,
            itemBuilder: (context, index) {
              trucksfrom usar = filterUsers[index];
              return Padding(
                padding: EdgeInsets.all(
                    MediaQuery.of(context).size.width * 0.01),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (ctx) => allCarDetail(
                          year: usar.year,
                          brand: usar.brand,
                          model: usar.model,
                          drivingtype: usar.drivingtype,
                          fueltank: usar.fueltank,
                          tire: usar.tire,
                          bodytype: usar.bodytype,
                          color: usar.color,
                          enginetype: usar.enginetype,
                          tonnage: usar.tonnage,
                          wheelbase: usar.wheelbase,
                          maxspeed: usar.maxspeed,
                          maxtorque: usar.maxtorque,
                          clutch: usar.clutch,
                          transmissionmodel: usar.transmissionmodel,
                          rearaxle: usar.rearaxle,
                          steeringtech: usar.steeringtech,
                          milage: usar.milage,
                          price: usar.price.toString(),
                          imageurl:
                          "http://147.182.130.110:6001/uploads/${usar.imageurl}",
                          trucknumber: usar.trucknumber,
                        )));
                  },
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          height:
                          MediaQuery.of(context).size.height * 0.25,
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                horizontal:
                                MediaQuery.of(context).size.width *
                                    0.02,
                                vertical:
                                MediaQuery.of(context).size.width *
                                    0.02),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black12,
                                      spreadRadius: 0.5,
                                      blurRadius: 15)
                                ]),
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.end,
                              children: [
                                Padding(
                                  padding:EdgeInsets.only(left: MediaQuery.of(context).size.width *
                                      0.03, right: MediaQuery.of(context).size.width *
                                      0.03, top: MediaQuery.of(context).size.width *
                                      0.03),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          usar.imageurl == "null"
                                              ? Image.asset("asset/cover.png")
                                              : Image.network(
                                              "http://147.182.130.110:6001/uploads/${usar.imageurl}",
                                              width:
                                              MediaQuery.of(context)
                                                  .size
                                                  .width *
                                                  0.43,
                                              height:
                                              MediaQuery.of(context)
                                                  .size
                                                  .width *
                                                  0.23),
                                          Column(
                                            children: [
                                              Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                    0.35,
                                                child: Row(
                                                  children: [
                                                    FundedAmount(
                                                      name: 'Funded Amount',
                                                      name2:
                                                      '${usar.price == 'null' ? 'n/a' : formatCurrency.format(345000)}',
                                                      name3: 'ROI/m',
                                                      name4:
                                                      '30%',
                                                    ),
                                                  ],
                                                ),
                                              ),

                                            ],
                                          ),
                                        ],
                                      ),

                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:  EdgeInsets.symmetric(horizontal:  MediaQuery.of(context).size.width *
                                      0.03),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.end,
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            "${usar.year}"
                                                .toUpperCase(),
                                            style: GoogleFonts
                                                .montserrat(
                                              fontSize: 13,
                                              fontWeight:
                                              FontWeight.w500,
                                              color: Colors.black38,
                                            ),
                                          ),
                                          Text(
                                            "${usar.brand}".toUpperCase(),
                                            style: GoogleFonts
                                                .montserrat(
                                                fontSize: 13,
                                                fontWeight:
                                                FontWeight
                                                    .w500), overflow: TextOverflow.clip,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(horizontal:
                                      MediaQuery.of(context).size.width *
                                          0.03),
                                      child: Text(
                                          '${usar.price == 'null' ? 'n/a' : formatCurrency.format(double.parse((usar.price).toString()))}',
                                          style: TextStyle(
                                              color: Colors.black87,
                                              fontSize: 14,
                                              fontWeight:
                                              FontWeight.bold)),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        showModalBottomSheet(
                                          context: context,
                                          isScrollControlled: true,
                                          builder: (context) => SingleChildScrollView(
                                            child: Container(
                                              padding: EdgeInsets.only(
                                                  bottom: MediaQuery.of(context)
                                                      .viewInsets
                                                      .bottom),
                                              child: new Form(
                                                key: _key,
                                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                                child: BottomSheetExample(),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                                        child: Text(
                                          "Show Interest",
                                          style: GoogleFonts.montserrat(
                                              fontWeight:
                                              FontWeight.w400,
                                              fontSize: 13),
                                        ),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        primary: Color(0xFF0FA958),
                                        elevation: 0,
                                        shape:
                                        new RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.only(
                                              topLeft: Radius
                                                  .circular(20),
                                              bottomLeft:
                                              Radius.circular(
                                                  20)),
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          )),
    );
  }
  String? validateDetails(String? value) {
    if (value!.length == 0) {
      return "Value is Required";
    }
    return null;
  }
}
class CustomDialog extends StatelessWidget {
  final String title, description;
  final VoidCallback onPressed;

  CustomDialog({required this.title, required this.description, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  dialogContent(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(16),
          margin: EdgeInsets.only(top: 16),
          decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(17),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10.0,
                    offset: Offset(0.0, 10.0))
              ]),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                title,
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    color: title == 'Successful!' ? Colors.green : Colors.red,
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(
                height: 16.0,
              ),
              Text(
                description,
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                    fontSize: 15,
                  ),
                ),
              ),
              SizedBox(
                height: 24.0,
              ),
              Align(
                  alignment: Alignment.bottomRight,
                  child: MaterialButton(
                      onPressed: onPressed,
                      color: Color(0xff0095FF),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          "Get Invoice",
                          style: GoogleFonts.pacifico(
                            textStyle: TextStyle(
                                color: Colors.white, letterSpacing: .5),
                          ),
                        ),
                      )))
            ],
          ),
        ),
      ],
    );
  }
}
