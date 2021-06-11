import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resturant_delivery_boy/localization/language_constrants.dart';
import 'package:resturant_delivery_boy/provider/auth_provider.dart';
import 'package:resturant_delivery_boy/provider/order_provider.dart';
import 'package:resturant_delivery_boy/provider/theme_provider.dart';
import 'package:resturant_delivery_boy/utill/color_resources.dart';
import 'package:resturant_delivery_boy/utill/dimensions.dart';
import 'package:resturant_delivery_boy/utill/styles.dart';
import 'package:flutter_switch/flutter_switch.dart';

class CustomOnlineAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Consumer<AuthProvider>(builder: (context, auth, child) {
        return InkWell(
          child: auth.isConnected
              ? Container(
                  width: 80,
                  height: 29,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: ColorResources.COLOR_PRIMARY,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                          child: Text(
                        "Online",
                        // getTranslated('online', context),
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headline2.copyWith(
                              color: ColorResources.COLOR_WHITE,
                              fontSize: Dimensions.FONT_SIZE_SMALL,
                            ),
                      )),
                      Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: CircleAvatar(
                          radius: 13,
                          backgroundColor: ColorResources.COLOR_WHITE,
                        ),
                      )
                    ],
                  ),
                )
              : Container(
                  width: 80,
                  height: 29,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: ColorResources.COLOR_GREY,
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: CircleAvatar(
                          radius: 13,
                          backgroundColor: ColorResources.COLOR_WHITE,
                        ),
                      ),
                      Expanded(
                          child: Text(
                        "Offline",
                        // getTranslated('offline', context),
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headline2.copyWith(
                              color: ColorResources.COLOR_WHITE,
                              fontSize: Dimensions.FONT_SIZE_SMALL,
                            ),
                      )),
                    ],
                  ),
                ),
        );
      }),
      backgroundColor: Theme.of(context).primaryColorDark,
      elevation: 0,
      actions: [
        Consumer<OrderProvider>(
          builder: (context, orderProvider, child) =>
              orderProvider.currentOrders.length > 0
                  ? SizedBox.shrink()
                  : IconButton(
                      icon: Icon(Icons.refresh,
                          color: ColorResources.COLOR_PRIMARY),
                      onPressed: () {
                        orderProvider.refresh(context);
                      }),
        ),
        // IconButton(
        //   onPressed: () {},
        //   icon: Icon(Icons.notifications),
        //   color: Theme.of(context).primaryColor,
        // ),
        // InkWell(
        //   onTap: () {},
        //   child: Container(
        //     margin: EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 13),
        //     padding: EdgeInsets.all(2),
        //     alignment: Alignment.center,
        //     decoration: BoxDecoration(
        //         color: Colors.transparent,
        //         borderRadius: BorderRadius.all(Radius.circular(2.0)),
        //         border: Border.all(
        //           color: ColorResources.COLOR_PRIMARY,
        //         )),
        //     child: Text(
        //       getTranslated('help', context),
        //       style: rubikRegular.copyWith(
        //         color: ColorResources.COLOR_PRIMARY,
        //         fontSize: 12,
        //       ),
        //     ),
        //   ),
        // ),
      ],
    );
  }

  @override
  Size get preferredSize => Size(double.maxFinite, 50);
}
