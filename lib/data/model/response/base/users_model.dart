import 'package:resturant_delivery_boy/data/model/response/userinfo_model.dart';

class UsersModel {
  List<UserInfoModel> _userInfo;

  UsersModel({List<UserInfoModel> userInfo}) {
    this._userInfo = userInfo;
  }

  List<UserInfoModel> get userInfo => _userInfo;

  UsersModel.fromJson(Map<String, dynamic> json) {
    _userInfo = [];

    if (json['userInfo'] != null) {
      json['userInfo'].forEach((v) {
        _userInfo.add(new UserInfoModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    if (_userInfo != null) {
      data['userInfo'] = this._userInfo.map((e) => e.toJson()).toList();
    }

    return data;
  }
}
