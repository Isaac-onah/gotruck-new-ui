import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const MainHeading = TextStyle(fontWeight: FontWeight.bold, fontSize: 30);

const SubHeading = TextStyle(fontWeight: FontWeight.bold, fontSize: 20, );

const BasicHeading = TextStyle(fontSize: 15);

class Utils {
  static formatPrice(double price) => '\N ${price.toStringAsFixed(2)}';

  static formatDate(DateTime date) => DateFormat.yMd().format(date);
}