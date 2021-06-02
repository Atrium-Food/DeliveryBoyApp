import 'package:charts_flutter/flutter.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:resturant_delivery_boy/data/model/body/performance_body.dart';
import 'package:resturant_delivery_boy/utill/color_resources.dart';
import 'package:resturant_delivery_boy/view/screens/payout/widget/barChartModel.dart';
import 'package:resturant_delivery_boy/view/screens/payout/widget/earning_widget.dart';
import 'package:resturant_delivery_boy/view/screens/payout/widget/performance_card.dart';
import 'package:charts_flutter/flutter.dart' as charts;


class WeeklyPayoutTab extends StatelessWidget {
  EarningBody weeklyEarning;
  PerformanceBody weeklyPerformance;
  List<double> weekPayouts;

  WeeklyPayoutTab(
      {this.weeklyEarning, this.weeklyPerformance, this.weekPayouts});


  static List<String> getDaysOfWeek([String locale]) {
    final now = DateTime.now();
    final firstDayOfWeek = now.subtract(Duration(days: now.weekday - 1));
    print(now.weekday);
    return List.generate(7, (index) => index)
        .map((value) => DateFormat(DateFormat.WEEKDAY, locale)
        .format(now.add(Duration(days: value))))
        .toList().reversed.toList();
  }

  initBar([String locale]){
    List<BarChartModel> barData=[];
    List<String> days = getDaysOfWeek();
    for(int i=0;i<7;i++){
      barData.add(BarChartModel(title: days[i],value: weekPayouts[i]));
    }
    return [Series<BarChartModel,String>(
      id: 'Weekly',
          domainFn: (BarChartModel bar, _) => bar.title.substring(0,3),
    measureFn: (BarChartModel bar, _) => bar.value,
      data: barData,
      fillColorFn: (BarChartModel bar,_){
        if(bar.title == DateFormat(DateFormat.WEEKDAY, locale).format(DateTime.now()))
          return charts.ColorUtil.fromDartColor(ColorResources.PRIMARY_DARK);
        return charts.ColorUtil.fromDartColor(ColorResources.COLOR_PRIMARY);
      }
    )];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
        child: ListView(
          shrinkWrap: true,
          children: [
            SizedBox(height: 20,),
            SizedBox(
              height: 200,
              width: 300,
              child: charts.BarChart(
                initBar(),
                animate: true,
                vertical: true,
              ),
            ),
            SizedBox(height: 20,),
            Text("Performance for this week", style: Theme
                .of(context)
                .textTheme
                .headline3
                .copyWith(fontSize: 23),),
            SizedBox(height: 20,),
            PerformanceCard(performance: weeklyPerformance),
            SizedBox(height: 20,),
            EarningWidget(
              earning: weeklyEarning, first: "this week", last: "last week",),

          ],
        )
    );
  }
}
