import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:newtruck/constants/constants.dart';
import 'package:newtruck/models/apis.dart';
import 'package:newtruck/models/cart_controller.dart';
import 'package:newtruck/navigation_pages/details_screen.dart';
import '../../../size_config.dart';

class CartCard extends StatelessWidget {
  final CartController controller;
  final trucksfrom product;
  final int quantity;
  final int index;
  CartCard({
    Key? key,
    required this.controller,
    required this.product,
    required this.quantity,
    required this.index,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SizedBox(
              width:60,
              child: AspectRatio(
                aspectRatio: 0.88,
                child: Container(
                  padding: EdgeInsets.all(getProportionateScreenWidth(10)),
                  decoration: BoxDecoration(
                    color: Color(0xFFF5F6F9),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Image.network("http://147.182.130.110:6001/uploads/${product.imageurl}"),
                ),
              ),
            ),
            SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      product.model,
                      style: TextStyle(color: Colors.black, fontSize: 16),
                      maxLines: 2,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      product.brand,
                      style: TextStyle(color: Colors.black, fontSize: 16),
                      maxLines: 2,
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text(product.price.toString(),
                      style: TextStyle(color: Colors.black, fontSize: 16),
                      maxLines: 2,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),

        Row(

          children: [
            IconButton(onPressed: (){
              controller.removeProduct(product);
            }, icon: Icon(Icons.remove_circle)),
            Text("${quantity}"),
            IconButton(onPressed: (){
              controller.addProduct(product);
            }, icon: Icon(Icons.add_circle))
          ],
        ),
      ],
    );
  }
}

