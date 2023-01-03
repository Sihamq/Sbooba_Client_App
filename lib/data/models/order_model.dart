// To parse this JSON data, do
//
//     final orderModel = orderModelFromJson(jsonString);

import 'dart:convert';

OrderModel orderModelFromJson(String str) =>
    OrderModel.fromJson(json.decode(str));

String orderModelToJson(OrderModel data) => json.encode(data.toJson());

class OrderModel {
  OrderModel({
    this.result,
    this.data,
    this.message,
    this.status,
  });

  String? result;
  List<OrderItem>? data;
  String? message;
  int? status;

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        result: json["result"],
        data: List<OrderItem>.from(
            json["data"].map((x) => OrderItem.fromJson(x))),
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

class OrderItem {
  OrderItem({
    this.id,
    this.name,
  });

  int? id;
  String? name;

  factory OrderItem.fromJson(Map<String, dynamic> json) => OrderItem(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
