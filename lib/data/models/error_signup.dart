// To parse this JSON data, do
//
//     final errorSignUp = errorSignUpFromJson(jsonString);

import 'dart:convert';

ErrorSignUp errorSignUpFromJson(String str) =>
    ErrorSignUp.fromJson(json.decode(str));

String errorSignUpToJson(ErrorSignUp data) => json.encode(data.toJson());

class ErrorSignUp {
  ErrorSignUp({
    this.sellerEmail,
    this.sellerPhone,
    this.sellerShopName,
    this.sellerCommercialNo,
  });

  List<String>? sellerEmail;
  List<String>? sellerPhone;
  List<String>? sellerShopName;
  List<String>? sellerCommercialNo;

  factory ErrorSignUp.fromJson(Map<String, dynamic> json) => ErrorSignUp(
        sellerEmail: List<String>.from(json["seller.email"].map((x) => x)),
        sellerPhone: List<String>.from(json["seller.phone"].map((x) => x)),
        sellerShopName:
            List<String>.from(json["seller.shop_name"].map((x) => x)),
        sellerCommercialNo:
            List<String>.from(json["seller.commercial_no"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "seller.email": List<dynamic>.from(sellerEmail!.map((x) => x)),
        "seller.phone": List<dynamic>.from(sellerPhone!.map((x) => x)),
        "seller.shop_name": List<dynamic>.from(sellerShopName!.map((x) => x)),
        "seller.commercial_no":
            List<dynamic>.from(sellerCommercialNo!.map((x) => x)),
      };
}
