// To parse this JSON data, do
//
//     final coupons = couponsFromJson(jsonString);

import 'dart:convert';

Coupons couponsFromJson(String str) => Coupons.fromJson(json.decode(str));

String couponsToJson(Coupons data) => json.encode(data.toJson());

class Coupons {
  Coupons({
    this.result,
    this.data,
    this.message,
    this.status,
  });

  String? result;
  List<CouponsItems>? data;
  String? message;
  int? status;

  factory Coupons.fromJson(Map<String, dynamic> json) => Coupons(
        result: json["result"],
        data: List<CouponsItems>.from(
            json["data"].map((x) => CouponsItems.fromJson(x))),
        message: json["message"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "result": result,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "message": message,
        "status": status,
      };
}

class CouponsItems {
  CouponsItems({
    this.id,
    this.sellerId,
    this.couponType,
    this.couponCode,
    this.discountType,
    this.discount,
    this.fromDate,
    this.toDate,
    this.status,
  });

  int? id;
  int? sellerId;
  int? couponType;
  String? couponCode;
  int? discountType;
  int? discount;
  DateTime? fromDate;
  DateTime? toDate;
  int? status;

  factory CouponsItems.fromJson(Map<String, dynamic> json) => CouponsItems(
        id: json["id"],
        sellerId: json["seller_id"],
        couponType: json["coupon_type"],
        couponCode: json["coupon_code"],
        discountType: json["discount_type"],
        discount: json["discount"],
        fromDate: DateTime.parse(json["from_date"]),
        toDate: DateTime.parse(json["to_date"]),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "seller_id": sellerId,
        "coupon_type": couponType,
        "coupon_code": couponCode,
        "discount_type": discountType,
        "discount": discount,
        "from_date": fromDate!.toIso8601String(),
        "to_date": toDate!.toIso8601String(),
        "status": status,
      };
}
