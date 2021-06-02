class DepositModel {
  double _maxValue;
  double _inHand;

  DepositModel({double maxValue, double inHand}) {
    this._inHand = inHand;
    this._maxValue = maxValue;
  }

  double get inHand => _inHand;
  double get maxValue => _maxValue;

  DepositModel.fromJson(Map<String, dynamic> json) {
    _maxValue = json['maxValue'];
    _inHand = json['inHand'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = new Map<String, dynamic>();

    data['maxValue'] = this._maxValue;
    data['inHand'] = this._inHand;

    return data;
  }
}
