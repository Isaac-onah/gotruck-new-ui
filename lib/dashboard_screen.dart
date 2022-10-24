import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:newtruck/constants/constants.dart';
import 'package:newtruck/constants/style_constant.dart';
import 'package:newtruck/models/apis.dart';
import 'package:newtruck/models/cart_controller.dart';
import 'package:newtruck/my_colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newtruck/navigation_pages/components/shimmer.dart';
import 'package:newtruck/navigation_pages/drivers.dart';
import 'package:newtruck/navigation_pages/funding.dart';
import 'package:newtruck/navigation_pages/lease.dart';
import 'package:newtruck/navigation_pages/market.dart';
import 'navigation_pages/cartpage.dart';
import 'navigation_pages/details_screen.dart';
import 'package:http/http.dart' as http;

class DashboardScreen extends StatefulWidget {
  const DashboardScreen(
      {Key? key, this.width = 140, this.aspectRetio = 1.02, this.product})
      : super(key: key);
  final double width, aspectRetio;
  final product;

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late List<trucksfrom> _users;
  List<trucksfrom> filterUsers = [];
  late bool _loading;

  @override
  void initState() {
    super.initState();
    _loading = false;
    getAllTrucks();
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
    var request = http.Request('GET',
        Uri.parse('http://147.182.130.110:6001/truck/mobilegetsixtruck'));
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

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 18.0, horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CartScreen()));
                    },
                    child: Center(
                      child: Stack(
                        children: [
                          Icon(CommunityMaterialIcons.cart),
                          Container(
                            margin: EdgeInsets.only(left: 10.0),
                            height: 15.0,
                            width: 15.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.0),
                                color: Colors.red,
                                border: Border.all(
                                    color: Colors.white,
                                    style: BorderStyle.solid,
                                    width: 2.0)),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Hello!",
                style: GoogleFonts.poppins(
                  color: Colors.black87,
                  fontSize: 20.0,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Welcome to Gotruck",
                style: GoogleFonts.poppins(
                  color: Colors.black87,
                  fontSize: 20.0,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset("assets/img_banner.jpeg"),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: SizedBox(
                height: 70,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 7),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20)),
                      child: TextButton(
                          style: TextButton.styleFrom(
                            primary: Colors.white,
                            backgroundColor:
                                kPrimaryLightColor.withOpacity(0.2),
                            onSurface: Colors.grey,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(12), // <-- Radius
                            ),
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(30),
                                  child: Container(
                                    color: MyColors.grayBackground,
                                    child: Image.asset(
                                      "assets/truck.png",
                                      height: 30,
                                      width: 30,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Go-Market",
                                      style: mServiceTitleStyle,
                                    ),
                                    Text(
                                      "Affortable Trucks",
                                      style: mServiceSubtitleStyle,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => marketScreen(),
                                ));
                          }),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 7),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20)),
                      child: TextButton(
                          style: TextButton.styleFrom(
                            primary: Colors.white,
                            backgroundColor:
                                kPrimaryLightColor.withOpacity(0.2),
                            onSurface: Colors.grey,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(12), // <-- Radius
                            ),
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(30),
                                  child: Container(
                                    color: MyColors.grayBackground,
                                    child: Image.asset(
                                      "assets/hail.png",
                                      height: 30,
                                      width: 30,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Go-Lease",
                                      style: mServiceTitleStyle,
                                    ),
                                    Text(
                                      "Intercity Rental",
                                      style: mServiceSubtitleStyle,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => leaseScreen(),
                                ));
                          }),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 7),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20)),
                      child: TextButton(
                          style: TextButton.styleFrom(
                            primary: Colors.white,
                            backgroundColor:
                                kPrimaryLightColor.withOpacity(0.2),
                            onSurface: Colors.grey,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(12), // <-- Radius
                            ),
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(30),
                                  child: Container(
                                    color: MyColors.grayBackground,
                                    child: Image.asset(
                                      "assets/drive.png",
                                      height: 30,
                                      width: 30,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Go-Drive",
                                      style: mServiceTitleStyle,
                                    ),
                                    Text(
                                      "Professional Drivers",
                                      style: mServiceSubtitleStyle,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Buying(),
                                ));
                          }),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 7),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20)),
                      child: TextButton(
                          style: TextButton.styleFrom(
                            primary: Colors.white,
                            backgroundColor:
                                kPrimaryLightColor.withOpacity(0.2),
                            onSurface: Colors.grey,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(12), // <-- Radius
                            ),
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(30),
                                  child: Container(
                                    color: MyColors.grayBackground,
                                    child: Image.asset(
                                      "assets/fund.png",
                                      height: 30,
                                      width: 30,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Go-Funding",
                                      style: mServiceTitleStyle,
                                    ),
                                    Text(
                                      "Truck Funding",
                                      style: mServiceSubtitleStyle,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => truckFund(),
                                ));
                          }),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 7),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20)),
                      child: TextButton(
                          style: TextButton.styleFrom(
                            primary: Colors.white,
                            backgroundColor:
                                kPrimaryLightColor.withOpacity(0.2),
                            onSurface: Colors.grey,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(12), // <-- Radius
                            ),
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(30),
                                  child: Container(
                                    color: MyColors.grayBackground,
                                    child: Image.asset(
                                      "assets/llll.png",
                                      height: 30,
                                      width: 30,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Go-Spare",
                                      style: mServiceTitleStyle,
                                    ),
                                    Text(
                                      "Spare Parts",
                                      style: mServiceSubtitleStyle,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          onPressed: () {}),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 7),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20)),
                      child: TextButton(
                          style: TextButton.styleFrom(
                            primary: Colors.white,
                            backgroundColor:
                                kPrimaryLightColor.withOpacity(0.2),
                            onSurface: Colors.grey,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(12), // <-- Radius
                            ),
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(30),
                                  child: Container(
                                    color: MyColors.grayBackground,
                                    child: Image.asset(
                                      "assets/lil.png",
                                      height: 30,
                                      width: 30,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Go-Maintain",
                                      style: mServiceTitleStyle,
                                    ),
                                    Text(
                                      "Truck Maintenance",
                                      style: mServiceSubtitleStyle,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          onPressed: () {

                          }),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: RichText(
                textAlign: TextAlign.start,
                text: const TextSpan(
                    text: "Go Featured",
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold)),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: _loading
                    ? GridView.builder(
                        physics: ScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 4,
                        itemBuilder: (context, index) => const NewsCardSkelton(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: MediaQuery.of(context).size.width /
                              (MediaQuery.of(context).size.height / 1.6),
                        ),
                      )
                    :
                GridView.builder(
                        physics: ScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: null == filterUsers ? 0 : filterUsers.length,
                        itemBuilder: (ctx, i) {
                          trucksfrom usar = filterUsers[i];
                          final cartController = Get.put(CartController());
                          return Container(
                              margin: EdgeInsets.symmetric(horizontal: 15,vertical: 8),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child:Padding(
                                padding: EdgeInsets.all(5),
                                child: SizedBox(
                                  width: 200,
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,MaterialPageRoute(
                                          builder: (context) => allCarDetail(
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
                                            transmissionmodel:
                                            usar.transmissionmodel,
                                            rearaxle: usar.rearaxle,
                                            steeringtech:
                                            usar.steeringtech,
                                            milage: usar.milage,
                                            price: '${usar.price}',
                                            imageurl:
                                            "http://147.182.130.110:6001/uploads/${usar.imageurl}",
                                            trucknumber: usar.trucknumber,

                                          )));
                                    },
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        AspectRatio(
                                          aspectRatio: 1.05,
                                          child: Container(
                                            padding: EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                              color: kSecondaryColor.withOpacity(0.1),
                                              borderRadius: BorderRadius.circular(15),
                                            ),
                                            child: Hero(
                                              tag: "${usar.brand}",
                                              child: Image.network("http://147.182.130.110:6001/uploads/${usar.imageurl}"),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top:8.0),
                                          child: Text(
                                            "${usar.brand}",
                                            style: TextStyle(color: Colors.black),
                                            maxLines: 2,
                                          ),
                                        ),
                                        Text(
                                          usar.model.toUpperCase(),
                                          style: TextStyle(color: Colors.black),
                                          maxLines: 2,
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              usar.price.toString(),
                                              style: const TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w600,
                                                color: kPrimaryColor,
                                              ),
                                            ),
                                            IconButton(
                                                padding: EdgeInsets.all(0),
                                                onPressed: (){
                                                  cartController.addProduct(usar);
                                                },
                                                icon: Icon(CommunityMaterialIcons.cart_plus, color:kPrimaryColor,size: 20,))
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              )
                          );
                        },
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                          childAspectRatio: MediaQuery.of(context).size.width /
                              (MediaQuery.of(context).size.height / 1.6),
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NewsCardSkelton extends StatelessWidget {
  const NewsCardSkelton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: EdgeInsets.all(5),
          child: SizedBox(
            width: 200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AspectRatio(
                  aspectRatio: 1.02,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: kSecondaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Image.asset("assets/shimmer.png", width: 10, scale: 0.5,),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: const Skeleton(width: 80),
                ),
                const Skeleton(width: 80),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Skeleton(width: 20),
                    const Skeleton(width: 20),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
