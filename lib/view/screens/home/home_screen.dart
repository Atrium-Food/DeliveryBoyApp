import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resturant_delivery_boy/localization/language_constrants.dart';
import 'package:resturant_delivery_boy/provider/location_provider.dart';
import 'package:resturant_delivery_boy/provider/order_provider.dart';
import 'package:resturant_delivery_boy/provider/profile_provider.dart';
import 'package:resturant_delivery_boy/provider/splash_provider.dart';
import 'package:resturant_delivery_boy/utill/color_resources.dart';
import 'package:resturant_delivery_boy/utill/dimensions.dart';
import 'package:resturant_delivery_boy/utill/images.dart';
import 'package:resturant_delivery_boy/utill/styles.dart';
import 'package:resturant_delivery_boy/view/base/custom_app_bar_online.dart';
import 'package:resturant_delivery_boy/view/screens/home/widget/order_widget.dart';
import 'package:resturant_delivery_boy/view/screens/language/choose_language_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      new GlobalKey<RefreshIndicatorState>();

  bool val = true;

  @override
  Widget build(BuildContext context) {
    Provider.of<OrderProvider>(context, listen: false).getAllOrders(context);
    Provider.of<ProfileProvider>(context, listen: false).getUserInfo(context);
    Provider.of<LocationProvider>(context, listen: false).getUserLocation();

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: CustomOnlineAppBar(),
      body: Consumer<OrderProvider>(
          builder: (context, orderProvider, child) => Padding(
                padding: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(getTranslated('active_order', context),
                        style: Theme.of(context).textTheme.headline3.copyWith(
                            fontSize: Dimensions.FONT_SIZE_LARGE,
                            color: Theme.of(context).accentColor)),
                    SizedBox(height: 10),
                    Expanded(
                      child: RefreshIndicator(
                        child: orderProvider.currentOrders != null
                            ? orderProvider.currentOrders.length != 0
                                ? ListView.builder(
                                    itemCount:
                                        orderProvider.currentOrders.length,
                                    physics: const BouncingScrollPhysics(
                                        parent:
                                            AlwaysScrollableScrollPhysics()),
                                    itemBuilder: (context, index) =>
                                        OrderWidget(
                                      orderModel:
                                          orderProvider.currentOrders[index],
                                      index: index,
                                    ),
                                  )
                                : Center(
                                    child: Text(
                                      getTranslated('no_order_found', context),
                                      style:
                                          Theme.of(context).textTheme.headline3,
                                    ),
                                  )
                            : SizedBox.shrink(),
                        key: _refreshIndicatorKey,
                        displacement: 0,
                        color: ColorResources.COLOR_WHITE,
                        backgroundColor: Theme.of(context).primaryColor,
                        onRefresh: () {
                          return orderProvider.refresh(context);
                        },
                      ),
                    ),
                  ],
                ),
              )),
    );
  }
}
