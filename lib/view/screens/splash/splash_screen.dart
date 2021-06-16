import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
    Provider.of<SplashProvider>(context, listen: false)
        .initConfig(context)
        .then((bool isSuccess) {
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
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    if (permission == LocationPermission.denied) {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => AlertDialog(
                title: Text(getTranslated('alert', context)),
                content: Text(getTranslated('allow_for_all_time', context)),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                actions: [
                  ElevatedButton(
                    onPressed: () async {
                      Navigator.pop(context);
                      await Geolocator.requestPermission();
                      _checkPermission(navigateTo);
                    },
                    child: Text(getTranslated('ok', context)),
                  )
                ],
              ));
    } else if (permission == LocationPermission.deniedForever) {
      await Geolocator.openLocationSettings();
    } else {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => navigateTo));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff8f6df),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(Images.kiwis_delivery_svg, height: 165),
            SizedBox(height: 45),
            Image.asset(
              Images.kiwis_delivery_partner,
              height: 100,
              color: Theme.of(context).primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
