// To parse this JSON data, do
//
//     final unitsModel = unitsModelFromJson(jsonString);

import 'dart:convert';

UnitsModel? unitsModelFromJson(String str) =>
    UnitsModel.fromJson(json.decode(str));

String unitsModelToJson(UnitsModel? data) => json.encode(data!.toJson());

class UnitsModel {
  UnitsModel({
    this.result,
    this.data,
    this.message,
    this.status,
  });

  String? result;
  List<UnitsItem?>? data;
  String? message;
  int? status;

  factory UnitsModel.fromJson(Map<String, dynamic> json) => UnitsModel(
        result: json["result"],
        data: json["data"] == null
            ? []
            : List<UnitsItem?>.from(
                json["data"]!.map((x) => UnitsItem.fromJson(x))),
        message: json["message"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "result": result,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x!.toJson())),
        "message": message,
        "status": status,
      };
}

class UnitsItem {
  UnitsItem({
    this.id,
    this.name,
  });

  int? id;
  String? name;

  factory UnitsItem.fromJson(Map<String, dynamic> json) => UnitsItem(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
