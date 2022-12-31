// To parse this JSON data, do
//
//     final couponProducts = couponProductsFromJson(jsonString);

import 'dart:convert';

CouponProducts couponProductsFromJson(String str) =>
    CouponProducts.fromJson(json.decode(str));

String couponProductsToJson(CouponProducts data) => json.encode(data.toJson());

class CouponProducts {
  CouponProducts({
    this.result,
    this.data,
    this.message,
    this.status,
  });

  String? result;
  List<CouponProductItem>? data;
  String? message;
  int? status;

  factory CouponProducts.fromJson(Map<String, dynamic> json) => CouponProducts(
        result: json["result"],
        data: List<CouponProductItem>.from(
            json["data"].map((x) => CouponProductItem.fromJson(x))),
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

class CouponProductItem {
  CouponProductItem({
    this.id,
    this.name,
  });

  int? id;
  String? name;

  factory CouponProductItem.fromJson(Map<String, dynamic> json) =>
      CouponProductItem(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
