

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:resturant_delivery_boy/data/model/response/base/api_response.dart';
import 'package:resturant_delivery_boy/data/model/response/payout_model.dart';
import 'package:resturant_delivery_boy/data/repository/payout_repo.dart';
import 'package:resturant_delivery_boy/helper/api_checker.dart';
import 'package:resturant_delivery_boy/utill/app_constants.dart';

class PayoutProvider with ChangeNotifier {
  final PayoutRepo payoutRepo;
  PayoutProvider({@required this.payoutRepo});

  PayoutModel _payoutModel;

  PayoutModel get payoutModel => _payoutModel;

  getPayout(BuildContext context) {
    Map<String,dynamic> json = {
      "daily_performance": {
        "trips": 3,
        "hours": 6.0,
        "orders": 7
      },
      "daily_earning": {
        "order_pay": 200.0,
        "tips": 10.0,
        "total": 210.0,
        "last": 250.0
      },
      "weekly_performance": {
        "trips": 13,
        "hours": 22.0,
        "orders": 30
      },
      "weekly_earning": {
    "order_pay": 800.0,
    "tips": 100.0,
    "total": 900.0,
    "last": 1100.0
    },
      "week_payouts": [ 10.0, 20.0, 30.0, 40.0, 30.0, 20.0, 10.0],
      "monthly_performance": {
        "trips": 44,
        "hours": 80.0,
        "orders": 70
      },
      "monthly_earning": {
        "order_pay": 4000.0,
        "tips": 700.0,
        "total": 4700.0,
        "last": 4231.0,
      },
      "monthly_payouts": [ 200.0, 300.0, 400.0, 300.0, 100.0],
    };
    _payoutModel = PayoutModel.fromJson(json);

    // ApiResponse apiResponse = await payoutRepo.getPayout();
    // if (apiResponse.response != null && apiResponse.response.statusCode == 200) {
    //   _payoutModel = PayoutModel.fromJson(apiResponse.response.data);
    // } else {
    //   if (apiResponse.error is String) {
    //     print(apiResponse.error.toString());
    //   } else {
    //     ApiChecker.checkApi(context, apiResponse);
    //   }
    // }
    // notifyListeners();
  }



}
