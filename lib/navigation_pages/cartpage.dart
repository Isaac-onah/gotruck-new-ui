import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newtruck/components/default_button.dart';
import 'package:newtruck/constants/constants.dart';
import 'package:newtruck/models/invoice.dart';
import 'package:newtruck/navigation_pages/components/custom_app_bar.dart';
import 'package:newtruck/navigation_pages/components/pdf_invoice_api.dart';
import '../api/pdf_api.dart';
import '../models/cart_controller.dart';
import '../size_config.dart';
import 'components/cart_card.dart';
import 'package:http/http.dart' as http;

class CartScreen extends StatefulWidget {
  static String routeName = "/cart";

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  GlobalKey<FormState> _key = new GlobalKey<FormState>();
  final CartController controller = Get.find();

  late String email, phone, nameperson;
  bool _validate = false;
  void submitComplaint(double total) async {
    try {
      // String customername = nameperson;
      // String customeremail = email;
      // String phones = phone;

      var headers = {
        'Accept': 'application/json',
        'accesstoken': 'aN5SUYufn6kU0rH1',
        'Content-Type': 'application/json'
      };
      var request = http.Request(
          'POST', Uri.parse('http://147.182.130.110:6001/truck/mobilebuy'));
print(controller.products);
      request.body = json.encode({
        "ids": controller.products.entries.map((item) {
          return [
            item.key.id
          ];
        }).toList(),
        "name": "customername",
        "phonenumber": "phones",
        "email": "customeremail"
      });
      request.headers.addAll(headers);

      http.StreamedResponse streamedresponse = await request.send();
      var response = await http.Response.fromStream(streamedresponse);
      if (response.statusCode == 200) {
        showDialog(
            context: context,
            builder: (context) => CustomDialog(
              title: 'Successful!',
              description: 'An Invoice Has been sent to you Email', onPressed: () {
              generateInvoice(total);
              Navigator.of(context, rootNavigator: true).pop('dialog');
            },));
      } else {
        print(response.reasonPhrase);
        showDialog(
            context: context,
            builder: (context) => CustomDialog(
              title: 'Failed!', description: 'Failed to send Invoice',onPressed: () {
              Navigator.of(context, rootNavigator: true).pop('dialog');
            },));
      }
    } on Exception catch (e) {
      print(e);
      showDialog(
          context: context,
          builder: (context) => CustomDialog(
            title: 'Status',
            description:
            "An error occurred while Submitting Invoice, Please check network connection or Invoice service might be down please bear with us",onPressed: () {
            Navigator.of(context, rootNavigator: true).pop('dialog');
          },
          ));
    }
  }

  generateInvoice(double total) async {
    final date = DateTime.now();
    final dueDate = date.add(const Duration(days: 7));
    String customername = nameperson;
    String customeremail = email;
    String phones = phone;

    final invoice = Invoice(
        supplier: const Supplier(
          name: 'Go-Truck',
          phone: "+2348038199515",
          address: '3 Nicole Balogun Street, Igbo Efon, Lekki Lago.',
          paymentInfo: '1024347328',
        ),
        customer: Customer(
            name: customername, email: customeremail, phone: phones),
        info: InvoiceInfo(
          date: date,
          dueDate: dueDate,
          description: 'My description.',
          number: '${DateTime.now().millisecondsSinceEpoch}',

        ),
        items: controller.products.entries.map<InvoiceItem>((item)=>InvoiceItem(
              imageurl: "${item.key.imageurl}",
              description: "${item.key.model}",
              quantity: "${item.value}",
              date: DateTime.now(),
              unitPrice: item.key.price.toDouble()
          )).toList(),

        total: total
    );
    print(invoice.items[0].unitPrice);
    final pdfFile = await PdfInvoiceApi.generate(invoice);

    PdfApi.openFile(pdfFile);
  }

