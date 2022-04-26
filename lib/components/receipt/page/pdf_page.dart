import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:noviii/components/receipt/api/pdf_api.dart';
import 'package:noviii/components/receipt/api/pdf_invoice_api.dart';
import 'package:noviii/components/receipt/model/invoice.dart';
import 'package:noviii/main.dart';
import 'package:noviii/components/receipt/widgets/button_widget.dart';
import 'package:noviii/components/receipt/widgets/title_widget.dart';
import 'package:http/http.dart' as http;

class PdfPage extends StatefulWidget {
  @override
  _PdfPageState createState() => _PdfPageState();
}

class _PdfPageState extends State<PdfPage> {
  List<BillModel> items = [];

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text(MyApp.title),
          centerTitle: true,
        ),
        body: Container(
          padding: const EdgeInsets.all(32),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const TitleWidget(
                  icon: Icons.picture_as_pdf,
                  text: 'Generate Invoice',
                ),
                const SizedBox(height: 48),
                ButtonWidget(
                  text: 'Invoice PDF',
                  onClicked: () async {
                    final data = await fetchData();

                    final pdfFile = await PdfInvoiceApi.generate(data);

                    PdfApi.openFile(pdfFile);
                  },
                ),
              ],
            ),
          ),
        ),
      );

  static Future fetchData() async {
    final queryParameters = {
      "UserOrderId": 1,
      "CurrentUserId": 1,
      "CashRegisterId": 1,
      "ShopId": 1
    };

    //final uri = Uri.parse('https://192.168.1.2:7194/api/ProductUserOrderIntertables/bill', queryParameters)

    final response = await http.post(
      Uri.parse(
          'https://192.168.1.2:7194/api/ProductUserOrderIntertables/bill'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, int>{
        "UserOrderId": 1,
        "CurrentUserId": 1,
        "CashRegisterId": 1,
        "ShopId": 1
      }),
    );

    response.body;

    return BillModel.fromJson(jsonDecode(response.body));
  }
}
