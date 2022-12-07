// To parse this JSON data, do
//
//     final cateogry = cateogryFromMap(jsonString);

import 'dart:convert';

Cateogry cateogryFromMap(String str) => Cateogry.fromMap(json.decode(str));

String cateogryToMap(Cateogry data) => json.encode(data.toMap());

class Cateogry {
  Cateogry({
    this.result,
    this.data,
    this.message,
    this.status,
  });

  String? result;
  List<CateogryItem>? data;
  String? message;
  int? status;

  factory Cateogry.fromMap(Map<String, dynamic> json) => Cateogry(
        result: json["result"],
        data: List<CateogryItem>.from(
            json["data"].map((x) => CateogryItem.fromMap(x))),
        message: json["message"],
        status: json["status"],
      );

  Map<String, dynamic> toMap() => {
        "result": result,
        "data": List<dynamic>.from(data!.map((x) => x.toMap())),
        "message": message,
        "status": status,
      };
}

class CateogryItem {
  CateogryItem({
    this.id,
    this.name,
    this.parentId,
    this.level,
    this.orderLevel,
    this.commisionRate,
    this.featured,
    this.top,
    this.digital,
    this.slug,
    this.metaTitle,
    this.metaDescription,
    this.banner,
    this.icon,
  });

  int? id;
  String? name;
  dynamic parentId;
  dynamic level;
  dynamic orderLevel;
  dynamic commisionRate;
  dynamic featured;
  dynamic top;
  dynamic digital;
  String? slug;
  dynamic metaTitle;
  dynamic metaDescription;
  dynamic banner;
  dynamic icon;

  factory CateogryItem.fromMap(Map<String, dynamic> json) => CateogryItem(
        id: json["id"],
        name: json["name"],
        parentId: json["parent_id"],
        level: json["level"],
        orderLevel: json["order_level"],
        commisionRate: json["commision_rate"],
        featured: json["featured"],
        top: json["top"],
        digital: json["digital"],
        slug: json["slug"],
        metaTitle: json["meta_title"],
        metaDescription: json["meta_description"],
        banner: json["banner"],
        icon: json["icon"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "parent_id": parentId,
        "level": level,
        "order_level": orderLevel,
        "commision_rate": commisionRate,
        "featured": featured,
        "top": top,
        "digital": digital,
        "slug": slug,
        "meta_title": metaTitle,
        "meta_description": metaDescription,
        "banner": banner,
        "icon": icon,
      };
}
