import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class SpecificsCard extends StatelessWidget {

  final String name;
  final String name2;
  String imageurl;

  SpecificsCard({ required this.name, required this.name2, required this.imageurl});

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
            child: Row(
              children: [
                Container(
                  height: MediaQuery.of(context).size.width*0.12,
                  width: MediaQuery.of(context).size.width*0.12,
                  decoration: BoxDecoration(
                      color: Color(0xFF0FA958),
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  child: Padding(
                    padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.02,),
                    child: Image.asset('asset/$imageurl'),
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

class SpecificsCard2 extends StatelessWidget {

  final String name;
  final String name2;
  final String imageurl;

  SpecificsCard2({ required this.name, required this.name2, required this.imageurl});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        elevation: 0,
        child: Container(
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
                color: Colors.green.shade50,
                borderRadius: BorderRadius.all(Radius.circular(5))),
            child: Container(
              height: 80,
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color(0xFF0FA958),
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('asset/$imageurl', width: MediaQuery.of(context).size.width*0.07,),
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Text(
                                  name, style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      color: Colors.black87,
                                      fontSize: 11,
                                      fontWeight: FontWeight.normal)), textAlign: TextAlign.center,softWrap: true,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 6,
                    child: Column( 
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            name2, style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold)), textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
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
                color: Colors.green.shade50,
                borderRadius: BorderRadius.all(Radius.circular(5))),
            padding: EdgeInsets.all(0),
            child: Container(
              child: Row(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.width*0.12,
                    width: MediaQuery.of(context).size.width*0.12,
                    decoration: BoxDecoration(
                        color: Color(0xFF0FA958),
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: Padding(
                      padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.02,),
                      child: Icon(Icons.monetization_on),
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