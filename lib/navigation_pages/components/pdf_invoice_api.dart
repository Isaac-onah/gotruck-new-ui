import 'dart:io';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:newtruck/models/invoice.dart';
import 'package:newtruck/models/utils.dart';
import 'package:newtruck/navigation_pages/components/pdf_api.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/widgets.dart';

class PdfInvoiceApi {



  static Future<File> generate(Invoice invoice) async {
    final pdf = Document();
    final imageJpg = (await rootBundle.load('assets/shimmer.png')).buffer.asUint8List();
    pdf.addPage(MultiPage(
      build: (context) => [
        Center(
          child: ClipRRect(
            horizontalRadius: 40,
            verticalRadius: 40,
            child: Image(
              MemoryImage(imageJpg),
              width: 3 * PdfPageFormat.cm,
              // height:40,
            ),
          ),
        ),
        buildHeader(invoice),
        buildHeaderaccount(invoice),
        SizedBox(height: 1 * PdfPageFormat.cm),
        buildTitle(invoice),
        buildInvoice(invoice),
        Divider(),
        buildTotal(invoice),
        buildPOLICY(invoice),
      ],
    ));

    return PdfApi.saveDocument(name: 'my_invoice.pdf', pdf: pdf);
  }

  static Widget buildHeaderLogo(imageJpg) => Column(

    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(height: 1 * PdfPageFormat.cm),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 50,
            width: 50,
            child:Image(MemoryImage(imageJpg)),
          ),
        ],
      ),
    ],
  );

  static Widget buildHeader(Invoice invoice) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 1 * PdfPageFormat.cm),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildSupplierAddress(invoice.supplier),
            ],
          ),
          SizedBox(height: 1 * PdfPageFormat.cm),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildCustomerAddress(invoice.customer),
              buildInvoiceInfo(invoice.info),
            ],
          ),
        ],
      );
  static Widget buildHeaderaccount(Invoice invoice) => Column(
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      SizedBox(height: 1 * PdfPageFormat.cm),
      Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          buildAccount(invoice.info),
        ],
      ),
    ],
  );

  static Widget buildCustomerAddress(Customer customer) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(customer.name, style: TextStyle(fontWeight: FontWeight.bold)),
          Text(customer.phone),
          Text(customer.email),
        ],
      );

  static Widget buildInvoiceInfo(InvoiceInfo info) {
    final paymentTerms = '${info.dueDate.difference(info.date).inDays} days';
    final titles = <String>[
      'Invoice Number:',
      'Invoice Date:',
      'Payment Terms:',
      'Due Date:'
    ];
    final data = <String>[
      info.number,
      Utils.formatDate(info.date),
      paymentTerms,
      Utils.formatDate(info.dueDate),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(titles.length, (index) {
        final title = titles[index];
        final value = data[index];

        return buildText(title: title, value: "${value}", width: 200);
      }),
    );
  }
  static Widget buildAccount(InvoiceInfo info) {
    final titles = <String>[
      'Account Detail:',
      'bank:',
      'Account Number:',
    ];
    final data = <String>[
      'GOTRUCK.NG LTD',
      'UBA BANK PLC',
      '1024347328',
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(titles.length, (index) {
        final title = titles[index];
        final value = data[index];

        return buildText(title: title, value: "${value}", width: 200);
      }),
    );
  }

  static Widget buildSupplierAddress(Supplier supplier) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(supplier.name, style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 1 * PdfPageFormat.mm),
          Text(supplier.address),
        ],
      );

  static Widget buildTitle(Invoice invoice) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'INVOICE',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 0.8 * PdfPageFormat.cm),
          Text(invoice.info.description),
          SizedBox(height: 0.8 * PdfPageFormat.cm),
        ],
      );

  static Widget buildInvoice(Invoice invoice) {
    final formatCurrency =
    NumberFormat.simpleCurrency(locale: Platform.localeName, name: 'NGN');
    final headers = [
      'Description',
      'Date',
      'Unit Price',
    ];
    final data = invoice.items.map((item) {
      final total = item.unitPrice;
      return [
        item.description,
        Utils.formatDate(item.date),
        Utils.formatPrice(total),
      ];
    }).toList();

    return Table.fromTextArray(
      headers: headers,
      data: data,
      border: null,
      headerStyle: TextStyle(fontWeight: FontWeight.bold),
      headerDecoration: BoxDecoration(color: PdfColors.grey300),
      cellHeight: 30,
      cellAlignments: {
        0: Alignment.centerLeft,
        1: Alignment.centerRight,
        2: Alignment.centerRight,
        3: Alignment.centerRight,
        4: Alignment.centerRight,
        5: Alignment.centerRight,
      },
    );
  }

  static Widget buildTotal(Invoice invoice) {
    final netTotal = invoice.total;

    final total = netTotal;

    return Container(
      alignment: Alignment.centerRight,
      child: Row(
        children: [
          Spacer(flex: 6),
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildText(
                  title: 'Net total',
                  value: Utils.formatPrice(total),
                  unite: true,
                ),
                SizedBox(height: 2 * PdfPageFormat.mm),
                Container(height: 1, color: PdfColors.grey400),
                SizedBox(height: 0.5 * PdfPageFormat.mm),
                Container(height: 1, color: PdfColors.grey400),
              ],
            ),
          ),
        ],
      ),
    );
  }
  static Widget buildPOLICY(Invoice invoice) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Divider(),
      SizedBox(height: 1 * PdfPageFormat.mm),
      buildSimpleTerms(value: 'BENEFITS'),
      buildSimpleTerms(value: '1. One year drive-line warranty'),
      buildSimpleTerms(value: '2. Availability of Genuine Spare Parts and after-sales Support from ourTrained Engineers.'),
      buildSimpleTerms(value: 'PAYMENT TERMS:'),
      buildSimpleTerms(value: 'Certified Bank draft or 100% payment transfer issued in favour of Gotruck.ng Ltd.'),
      buildSimpleTerms(value: 'DELIVERY PERIOD'),
      buildSimpleTerms(value: '30 days maximum of Ex-works delivery from date of bank payment/instrument confirmation.'),
      buildSimpleText(title: 'VALIDITY:', value: '10 days validity of Proforma Invoice'),
      Divider(),
    ],
  );


  static buildSimpleText({
    required String title,
    required String value,
  }) {
    final style = TextStyle(fontWeight: FontWeight.bold);

    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: pw.CrossAxisAlignment.end,
      children: [
        Text(title, style: style),
        SizedBox(width: 2 * PdfPageFormat.mm),
        Text(value),
      ],
    );
  }
  static buildSimpleTerms({
    required String value,
  }) {
    final style = TextStyle(fontWeight: FontWeight.bold);

    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: pw.CrossAxisAlignment.end,
      children: [
        SizedBox(width: 2 * PdfPageFormat.mm),
        Text(value),
      ],
    );
  }

  static buildText({
    required String title,
    required String value,
    double width = double.infinity,
    TextStyle? titleStyle,
    bool unite = false,
  }) {
    final style = titleStyle ?? TextStyle(fontWeight: FontWeight.bold);

    return Container(
      width: width,
      child: Row(
        children: [
          Expanded(child: Text(title, style: style)),
          Text("${value}", style: unite ? style : null),
        ],
      ),
    );
  }
}