  Widget BottomSheetExample(totalScore) {
    return Container(
      color: const Color(0xff757575),
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: const Radius.circular(20.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: TextFormField(
                    cursorColor: kPrimaryColor,
                    style: const TextStyle(
                        color: Colors.black87, fontFamily: 'SFUIDisplay'),
                    decoration: InputDecoration(
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(
                          color:kPrimaryColor,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(
                            width: 1,
                            style: BorderStyle.solid,
                            color: kPrimaryColor),
                      ),
                      fillColor: Colors.grey.shade200,
                      filled: true,
                      labelText: 'Full name',
                      prefixIcon: const Icon(
                        Icons.account_circle,
                        color: kPrimaryColor,
                      ),
                      labelStyle: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                          color: kPrimaryColor,
                          fontWeight: FontWeight.normal,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    onSaved: (String? val) {
                      nameperson = val!;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: TextFormField(
                    cursorColor: kPrimaryColor,
                    style: const TextStyle(
                        color: Colors.black87, fontFamily: 'SFUIDisplay'),
                    decoration: InputDecoration(
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(
                          color: kPrimaryColor,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(
                            width: 1,
                            style: BorderStyle.solid,
                            color: kPrimaryColor),
                      ),
                      fillColor: Colors.grey.shade200,
                      filled: true,
                      labelText: 'Email Address',
                      prefixIcon: const Icon(
                        Icons.mail,
                        color: kPrimaryColor,
                      ),
                      labelStyle: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                          color: kPrimaryColor,
                          fontWeight: FontWeight.normal,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    onSaved: (String? val) {
                      email = val!;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: TextFormField(
                    cursorColor: kPrimaryColor,
                    style: const TextStyle(
                        color: Colors.black87, fontFamily: 'SFUIDisplay'),
                    decoration: InputDecoration(
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: const BorderRadius.all(const Radius.circular(10.0)),
                        borderSide: BorderSide(
                          color: kPrimaryColor,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(
                            width: 1,
                            style: BorderStyle.solid,
                            color: kPrimaryColor),
                      ),
                      fillColor: Colors.grey.shade200,
                      filled: true,
                      labelText: 'Phone Number',
                      prefixIcon: const Icon(
                        Icons.call,
                        color: kPrimaryColor,
                      ),
                      labelStyle: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                          color: kPrimaryColor,
                          fontWeight: FontWeight.normal,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    onSaved: (String? val) {
                      phone = val!;
                    },
                  ),
                ),
              ],
            ),
            FlatButton(
              child: const Text(
                'Generate Invoice',
                style: const TextStyle(color: Colors.white),
              ),
              color: kPrimaryColor,
              onPressed: () {


                if (_key.currentState!.validate()) {
                  // No any error in validation
                  _key.currentState!.save();
                  generateInvoice(double.parse(controller.total));
                  // submitComplaint(double.parse(controller.total));

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
    SizeConfig().init(context);
    return Obx(()=>Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppBar().preferredSize.height),
        child: shortCustomAppBar(),
      ),
      body: Padding(
        padding:
        EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child:
        ListView.builder(
          itemCount: controller.products.length ?? 1,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Dismissible(
              key: UniqueKey(),
              direction: DismissDirection.endToStart,
              onDismissed: (direction) {
                setState(() {
                  controller.removeProduct(controller.products.keys.toList()[index]);
                });
              },
              background: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: kPrimaryLightColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Spacer(),
                    SvgPicture.asset("assets/Trash.svg"),
                  ],
                ),
              ),
              child: CartCard(controller: controller, product: controller.products.keys.toList()[index],quantity: controller.products.values.toList()[index],index: index,),
            ),
          ),
        )
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(
          vertical: getProportionateScreenWidth(15),
          horizontal: getProportionateScreenWidth(30),
        ),
        // height: 174,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, -15),
              blurRadius: 20,
              color: const Color(0xFFDADADA).withOpacity(0.15),
            )
          ],
        ),
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                height: getProportionateScreenWidth(40),
                width: getProportionateScreenWidth(40),
                decoration: BoxDecoration(
                  color: const Color(0xFFF5F6F9),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: SvgPicture.asset("assets/receipt.svg"),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Row(
                        children: [
                          const Text("Total:"
                          ),
                          SizedBox(width: getProportionateScreenHeight(20)),
                          Text(
                            "${controller.total}",
                            style: const TextStyle(fontSize: 16, color: Colors.black),)
                        ],
                      ),
                      const SizedBox(width: 10),
                      const Icon(
                        Icons.arrow_forward_ios,
                        size: 12,
                        color: kTextColor,
                      )
                    ],
                  ),
                  SizedBox(height: getProportionateScreenHeight(20)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: getProportionateScreenWidth(150),
                        child: DefaultButton(
                          text: "Check Out",
                          press: () {
                            if (controller.products.length != 0) {
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
                                      child: BottomSheetExample(double.parse(controller.total)),
                                    ),
                                  ),
                                ),
                              );
                            } else {
                              showDialog(
                                  context: context,
                                  builder: (context) => CustomDialog(
                                    title: 'Empty Cart!',
                                    description: 'No Truck selected',onPressed: () {
                                    Navigator.of(context, rootNavigator: true).pop('dialog');
                                  },));
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ));
  }

  AppBar buildAppBar(BuildContext context) {
    SizeConfig().init(context);
    return AppBar(
      backgroundColor: kPrimaryColor,
      foregroundColor: Colors.white,
      title: Column(
        children: [
          const Text(
            "Your Cart",
            style: const TextStyle(color: Colors.white),
          ),
          Text(
            "${controller.products.length} items",
            style: const TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
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
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.only(top: 16),
          decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(17),
              boxShadow: [
                const BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10.0,
                    offset: const Offset(0.0, 10.0))
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
              const SizedBox(
                height: 16.0,
              ),
              Text(
                description,
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                    fontSize: 15,
                  ),
                ),
              ),
              const SizedBox(
                height: 24.0,
              ),
              Align(
                  alignment: Alignment.bottomRight,
                  child: MaterialButton(
                      onPressed: onPressed,
                      color: const Color(0xff0095FF),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          "Close",
                          style: GoogleFonts.pacifico(
                            textStyle: const TextStyle(
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