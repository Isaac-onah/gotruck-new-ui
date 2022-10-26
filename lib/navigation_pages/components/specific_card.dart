import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:newtruck/constants/constants.dart';

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
                color:primaryColor,
                borderRadius: BorderRadius.all(Radius.circular(5))),
            padding: EdgeInsets.all(0),
            child: Container(
              child: Padding(
                padding:EdgeInsets.all(MediaQuery.of(context).size.width*0.02),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        name,style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Colors.white70,
                              fontSize: 12,
                              fontWeight: FontWeight.normal)),
                      ),
                      Text(
                        name2, style:  TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                      ),
                      Text(
                        name3,style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Colors.white70,
                              fontSize: 12,
                              fontWeight: FontWeight.normal)),
                      ),
                      Text(
                        name4, style:  TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
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