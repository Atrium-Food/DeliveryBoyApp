import 'package:flutter/foundation.dart';
import 'package:resturant_delivery_boy/data/datasource/remote/dio/dio_client.dart';
import 'package:resturant_delivery_boy/data/datasource/remote/exception/api_error_handler.dart';
import 'package:resturant_delivery_boy/data/model/response/base/api_response.dart';
import 'package:resturant_delivery_boy/utill/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PayoutRepo {
  final DioClient dioClient;
  final SharedPreferences sharedPreferences;

  PayoutRepo({@required this.dioClient, @required this.sharedPreferences});

  Future<ApiResponse> getPayout() async {
    try {
      final response = await dioClient.get('${AppConstants.PAYOUT_URI}${sharedPreferences.getString(AppConstants.TOKEN)}');
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

}
