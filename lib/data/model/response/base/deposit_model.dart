import 'package:flutter/material.dart';

class DepositModel {
  double maxValue;
  double inHand;

  DepositModel({
    this.maxValue,
    this.inHand,
  });

  DepositModel.fromJson(Map<String, dynamic> json) {
    maxValue = json['maxValue'];
    inHand = json['inHand'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = new Map<String, dynamic>();

    data['maxValue'] = this.maxValue;
    data['inHand'] = this.inHand;

    return data;
  }
}
