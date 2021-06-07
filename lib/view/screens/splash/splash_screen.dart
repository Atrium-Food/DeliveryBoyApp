import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:resturant_delivery_boy/localization/language_constrants.dart';
import 'package:resturant_delivery_boy/provider/auth_provider.dart';
import 'package:resturant_delivery_boy/provider/splash_provider.dart';
import 'package:resturant_delivery_boy/utill/images.dart';
import 'package:resturant_delivery_boy/view/screens/auth/login_screen.dart';
import 'package:resturant_delivery_boy/view/screens/dashboard/dashboard_screen.dart';
import 'package:resturant_delivery_boy/view/screens/language/choose_language_screen.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

    _route();
  }

  void _route() {

    Provider.of<AuthProvider>(context, listen: false).checkConnected();
    Provider.of<SplashProvider>(context, listen: false).initSharedData();
    Provider.of<SplashProvider>(context, listen: false).initConfig(context).then((bool isSuccess) {
      if (isSuccess) {
        Timer(Duration(seconds: 1), () async {
          if (Provider.of<AuthProvider>(context, listen: false).isLoggedIn()) {
            Provider.of<AuthProvider>(context, listen: false).updateToken();
            _checkPermission(DashboardScreen());
          } else {
            _checkPermission(LoginScreen());
          }

        });
      }
    });
  }

  void _checkPermission(Widget navigateTo) async {
    LocationPermission permission = await Geolocator.checkPermission();
    if(permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    if(permission == LocationPermission.denied) {
      showDialog(context: context, barrierDismissible: false, builder: (context) => AlertDialog(
        title: Text(getTranslated('alert', context)),
        content: Text(getTranslated('allow_for_all_time', context)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        actions: [ElevatedButton(
          onPressed: () async {
            Navigator.pop(context);
            await Geolocator.requestPermission();
            _checkPermission(navigateTo);
          },
          child: Text(getTranslated('ok', context)),
        )],
      ));
    }else if(permission == LocationPermission.deniedForever) {
      await Geolocator.openLocationSettings();
    }else {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => navigateTo));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(Images.efood_bike, height: 165),
            SizedBox(height: 45),
            Image.asset(Images.efood, height: 33,color: Theme.of(context).primaryColor,),
          ],
        ),
      ),
    );
  }
}
