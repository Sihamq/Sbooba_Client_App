import 'package:dio/dio.dart';
import 'package:sboba_app_client/module/shared/DioHelper/dio_helper.dart';
import 'package:sboba_app_client/module/shared/cash_helper.dart';
import 'package:sboba_app_client/module/shared/routes/api_routes.dart';

class CouponData {
  Future getCoupons() async {
    try {
      var response = await DioHelper.getData(url: ApiLink.allcoupons, option: {
        "Authorization": "Bearer " + await CashHelper.getData("token"),
        "X-localization": await CashHelper.getData("lang")
      });
      if (response.statusCode == 200) {
        print(response.data);
        return response.data;
      } else {
        return response.data;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future deleteCoupon({id}) async {
    try {
      var response = await DioHelper.deleteData(
          url: "/seller/coupons/${id}",
          option: {
            "Authorization": "Bearer " + await CashHelper.getData("token")
          });
      if (response.statusCode == 200) {
        print(response.data);
        return response.data;
      } else {
        return response.data;
      }
    } catch (e) {
      print(e.toString());
    }
  }
  Future getProduct() async {
    try {
      var response = await DioHelper.getData(url: ApiLink.listProduct, option: {
        "Authorization": "Bearer " + await CashHelper.getData("token"),
        "X-localization": await CashHelper.getData("lang")
      });
      if (response.statusCode == 200) {
        print(response.data);
        return response.data;
      } else {
        return response.data;
      }
    } catch (e) {
      print(e.toString());
    }
  }


  Future storeCoupon({
    required couponType,
    required couponCode,
    required discountType,
    required discount,
    required fromDate,
    required toDate,
    required status,
    productName,
  }) async {
    FormData data = FormData.fromMap({
      "coupon_type": couponType,
      "coupon_code": couponCode,
      "discount_type": discountType,
      "discount": discount,
      "from_date": fromDate,
      "to_date": toDate,
      "status": status,
      "products": {"0": productName},
    });
    try {
      var response = await DioHelper.postData1(
          url: ApiLink.storeCoupon,
          data: data,
          option: {
            "Authorization": "Bearer " + await CashHelper.getData("token")
          });
      if (response.statusCode == 200) {
        print(response.data);
        return response.data;
      } else {
        return response.data;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future editCoupon(
      {required couponType,
      required couponCode,
      required discountType,
      required discount,
      required fromDate,
      required toDate,
      required status,
      productName,
      required id}) async {
    FormData data = FormData.fromMap({
      "coupon_type": couponType,
      "coupon_code": couponCode,
      "discount_type": discountType,
      "discount": discount,
      "from_date": fromDate,
      "to_date": toDate,
      "status": status,
      "products": {"0": productName},
    });
    try {
      var response = await DioHelper.updateFormData(
          url: ApiLink.updateCoupon + "${id}",
          data: data,
          option: {
            "Authorization": "Bearer " + await CashHelper.getData("token")
          });
      if (response!.statusCode == 200) {
        print(response.data);
        return response.data;
      } else {
        return response.data;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
