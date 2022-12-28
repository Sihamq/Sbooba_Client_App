// To parse this JSON data, do
//
//     final getProduct = getProductFromJson(jsonString);

import 'dart:convert';

GetProduct getProductFromJson(String str) =>
    GetProduct.fromJson(json.decode(str));

String getProductToJson(GetProduct data) => json.encode(data.toJson());

class GetProduct {
  GetProduct({
    this.result,
    this.data,
    this.message,
    this.status,
  });

  String? result;
  List<GetProductItem>? data;
  String? message;
  int? status;

  factory GetProduct.fromJson(Map<String, dynamic> json) => GetProduct(
        result: json["result"],
        data: List<GetProductItem>.from(
            json["data"].map((x) => GetProductItem.fromJson(x))),
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

class GetProductItem {
  GetProductItem({
    this.id,
    this.name,
    this.calories,
    this.addedBy,
    this.sellerId,
    this.categoryId,
    this.category,
    this.videoProvider,
    this.videoLink,
    this.tags,
    this.description,
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
    this.tax,
    this.taxType,
    this.barcode,
    this.slug,
    this.metaTitle,
    this.metaImg,
    this.metaDescription,
    this.metaKeywords,
    this.image,
    this.discount,
    this.discountedPrice,
  });

  int? id;
  String? name;
  int? calories;
  int? addedBy;
  int? sellerId;
  int? categoryId;
  Category? category;
  int? videoProvider;
  String? videoLink;
  String? tags;
  String? description;
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
  int? tax;
  int? taxType;
  dynamic barcode;
  String? slug;
  String? metaTitle;
  dynamic metaImg;
  String? metaDescription;
  dynamic metaKeywords;
  String? image;
  List<Discount>? discount;
  double? discountedPrice;

  factory GetProductItem.fromJson(Map<String, dynamic> json) => GetProductItem(
        id: json["id"],
        name: json["name"],
        calories: json["calories"],
        addedBy: json["added_by"],
        sellerId: json["seller_id"],
        categoryId: json["category_id"],
        category: Category.fromJson(json["category"]),
        videoProvider: json["video_provider"],
        videoLink: json["video_link"],
        tags: json["tags"],
        description: json["description"],
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
        tax: json["tax"],
        taxType: json["tax_type"],
        barcode: json["barcode"],
        slug: json["slug"],
        metaTitle: json["meta_title"],
        metaImg: json["meta_img"],
        metaDescription: json["meta_description"],
        metaKeywords: json["meta_keywords"],
        image: json["image"],
        discount: (json["discount"] as List).isNotEmpty? List<Discount>.from(
            json["discount"].map((x) => Discount.fromJson(x))) :null,
        discountedPrice: json["discounted_price"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "calories": calories,
        "added_by": addedBy,
        "seller_id": sellerId,
        "category_id": categoryId,
        "category": category!.toJson(),
        "video_provider": videoProvider,
        "video_link": videoLink,
        "tags": tags,
        "description": description,
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
        "tax": tax,
        "tax_type": taxType,
        "barcode": barcode,
        "slug": slug,
        "meta_title": metaTitle,
        "meta_img": metaImg,
        "meta_description": metaDescription,
        "meta_keywords": metaKeywords,
        "image": image,
        "discount": List<dynamic>.from(discount!.map((x) => x.toJson())),
        "discounted_price": discountedPrice,
      };
}

class Discount {
  Discount({
    this.id,
    this.productId,
    this.discount,
    this.discountType,
    this.discountStartDate,
    this.discountEndDate,
  });

  int? id;
  int? productId;
  int? discount;
  String? discountType;
  DateTime? discountStartDate;
  DateTime? discountEndDate;

  factory Discount.fromJson(Map<String, dynamic> json) => Discount(
        id: json["id"],
        productId: json["product_id"],
        discount: json["discount"],
        discountType: json["discount_type"],
        discountStartDate: DateTime.parse(json["discount_start_date"]),
        discountEndDate: DateTime.parse(json["discount_end_date"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product_id": productId,
        "discount": discount,
        "discount_type": discountType,
        "discount_start_date": discountStartDate!.toIso8601String(),
        "discount_end_date": discountEndDate!.toIso8601String(),
      };
}

class Category {
  Category({
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
  int? parentId;
  int? level;
  int? orderLevel;
  int? commisionRate;
  int? featured;
  int? top;
  int? digital;
  String? slug;
  String? metaTitle;
  String? metaDescription;
  String? banner;
  String? icon;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
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

  Map<String, dynamic> toJson() => {
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
