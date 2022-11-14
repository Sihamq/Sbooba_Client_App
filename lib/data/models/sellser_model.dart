// To parse this JSON data, do
//
//     final seller = sellerFromJson(jsonString);

import 'dart:convert';

Seller sellerFromJson(String str) => Seller.fromJson(json.decode(str));

String sellerToJson(Seller data) => json.encode(data.toJson());

class Seller {
  Seller({
    this.seller,
  });

  Seller? seller;

  factory Seller.fromJson(Map<String, dynamic> json) => Seller(
        seller: Seller.fromJson(json["seller"]),
      );

  Map<String, dynamic> toJson() => {
        "seller": seller?.toJson(),
      };
}

class SellerItem {
  SellerItem({
    this.name,
    this.email,
    this.password,
    this.passwordConfirmation,
    this.shopName,
    this.phone,
    this.gender,
    this.commercialNo,
    this.cityId,
    this.address,
    this.latitude,
    this.longitude,
  });

  String? name;
  String? email;
  String? password;
  String? passwordConfirmation;
  String? shopName;
  String? phone;
  int? gender;
  String? commercialNo;
  int? cityId;
  String? address;
  int? latitude;
  int? longitude;

  factory SellerItem.fromJson(Map<String, dynamic> json) => SellerItem(
        name: json["name"],
        email: json["email"],
        password: json["password"],
        passwordConfirmation: json["password_confirmation"],
        shopName: json["shop_name"],
        phone: json["phone"],
        gender: json["gender"],
        commercialNo: json["commercial_no"],
        cityId: json["city_id"],
        address: json["address"],
        latitude: json["latitude"],
        longitude: json["longitude"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "password": password,
        "password_confirmation": passwordConfirmation,
        "shop_name": shopName,
        "phone": phone,
        "gender": gender,
        "commercial_no": commercialNo,
        "city_id": cityId,
        "address": address,
        "latitude": latitude,
        "longitude": longitude,
      };
}
