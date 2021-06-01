class PerformanceBody{
  int _trips;
  double _hours;
  int _orders;

  PerformanceBody({int trips,double hours,int orders}){
    this._trips=trips;
    this._hours=hours;
    this._orders=orders;
  }

  int get trips => _trips;
  double get hours => _hours;
  int get orders => _orders;

  PerformanceBody.fromJson(Map<String, dynamic> json){
    _trips = json["trips"];
    _hours= json["hours"];
    _orders = json["orders"];
  }

  Map<String,dynamic> toJson(){
    Map<String,dynamic> data;
    data["trips"]=_trips;
    data["hours"]=_hours;
    data["orders"]=_orders;
    return data;
  }
}

class EarningBody{
  double _orderPay;
  double _tips;
  double _total;
  double _last;

  EarningBody({double orderPay,double tips,double total, double last}){
    _orderPay=orderPay;
    _tips=tips;
    _total=total;
    _last=last;
  }

  double get orderPay => _orderPay;
  double get tips => _tips;
  double get total => _total;
  double get last => _last;

  EarningBody.fromJson(Map<String, dynamic> json){
    _orderPay = json["order_pay"];
    _tips= json["tips"];
    _total = json["total"];
    _last = json["last"];
  }

  Map<String,dynamic> toJson(){
    Map<String,dynamic> data;
    data["order_pay"]=_orderPay;
    data["tips"]=_tips;
    data["total"]=_total;
    data["last"]=_last;
    return data;
  }
}
