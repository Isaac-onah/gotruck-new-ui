import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newtruck/constants/constants.dart';
import 'package:newtruck/models/apis.dart';
import 'package:smooth_star_rating_nsafe/smooth_star_rating.dart';
import 'components/custom_app_bar.dart';
import 'package:http/http.dart' as http;

class Buying extends StatefulWidget {
  @override
  State<Buying> createState() => _BuyingState();
}

class _BuyingState extends State<Buying> {
  late List<driversfrom> _users;

  List<driversfrom> filterUsers = [];

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
      'Content-Type': 'application/json'    };
    var request = http.Request('GET', Uri.parse('http://147.182.130.110:5050/user/mobilegetallusers'));
    request.body = '''''';
    request.headers.addAll(headers);
    http.StreamedResponse streamedresponse = await request.send();
    var response = await http.Response.fromStream(streamedresponse);
    late String emailStats;
    late List<driversfrom> alldriver;

    if (response.statusCode == 200) {
      alldriver = driversFromJson(response.body);
      setState(() {
        _users = alldriver;
        filterUsers = _users;
        _loading = false;
        print (filterUsers[0].passporturl);
      });
      driversfrom user = filterUsers[0];
    } else {
      emailStats = emailStatusFromJson(response.body);
      setState(() {
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var rating = 3.1;
    return Scaffold(
      backgroundColor: Color(0xfff6f7f9),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppBar().preferredSize.height),
        child: shortCustomppBar(),
      ),
      body: ListView.builder(
        itemCount: null == filterUsers ? 0 : filterUsers.length,
        itemBuilder: (context, index) {
          driversfrom usar = filterUsers[index];
          return GestureDetector(
            onTap: () {
              // This Will Call When User Click On ListView Item
              showDialogdrivesFunc(
                  context, "http://147.182.130.110:5050/uploads/${usar.passporturl}", usar.firstname, usar.firstname, usar.phone, usar.yearsofexperience, usar.trucknumber,rating);
            },
            // Card Which Holds Layout Of ListView Item
            child: Container(
              margin:
              EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(13),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.shade200,
                      blurRadius: 10,
                      spreadRadius: 3,
                      offset: Offset(3, 4))
                ],
              ),
              child: ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 5),
                title: Row(
                  children: [
                    Text(
                      usar.firstname +" ",
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Colors.black87,
                              fontSize: 15,
                              fontWeight: FontWeight.w600)),
                    ),
                    Text( usar.lastname,
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Colors.black87,
                              fontSize: 15,
                              fontWeight: FontWeight.w600)),
                    ),
                  ],
                ),
                subtitle: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Phone: ",
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600)),
                        ),
                        Text(usar.phone,
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal)),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Years of Experience: ",
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600)),
                        ),
                        Text(
                          usar.yearsofexperience,
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal)),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SmoothStarRating(
                          rating: rating,
                          size: 25,
                          starCount: 4,
                          color: kPrimaryColor,
                          onRatingChanged: (value) {
                            setState(() {
                              rating = value;
                            });
                          },
                        ),
                      ],
                    )
                  ],
                ),
                leading: CircleAvatar(
                  radius: 30.0,
                  backgroundImage:NetworkImage("http://147.182.130.110:5050/uploads/${usar.passporturl}"),
                  backgroundColor: Colors.transparent,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
  // This is a block of Model Dialog
  showDialogdrivesFunc(context, img, firstname, lastname, phone, year, trucknum, rating) {
    return showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: Material(
            type: MaterialType.transparency,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              padding: EdgeInsets.all(15),
              height: MediaQuery.of(context).size.height * 0.5,
              width: MediaQuery.of(context).size.width * 0.7,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    radius: 90.0,
                    backgroundImage:NetworkImage(img),
                    backgroundColor: Colors.transparent,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        firstname +" ",
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w600)),
                      ),
                      Text( lastname,
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                color: Colors.black87,
                                fontSize: 20,
                                fontWeight: FontWeight.w600)),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    // width: 200,
                    child: Align(
                      alignment: Alignment.center,
                      child:  Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Phone: ",
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600)),
                              ),
                              Text(
                                phone,
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal)),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Years of Experience: ",
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600)),
                              ),
                              Text(
                                year,
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal)),
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SmoothStarRating(
                                rating: rating,
                                size: 25,
                                starCount: 5,
                                onRatingChanged: (value) {
                                  setState(() {
                                    rating = value;
                                  });
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}