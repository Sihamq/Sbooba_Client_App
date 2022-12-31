// To parse this JSON data, do
//
//     final profile = profileFromJson(jsonString);

import 'dart:convert';

Profile profileFromJson(String str) => Profile.fromJson(json.decode(str));

String profileToJson(Profile data) => json.encode(data.toJson());

class Profile {
  Profile({
    this.result,
    this.data,
    this.message,
    this.status,
  });

  String? result;
  ProfileItem? data;
  String? message;
  int? status;

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        result: json["result"],
        data: ProfileItem.fromJson(json["data"]),
        message: json["message"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "result": result,
        "data": data!.toJson(),
        "message": message,
        "status": status,
      };
}

class ProfileItem {
  ProfileItem({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.image,
    this.gender,
    this.shopName,
    this.shopLogo,
    this.commercialNo,
    this.address,
    this.longitude,
    this.latitude,
    this.verificationStatus,
    this.slug,
    this.metaTitle,
    this.metaImg,
    this.metaDescription,
    this.metaKeywords,
    this.totalProducts,
    this.totalOrders,
    this.acceptOrders,
    this.canceledOrders,
  });

  int? id;
  String? name;
  String? email;
  String? phone;
  String? image;
  int? gender;
  String? shopName;
  String? shopLogo;
  String? commercialNo;
  String? address;
  String? longitude;
  String? latitude;
  int? verificationStatus;
  dynamic slug;
  dynamic metaTitle;
  dynamic metaImg;
  dynamic metaDescription;
  dynamic metaKeywords;
  int? totalProducts;
  int? totalOrders;
  int? acceptOrders;
  int? canceledOrders;

  factory ProfileItem.fromJson(Map<String, dynamic> json) => ProfileItem(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        image: json["image"],
        gender: json["gender"],
        shopName: json["shop_name"],
        shopLogo: json["shop_logo"],
        commercialNo: json["commercial_no"],
        address: json["address"],
        longitude: json["longitude"],
        latitude: json["latitude"],
        verificationStatus: json["verification_status"],
        slug: json["slug"],
        metaTitle: json["meta_title"],
        metaImg: json["meta_img"],
        metaDescription: json["meta_description"],
        metaKeywords: json["meta_keywords"],
        totalProducts: json["total_products"],
        totalOrders: json["total_orders"],
        acceptOrders: json["accept_orders"],
        canceledOrders: json["Canceled _orders"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "phone": phone,
        "image": image,
        "gender": gender,
        "shop_name": shopName,
        "shop_logo": shopLogo,
        "commercial_no": commercialNo,
        "address": address,
        "longitude": longitude,
        "latitude": latitude,
        "verification_status": verificationStatus,
        "slug": slug,
        "meta_title": metaTitle,
        "meta_img": metaImg,
        "meta_description": metaDescription,
        "meta_keywords": metaKeywords,
        "total_products": totalProducts,
        "total_orders": totalOrders,
        "accept_orders": acceptOrders,
        "Canceled _orders": canceledOrders,
      };
}
