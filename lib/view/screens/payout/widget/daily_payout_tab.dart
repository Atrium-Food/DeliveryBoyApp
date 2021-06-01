import 'package:flutter/material.dart';
import 'package:resturant_delivery_boy/data/model/body/performance_body.dart';
import 'package:resturant_delivery_boy/view/screens/payout/widget/earning_widget.dart';
import 'package:resturant_delivery_boy/view/screens/payout/widget/performance_card.dart';

class DailyPayoutTab extends StatelessWidget {
  EarningBody dailyEarning;
  PerformanceBody dailyPerformance;
  DailyPayoutTab({this.dailyEarning,this.dailyPerformance});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(height: 20,),
          Text("Performance for Today", style:Theme.of(context).textTheme.headline3.copyWith(fontSize: 25),),
          SizedBox(height: 20,),
          PerformanceCard(performance: dailyPerformance),
          SizedBox(height: 20,),
          EarningWidget(earning: dailyEarning, first: "today",last: "yesterday",),
        ],
      )
    );
  }
}
