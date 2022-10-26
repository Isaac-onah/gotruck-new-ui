import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shimmer/shimmer.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../constants/color_constant.dart';
import '../../constants/constants.dart';


class Skeleton extends StatelessWidget {
  const Skeleton({Key? key, this.height, this.width}) : super(key: key);

  final double? height, width;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.black54,
      highlightColor: Colors.black,
      child: Container(
        height: height,
        width: width,
        padding: const EdgeInsets.all(defaultPadding / 2),
        decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.04),
            borderRadius:
            const BorderRadius.all(Radius.circular(defaultPadding))),
      ),
      period: Duration(milliseconds: 2000),
    );
  }
}

class CircleSkeleton extends StatelessWidget {
  const CircleSkeleton({Key? key, this.size = 24}) : super(key: key);

  final double? size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withOpacity(0.04),
        shape: BoxShape.circle,
      ),
    );
  }
}


class SpecificsCard extends StatelessWidget {

  final String name;
  final String name2;
  String imageurl;

  SpecificsCard({ required this.name, required this.name2, required this.imageurl});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        elevation: 0,
        child: Container(
            decoration: BoxDecoration(
                color: kPrimaryLightColor.withOpacity(0.2) ,
                borderRadius: BorderRadius.all(Radius.circular(5))),
            padding: EdgeInsets.all(0),
            child: Container(
              child: Row(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height*0.07,
                    width: MediaQuery.of(context).size.width*0.12,
                    decoration: const BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: Padding(
                      padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.03,),
                      child: SvgPicture.asset('assets/$imageurl', color: Colors.white,),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width*0.03,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 12,
                              fontWeight: FontWeight.normal)),
                      ),
                      Text(
                        name2, style: TextStyle(
                          color: Colors.black87,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            )
        ),
      ),
    );
  }
}

class SpecificsAmount extends StatelessWidget {

  final String name;
  final String name2;

  SpecificsAmount({ required this.name, required this.name2});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        elevation: 3,
        child: Container(
            decoration: BoxDecoration(
                color: kPrimaryLightColor.withOpacity(0.2),
                borderRadius: BorderRadius.all(Radius.circular(5))),
            padding: EdgeInsets.all(0),
            child: Container(
              child: Row(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.width*0.12,
                    width: MediaQuery.of(context).size.width*0.12,
                    decoration: BoxDecoration(
                        color:mTitleColor,
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: Padding(
                      padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.02,),
                      child:SvgPicture.asset('assets/nija.svg', color: Colors.white,),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width*0.03,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 12,
                              fontWeight: FontWeight.normal)),
                      ),
                      Text(
                        name2, style:  TextStyle(
                          color: Colors.black87,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            )
        ),
      ),
    );
  }
}
class FundedAmount extends StatelessWidget {

  final String name;
  final String name2;
  final String name3;
  final String name4;

  FundedAmount({ required this.name, required this.name2, required this.name3, required this.name4});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        elevation: 3,
        child: Container(
            decoration: BoxDecoration(
                color: Colors.green.shade50,
                borderRadius: BorderRadius.all(Radius.circular(5))),
            padding: EdgeInsets.all(0),
            child: Container(
              child: Padding(
                padding:EdgeInsets.all(MediaQuery.of(context).size.width*0.02),
                child: Center(
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            name,style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  color: Colors.grey.shade600,
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal)),
                          ),
                          Text(
                            name2, style:  TextStyle(
                              color: Colors.black87,
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                          ),
                          Text(
                            name3,style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  color: Colors.grey.shade600,
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal)),
                          ),
                          Text(
                            name4, style:  TextStyle(
                              color: Colors.black87,
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
        ),
      ),
    );
  }
}