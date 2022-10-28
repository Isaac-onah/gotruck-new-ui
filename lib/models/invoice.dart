

import 'package:flutter/material.dart';

class Invoice {
  final InvoiceInfo info;
  final Supplier supplier;
  final Customer customer;
  final double total;
  final List<InvoiceItem> items;

  const Invoice({
    required this.info,
    required this.supplier,
    required this.customer,
    required this.total,
    required this.items,
  });
}

class InvoiceInfo {
  final String description;
  final String number;
  final DateTime date;
  final DateTime dueDate;

  const InvoiceInfo({
    required this.description,
    required this.number,
    required this.date,
    required this.dueDate,
  });
}

class InvoiceItem {
  final String imageurl;
  final String description;
  final String quantity;
  final DateTime date;
  final double unitPrice;

  const InvoiceItem({
    required this.imageurl,
    required this.description,
    required this.quantity,
    required this.date,
    required this.unitPrice,
  });
}
class Supplier {
  final String name;
  final String phone;
  final String address;
  final String paymentInfo;

  const Supplier({
    required this.name,
    required this.phone,
    required this.address,
    required this.paymentInfo,
  });
}
class Customer {
  final String name;
  final String phone;
  final String email;
  final String address;

  const Customer({
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
  });
}
class Total {
  final String total;

  const Total({
    required this.total,
  });
}

class Logo {
  final Image info;

  const Logo({
    required this.info,
  });
}