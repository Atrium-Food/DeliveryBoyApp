import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';
import 'package:resturant_delivery_boy/localization/language_constrants.dart';
import 'package:resturant_delivery_boy/notification/my_notification.dart';
import 'package:resturant_delivery_boy/provider/order_provider.dart';
import 'package:resturant_delivery_boy/utill/color_resources.dart';
import 'package:resturant_delivery_boy/view/screens/deposit/deposit.dart';
import 'package:resturant_delivery_boy/view/screens/home/home_screen.dart';
import 'package:resturant_delivery_boy/view/screens/order/order_history_screen.dart';
import 'package:resturant_delivery_boy/view/screens/payout/payout_screen.dart';
import 'package:resturant_delivery_boy/view/screens/rank/rank_screen.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  final PageController _pageController = PageController();
  int _pageIndex = 0;
  List<Widget> _screens;

  @override
  void initState() {
    super.initState();

    _screens = [
      HomeScreen(),
      PayoutScreen(),
      OrderHistoryScreen(),
      RankScreen(),
      DepositScreen(),
    ];

    var androidInitialize = AndroidInitializationSettings('notification_icon');
    var iOSInitialize = IOSInitializationSettings();
    var initializationsSettings =
        InitializationSettings(android: androidInitialize, iOS: iOSInitialize);
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    flutterLocalNotificationsPlugin.initialize(initializationsSettings);

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print("onMessage: ${message.data}");
      MyNotification.showNotification(
          message.data, flutterLocalNotificationsPlugin);
      Provider.of<OrderProvider>(context, listen: false).getAllOrders(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_pageIndex != 0) {
          _setPage(0);
          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Theme.of(context).primaryColor,
          unselectedItemColor: ColorResources.COLOR_GREY,
          backgroundColor: Theme.of(context).cardColor,
          showUnselectedLabels: true,
          currentIndex: _pageIndex,
          type: BottomNavigationBarType.fixed,
          items: [
            _barItem(Icons.dashboard_outlined,
                getTranslated('dashboard', context), 0),
            _barItem(Icons.account_balance_wallet_outlined,
                getTranslated('payout', context), 1),
            _barItem(Icons.military_tech_outlined,
                getTranslated('rank', context), 2),
            _barItem(Icons.money, getTranslated('deposit', context), 3),
            _barItem(Icons.list, getTranslated('more', context), 4),
          ],
          onTap: (int index) {
            _setPage(index);
          },
        ),
        body: PageView.builder(
          controller: _pageController,
          itemCount: _screens.length,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return _screens[index];
          },
        ),
      ),
    );
  }

  BottomNavigationBarItem _barItem(IconData icon, String label, int index) {
    return BottomNavigationBarItem(
      icon: Icon(icon,
          color: index == _pageIndex
              ? Theme.of(context).primaryColor
              : ColorResources.COLOR_GREY,
          size: 20),
      label: label,
    );
  }

  void _setPage(int pageIndex) {
    setState(() {
      _pageController.jumpToPage(pageIndex);
      _pageIndex = pageIndex;
    });
  }
}
