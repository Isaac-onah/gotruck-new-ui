import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newtruck/dashboard_screen.dart';
import 'package:newtruck/models/apis.dart';
import 'package:newtruck/models/cart_controller.dart';
import 'package:newtruck/navigation_pages/components/custom_app_bar.dart';
import 'package:newtruck/navigation_pages/details_screen.dart';
import '../constants/constants.dart';
import 'package:http/http.dart' as http;

class garageScreen extends StatefulWidget {

  @override
  State<garageScreen> createState() => _garageScreenState();
}

class _garageScreenState extends State<garageScreen> {

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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F6F9),
      body: ListView(
        children: [
          SizedBox(
            height: 10,
          ),
          CustomAppBarshort(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child:Text( "Go-Garage!",
              style: GoogleFonts.poppins(
                color: Colors.black87,
                fontSize: 20.0,
                fontWeight: FontWeight.normal,),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child:Text( "Available trucks ready for you",
              style: GoogleFonts.poppins(
                color: Colors.black87,
                fontSize: 14.0,
                fontWeight: FontWeight.normal,),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          _loading
              ? GridView.builder(
            physics: ScrollPhysics(),
            shrinkWrap: true,
            itemCount: 6,
            itemBuilder: (context, index) => const NewsCardSkelton(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: MediaQuery.of(context).size.width /
                  (MediaQuery.of(context).size.height / 1.6),
            ),
          )
              :GridView.builder(
            physics: ScrollPhysics(),
            shrinkWrap: true,
            itemCount:
            null == filterUsers ? 0 : filterUsers.length,
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
                              aspectRatio: 1.02,
                              child: Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: kSecondaryColor.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Hero(
                                  tag: "${usar.brand}".toUpperCase(),
                                  child: Image.network("http://147.182.130.110:6001/uploads/${usar.imageurl}"),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical:8.0),
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
                                  "${usar.price}",
                                  style: TextStyle(
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
            gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: MediaQuery.of(context)
                  .size
                  .width /
                  (MediaQuery.of(context).size.height / 1.5),
            ),
          ),
        ],
      ),
    );
  }
}

class ProductDetailsArguments {

}
