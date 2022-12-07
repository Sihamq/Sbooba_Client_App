import 'package:dio/dio.dart';
import 'package:sboba_app_client/module/shared/DioHelper/dio_helper.dart';
import 'package:sboba_app_client/module/shared/cash_helper.dart';
import 'package:sboba_app_client/module/shared/routes/api_routes.dart';

class Productdata {
  Future getProduct() async {
    try {
      var response = await DioHelper.getData(url: ApiLink.getProduct, option: {
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

  Future showSingleProduct(id) async {
    try {
      var response = await DioHelper.getData(
          url: ApiLink.showProduct + "${id}",
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

  Future deleteProduct({id}) async {
    try {
      var response = await DioHelper.deleteData(
          url: "/seller/products/${id}",
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

  addNewProduct(
      {required name_ar,
      required name_en,
      required description_ar,
      required description_en,
      calories,
      required category_id,
      tags,
      unit_price,
      required purchase_price,
      todays_deal,
      published,
      approved,
      stock_visibility_state,
      required cash_on_delivery,
      featured,
      current_stock,
      unit,
      required min_qty,
      low_stock_quantity,
      discount,
      discount_type,
      discount_start_date,
      discount_end_date,
      tax,
      slug,
      meta_title,
      meta_description}) async {
    FormData data = FormData.fromMap({
      "name": {"ar": name_ar, "en": name_en},
      "description": {"ar": description_ar, "en": description_en},
      "calories": calories,
      "category_id": category_id,
      "tags": tags,
      "unit_price": unit_price,
      "purchase_price": purchase_price,
      "todays_deal": todays_deal,
      "published": published,
      "approved": approved,
      "stock_visibility_state": stock_visibility_state,
      "cash_on_delivery": cash_on_delivery,
      "featured": featured,
      "current_stock": current_stock,
      "unit": unit,
      "min_qty": min_qty,
      "low_stock_quantity": low_stock_quantity,
      "discount": discount,
      "tax": tax,
      "slug": slug,
      "meta_title": meta_title,
      "meta_description": meta_description,
      "discount_type": discount_type,
      "discount_start_date": discount_start_date,
      "discount_end_date": discount_end_date,
    });

    var response = await DioHelper.postData1(
        url: ApiLink.storeProduct,
        data: data,
        option: {
          "Authorization": "Bearer " + await CashHelper.getData("token"),
        });
    if (response.statusCode == 200) {
      print(response.data);
      return response.data;
    } else {
      response.data;
      print(response.data);
    }
  }

  Future getCateogryProduct() async {
    try {
      var response =
          await DioHelper.getData(url: ApiLink.cateogryProduct, option: {
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
}
