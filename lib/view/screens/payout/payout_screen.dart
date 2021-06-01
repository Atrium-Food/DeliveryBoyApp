import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resturant_delivery_boy/data/model/response/payout_model.dart';
import 'package:resturant_delivery_boy/provider/payout_provider.dart';
import 'package:resturant_delivery_boy/view/base/custom_app_bar.dart';
import 'package:resturant_delivery_boy/view/base/custom_app_bar_online.dart';
import 'package:resturant_delivery_boy/view/screens/payout/widget/daily_payout_tab.dart';
import 'package:resturant_delivery_boy/view/screens/payout/widget/monthly_payout_tab.dart';
import 'package:resturant_delivery_boy/view/screens/payout/widget/weekly_payout_tab.dart';

class PayoutScreen extends StatefulWidget {
  @override
  _PayoutScreenState createState() => _PayoutScreenState();
}

class _PayoutScreenState extends State<PayoutScreen> with TickerProviderStateMixin{
  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    Provider.of<PayoutProvider>(context,listen: false).getPayout(context);
    return Scaffold(
      appBar: CustomOnlineAppBar(),
      body: Consumer<PayoutProvider>(
        builder: (context, payoutProvider, child) {
          PayoutModel payoutModel= payoutProvider.payoutModel;
          return Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15, left: 8.0,right: 8.0),
                  child: TabBar(
                    controller: _tabController,
                    indicatorColor: Theme.of(context).primaryColor,
                    labelColor: Theme.of(context).primaryColor,
                    unselectedLabelColor: Colors.grey,
                    tabs: [
                      Tab(text: 'Daily',),
                      Tab(text: 'Weekly'),
                      Tab(text: 'Monthly'),
                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                      children: [
                        DailyPayoutTab(
                          dailyEarning: payoutModel.dailyEarning,
                          dailyPerformance: payoutModel.dailyPerformance,
                        ),
                        WeeklyPayoutTab(
                          weeklyEarning: payoutModel.weeklyEarning,
                          weeklyPerformance: payoutModel.weeklyPerformance,
                          weekPayouts: payoutModel.weekPayouts,
                        ),
                        MonthlyPayoutTab(
                          monthlyEarning: payoutModel.monthlyEarning,
                          monthlyPerformance: payoutModel.monthlyPerformance,
                          monthPayouts: payoutModel.monthPayouts,
                        ),
                      ]),
                ),
              ],
            ),
          );
        }
      ),

    );
  }
}
