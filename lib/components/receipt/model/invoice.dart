import 'dart:core';

class BillModel {
  final BillInfo info;
  final List<BillItem> items;
  final BillSupplier supplier;

  const BillModel(
      {required this.info, required this.items, required this.supplier});

  factory BillModel.fromJson(dynamic json) {
    return BillModel(
        info: json["billInfo"],
        items: json["billItems"],
        supplier: json["billSupplier"]);
  }
}

class BillInfo {
  final String number;
  final String date;
  final String storeName;
  final String adress;
  final String cashRegister;

  const BillInfo(
      {required this.number,
      required this.date,
      required this.cashRegister,
      required this.adress,
      required this.storeName});

  factory BillInfo.fromJson(dynamic json) {
    return BillInfo(
        number: json["number"],
        date: json["date"],
        cashRegister: json["storeName"],
        adress: json["storeAdress"],
        storeName: json["cashRegister"]);
  }
}

class BillItem {
  final String name;
  final double quantity;
  final String mesuarment;
  final double vat;
  final double unitPrice;

  const BillItem({
    required this.name,
    required this.quantity,
    required this.mesuarment,
    required this.vat,
    required this.unitPrice,
  });
  factory BillItem.fromJson(dynamic json) {
    return BillItem(
        name: json["name"],
        quantity: json["quantity"],
        mesuarment: json["measurment"],
        vat: json["vat"],
        unitPrice: json["unitPrice"]);
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map["name"] = name;
    map["quantity"] = quantity;
    map["measurment"] = mesuarment;
    map["vat"] = vat;
    map["unitPrice"] = unitPrice;
    return map;
  }
}

class BillSupplier {
  final String firstName;
  final String lastName;
  final String email;

  const BillSupplier(
      {required this.firstName, required this.lastName, required this.email});

  factory BillSupplier.fromJson(dynamic json) {
    return BillSupplier(
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"]);
  }
}
