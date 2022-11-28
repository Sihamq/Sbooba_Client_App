import 'dart:core';

class ApiLink {
  static const String register = "/seller/auth/register"; //post
  static const String login = "/auth/login"; //post
  // static const String allorders = "/orders"; // get  order send token.
  // static const String details = "orders/1"; //details of order send token.
  static const String getProduct = "/seller/products"; //details
  static const String showProduct = "/seller/products/";
  // static const String storeProduct = "/products"; // token
  // static const String updateProduct = "/products/1"; // update.. token
  // static const String delete = "/products/1";
  static const String allcoupons = "/seller/coupons";
//static const String  updateCoupon="" // delete
  static const String deleteCoupon = "/seller/coupons/";
  static const String getProfile = "/seller/profile";
  static const String updateProfile = "/seller/profile"; // delete
}
