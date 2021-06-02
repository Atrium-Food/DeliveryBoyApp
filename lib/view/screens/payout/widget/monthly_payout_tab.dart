import 'package:flutter/material.dart';
import 'package:resturant_delivery_boy/data/model/body/performance_body.dart';
import 'package:resturant_delivery_boy/utill/color_resources.dart';
import 'package:resturant_delivery_boy/view/screens/payout/widget/barChartModel.dart';
import 'package:resturant_delivery_boy/view/screens/payout/widget/earning_widget.dart';
import 'package:resturant_delivery_boy/view/screens/payout/widget/performance_card.dart';
import 'package:charts_flutter/flutter.dart' as charts;
class MonthlyPayoutTab extends StatelessWidget {
  EarningBody monthlyEarning;
  PerformanceBody monthlyPerformance;
  List<double> monthPayouts;

  MonthlyPayoutTab({this.monthlyEarning,this.monthlyPerformance,this.monthPayouts});


  static List<String> getWeeksofMonth([String locale]) {
    return ["1-2","3-9","10-16","17-23","24-31"];
//     String date = DateTime.now().toString();
//     String firstDay = date.substring(0, 8) + '01' + date.substring(10);
//     int weekDay = DateTime.parse(firstDay).weekday;
//     DateTime testDate = DateTime.now();
//
//     int weekOfMonth;
//     if (weekDay == 7) {
//       weekDay = 0;
//     }
//     weekOfMonth = ((testDate.day + weekDay) / 7).ceil();
//     print('Week of the month: $weekOfMonth');
  }

  initBar([String locale]){
    List<BarChartModel> barData=[];
    List<String> days = getWeeksofMonth();
    for(int i=0;i<5;i++){
      barData.add(BarChartModel(title: days[i],value: monthPayouts[i]));
    }
    return [charts.Series<BarChartModel,String>(
        id: 'Weekly',
        domainFn: (BarChartModel bar, _) => bar.title,
        measureFn: (BarChartModel bar, _) => bar.value,
        data: barData,
        fillColorFn: (BarChartModel bar,_){
          // if(bar.title == DateFormat(DateFormat.WEEKDAY, locale).format(DateTime.now()))
          //   return charts.ColorUtil.fromDartColor(ColorResources.PRIMARY_DARK);
          return charts.ColorUtil.fromDartColor(ColorResources.COLOR_PRIMARY);
        }
    )];
  }

  @override
  Widget build(BuildContext context) {
    getWeeksofMonth();
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
          Text("Performance for Today", style:Theme.of(context).textTheme.headline3.copyWith(fontSize: 25),),
          SizedBox(height: 20,),
          PerformanceCard(performance: monthlyPerformance),
          SizedBox(height: 20,),
          EarningWidget(earning: monthlyEarning, first: "today",last: "yesterday",),

        ],
      )
    );
  }
}
