import 'package:resturant_delivery_boy/data/model/body/performance_body.dart';

class PayoutModel{
  PerformanceBody _dailyPerformance;
  EarningBody _dailyEarning;

  PerformanceBody _weeklyPerformance;
  EarningBody _weeklyEarning;
  List<double> _weekPayouts;

  PerformanceBody _monthlyPerformance;
  EarningBody _monthlyEarning;
  List<double> _monthPayouts;

  PayoutModel({EarningBody dailyEarningBody, EarningBody weeklyEarningBody, EarningBody monthlyEarningBody, PerformanceBody dailyPerformanceBody,
  PerformanceBody weeklyPerformanceBody, PerformanceBody monthlyPerformanceBody,List<double> weekPayouts, List<double> monthPayouts}){
  _dailyEarning=dailyEarningBody;
  _dailyPerformance=dailyPerformanceBody;
  _weeklyEarning = weeklyEarningBody;
  _weeklyPerformance = weeklyPerformanceBody;
  _weekPayouts = weekPayouts;
  _monthPayouts = monthPayouts;
  }

  PayoutModel.fromJson(Map<String,dynamic> json){
    _dailyEarning = EarningBody.fromJson(json["daily_earning"]);
    _dailyPerformance = PerformanceBody.fromJson(json["daily_performance"]);
    _weeklyEarning = EarningBody.fromJson(json["weekly_earning"]);
    _weeklyPerformance = PerformanceBody.fromJson(json["weekly_performance"]);
    _weekPayouts = json["week_payouts"]; // list of 7
    _monthlyEarning = EarningBody.fromJson(json["monthly_earning"]);
    _monthlyPerformance = PerformanceBody.fromJson(json["monthly_performance"]);
    _monthPayouts = json["month_payouts"]; // list of 5
  }

  PerformanceBody get dailyPerformance => _dailyPerformance;
  EarningBody get dailyEarning => _dailyEarning;

  PerformanceBody get weeklyPerformance => _weeklyPerformance;
  EarningBody get weeklyEarning => _weeklyEarning;
  List<double> get weekPayouts => _weekPayouts;

  PerformanceBody get monthlyPerformance => _monthlyPerformance;
  EarningBody get monthlyEarning => _monthlyEarning;
  List<double> get monthPayouts => _monthPayouts;


}
