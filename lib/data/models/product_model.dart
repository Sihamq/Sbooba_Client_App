// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

class Product {
  Product({
    this.result,
    this.data,
    this.message,
    this.status,
  });

  String? result;
  List<ProductItem>? data;
  String? message;
  int? status;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        result: json["result"],
        data: List<ProductItem>.from(
            json["data"].map((x) => ProductItem.fromJson(x))),
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

class ProductItem {
  ProductItem({
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
    this.attachmentable,
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
  dynamic? barcode;
  String? slug;
  String? metaTitle;
  dynamic metaImg;
  String? metaDescription;
  dynamic metaKeywords;

  dynamic image;
  List<Attachmentable>? attachmentable;

  factory ProductItem.fromJson(Map<String, dynamic> json) => ProductItem(
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
        image:  json["image"],
        attachmentable: List<Attachmentable>.from(
            json["attachmentable"].map((x) => Attachmentable.fromJson(x))),
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
        "attachmentable":
            List<dynamic>.from(attachmentable!.map((x) => x.toJson())),
      };
}

class Attachmentable {
  Attachmentable({
    this.id,
    this.attachmentableType,
    this.attachmentableId,
    this.title,
    this.description,
    this.path,
    this.createdAt,
  });

  int? id;
  String? attachmentableType;
  int? attachmentableId;
  dynamic title;
  dynamic description;
  String? path;
  DateTime? createdAt;

  factory Attachmentable.fromJson(Map<String, dynamic> json) => Attachmentable(
        id: json["id"],
        attachmentableType: json["attachmentable_type"],
        attachmentableId: json["attachmentable_id"],
        title: json["title"],
        description: json["description"],
        path: json["path"],
        createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "attachmentable_type": attachmentableType,
        "attachmentable_id": attachmentableId,
        "title": title,
        "description": description,
        "path": path,
        "created_at": createdAt!.toIso8601String(),
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
