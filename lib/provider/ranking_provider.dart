import 'package:flutter/material.dart';
import 'package:resturant_delivery_boy/data/model/response/base/api_response.dart';
import 'package:resturant_delivery_boy/data/model/response/ranking_model.dart';
import 'package:resturant_delivery_boy/data/repository/ranking_repo.dart';
import 'package:resturant_delivery_boy/helper/api_checker.dart';

class RankingProvider with ChangeNotifier {
  final RankingRepo rankingRepo;

  RankingProvider({@required this.rankingRepo});

  RankingModel _rankingModel;

  // getRankings(BuildContext context) async{
  //   ApiResponse apiResponse = await rankingRepo.getRanking();
  //   if (apiResponse.response != null && apiResponse.response.statusCode == 200) {
  //     _rankingModel = RankingModel.fromJson(apiResponse.response.data);
  //   } else {
  //     if (apiResponse.error is String) {
  //       print(apiResponse.error.toString());
  //     } else {
  //       ApiChecker.checkApi(context, apiResponse);
  //     }
  //   }
  //   notifyListeners();
  // }

}
