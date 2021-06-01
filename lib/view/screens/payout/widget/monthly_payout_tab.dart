import 'package:flutter/material.dart';
import 'package:resturant_delivery_boy/data/model/body/performance_body.dart';

class MonthlyPayoutTab extends StatelessWidget {
  EarningBody monthlyEarning;
  PerformanceBody monthlyPerformance;
  List<double> monthPayouts;

  MonthlyPayoutTab({this.monthlyEarning,this.monthlyPerformance,this.monthPayouts});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Monthly'),
    );
  }
}
