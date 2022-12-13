// To parse this JSON data, do
//
//     final showProduct = showProductFromJson(jsonString);

import 'dart:convert';

ShowProduct showProductFromJson(String str) =>
    ShowProduct.fromJson(json.decode(str));

String showProductToJson(ShowProduct data) => json.encode(data.toJson());

class ShowProduct {
  ShowProduct({
    this.result,
    this.data,
    this.message,
    this.status,
  });

  String? result;
  List<ShowItem>? data;
  String? message;
  int? status;

  factory ShowProduct.fromJson(Map<String, dynamic> json) => ShowProduct(
        result: json["result"],
        data:
            List<ShowItem>.from(json["data"].map((x) => ShowItem.fromJson(x))),
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

class ShowItem {
  ShowItem({
    this.id,
    this.name,
    this.calories,
    this.addedBy,
    this.sellerId,
    this.categoryId,
    this.videoProvider,
    this.videoLink,
    this.tags,
    this.descriptionName,
    this.unitPrice,
    this.purchasePrice,
    this.attributes,
    this.todaysDeal,
    this.published,
    this.approved,
    this.cashOnDelivery,
    this.featured,
    this.sellerFeatured,
    this.unit,
    this.minQty,
    this.lowStockQuantity,
    this.tax,
    this.taxType,
    this.barcode,
    this.slug,
    this.metaTitle,
    this.metaDescription,
    this.metaImg,
    this.metaKeywords,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.cateogryName,
  });

  int? id;
  Name? name;
  int? calories;
  int? addedBy;
  int? sellerId;
  int? categoryId;
  String? cateogryName;
  int? videoProvider;
  String? videoLink;
  String? tags;
  Name? descriptionName;
  int? unitPrice;
  int? purchasePrice;
  String? attributes;
  int? todaysDeal;
  int? published;
  int? approved;
  int? cashOnDelivery;
  int? featured;
  int? sellerFeatured;
  String? unit;
  int? minQty;
  dynamic lowStockQuantity;
  int? tax;
  int? taxType;
  dynamic barcode;
  String? slug;
  String? metaTitle;
  String? metaDescription;
  dynamic metaImg;
  dynamic metaKeywords;
  dynamic deletedAt;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory ShowItem.fromJson(Map<String, dynamic> json) => ShowItem(
        id: json["id"],
        name: Name.fromJson(json["name"]),
        calories: json["calories"],
        addedBy: json["added_by"],
        sellerId: json["seller_id"],
        categoryId: json["category_id"],
        cateogryName: json["category_name"],
        videoProvider: json["video_provider"],
        videoLink: json["video_link"],
        tags: json["tags"],
        descriptionName: Name.fromJson(json["description"]),
        unitPrice: json["unit_price"],
        purchasePrice: json["purchase_price"],
        attributes: json["attributes"],
        todaysDeal: json["todays_deal"],
        published: json["published"],
        approved: json["approved"],
        cashOnDelivery: json["cash_on_delivery"],
        featured: json["featured"],
        sellerFeatured: json["seller_featured"],
        unit: json["unit"],
        minQty: json["min_qty"],
        lowStockQuantity: json["low_stock_quantity"],
        tax: json["tax"],
        taxType: json["tax_type"],
        barcode: json["barcode"],
        slug: json["slug"],
        metaTitle: json["meta_title"],
        metaDescription: json["meta_description"],
        metaImg: json["meta_img"],
        metaKeywords: json["meta_keywords"],
        deletedAt: json["deleted_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name?.toJson(),
        "calories": calories,
        "added_by": addedBy,
        "seller_id": sellerId,
        "category_id": categoryId,
        "video_provider": videoProvider,
        "video_link": videoLink,
        "tags": tags,
        "description": descriptionName?.toJson(),
        "unit_price": unitPrice,
        "purchase_price": purchasePrice,
        "attributes": attributes,
        "todays_deal": todaysDeal,
        "published": published,
        "approved": approved,
        "cash_on_delivery": cashOnDelivery,
        "featured": featured,
        "seller_featured": sellerFeatured,
        "unit": unit,
        "min_qty": minQty,
        "low_stock_quantity": lowStockQuantity,
        "tax": tax,
        "tax_type": taxType,
        "barcode": barcode,
        "slug": slug,
        "meta_title": metaTitle,
        "meta_description": metaDescription,
        "meta_img": metaImg,
        "meta_keywords": metaKeywords,
        "deleted_at": deletedAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "category_name": cateogryName
      };
}

class Name {
  Name({
    this.en,
    this.ar,
  });

  String? en;
  String? ar;

  factory Name.fromJson(Map<String, dynamic> json) => Name(
        en: json["en"],
        ar: json["ar"],
      );

  Map<String, dynamic> toJson() => {
        "en": en,
        "ar": ar,
      };
}
