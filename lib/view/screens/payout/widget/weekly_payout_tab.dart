import 'package:flutter/material.dart';
import 'package:resturant_delivery_boy/data/model/body/performance_body.dart';

class WeeklyPayoutTab extends StatelessWidget {
  EarningBody weeklyEarning;
  PerformanceBody weeklyPerformance;
  List<double> weekPayouts;
  WeeklyPayoutTab({this.weeklyEarning,this.weeklyPerformance,this.weekPayouts});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Weekly'),
    );
  }
}
