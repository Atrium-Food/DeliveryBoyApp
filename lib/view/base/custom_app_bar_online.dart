import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resturant_delivery_boy/provider/auth_provider.dart';
import 'package:resturant_delivery_boy/provider/theme_provider.dart';
import 'package:resturant_delivery_boy/utill/color_resources.dart';
import 'package:resturant_delivery_boy/utill/dimensions.dart';
import 'package:resturant_delivery_boy/utill/styles.dart';
import 'package:flutter_switch/flutter_switch.dart';

class CustomOnlineAppBar extends StatelessWidget implements PreferredSizeWidget {

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Consumer<AuthProvider>(
        builder: (context, auth, child) {
          return FlutterSwitch(
            activeText: 'Connected',
            activeTextColor: Theme.of(context).primaryColor,
            value: auth.isConnected,
            activeColor: Theme.of(context).primaryColor,
            onToggle: (val){},
          );
        }
      ),
      backgroundColor: Theme.of(context).primaryColorDark,
      elevation: 0,
      actions: [
        IconButton(
          onPressed: (){},
          icon: Icon(Icons.notifications),
          color: Theme.of(context).primaryColor,
        ),
        IconButton(
            onPressed: (){},
            icon: Icon(Icons.help),
          color: Theme.of(context).primaryColor,
        )
      ],
    );
  }

  @override
  Size get preferredSize => Size(double.maxFinite, 50);
}
