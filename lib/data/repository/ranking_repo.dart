import 'package:flutter/material.dart';
import 'package:resturant_delivery_boy/data/datasource/remote/dio/dio_client.dart';
import 'package:resturant_delivery_boy/data/datasource/remote/exception/api_error_handler.dart';
import 'package:resturant_delivery_boy/data/model/response/base/api_response.dart';
import 'package:resturant_delivery_boy/utill/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RankingRepo {
  final DioClient dioClient;
  final SharedPreferences sharedPreferences;

  RankingRepo({@required this.dioClient, @required this.sharedPreferences});

  Future<ApiResponse> getRanking() async {
    try {
      final response = await dioClient.get(
          '${AppConstants.RANKING_URI}${sharedPreferences.getString(AppConstants.TOKEN)}');
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}
