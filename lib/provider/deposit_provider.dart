import 'package:flutter/material.dart';
import 'package:resturant_delivery_boy/data/model/response/base/api_response.dart';
import 'package:resturant_delivery_boy/data/model/response/base/deposit_model.dart';
import 'package:resturant_delivery_boy/data/repository/deposit_repo.dart';
import 'package:resturant_delivery_boy/helper/api_checker.dart';

class DepositProvider with ChangeNotifier {
  final DepositRepo depositRepo;

  DepositProvider({@required this.depositRepo});

  DepositModel _depositModel;

  DepositModel get depositModel => _depositModel;

  getDeposit(BuildContext context) {
    Map<String, dynamic> json = {
      'maxValue': 1500.0,
      'inHand': 720.0,
    };

    _depositModel = DepositModel.fromJson(json);

    // ApiResponse apiResponse = await depositRepo.getDeposit();
    // if (apiResponse.response != null && apiResponse.response.statusCode == 200) {
    //   _depositModel = DepositModel.fromJson(apiResponse.response.data);
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
