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
      appBar: AppBar(
        backgroundColor: Theme.of(context).cardColor,
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
          GestureDetector(
            child: Icon(
              CupertinoIcons.bell_fill,
              color: ColorResources.COLOR_PRIMARY,
            ),
            onTap: () {},
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 13),
              padding: EdgeInsets.all(2),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.all(Radius.circular(2.0)),
                  border: Border.all(
                    color: ColorResources.COLOR_PRIMARY,
                  )),
              child: Text(
                getTranslated('help', context),
                style: rubikRegular.copyWith(
                  color: ColorResources.COLOR_PRIMARY,
                  fontSize: 12,
                ),
              ),
            ),
          ),
          // PopupMenuButton<String>(
          //   onSelected: (value) {
          //     switch (value) {
          //       case 'language':
          //         Navigator.of(context).push(MaterialPageRoute(
          //             builder: (_) =>
          //                 ChooseLanguageScreen(fromHomeScreen: true)));
          //     }
          //   },
          //   icon: Icon(
          //     Icons.more_vert_outlined,
          //     color: ColorResources.COLOR_PRIMARY,
          //   ),
          //   itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
          //     PopupMenuItem<String>(
          //       value: 'language',
          //       child: Row(
          //         children: [
          //           Icon(
          //             Icons.language,
          //             color: ColorResources.COLOR_PRIMARY,
          //           ),
          //           SizedBox(width: Dimensions.PADDING_SIZE_LARGE),
          //           Text(
          //             getTranslated('change_language', context),
          //             style: Theme.of(context).textTheme.headline2.copyWith(
          //                 color: Theme.of(context).textTheme.bodyText1.color),
          //           ),
          //         ],
          //       ),
          //     ),
          //   ],
          // )
        ],
        leading: Switch(
          value: val,
          onChanged: (val) {
            setState(() {
              val = !val;
            });
          },
          activeColor: ColorResources.COLOR_WHITE,
          activeTrackColor: ColorResources.COLOR_PRIMARY,
          inactiveTrackColor: ColorResources.COLOR_GRAY,
          inactiveThumbColor: ColorResources.COLOR_WHITE,
        ),
        // title: Consumer<ProfileProvider>(
        //   builder: (context, profileProvider, child) =>
        //       profileProvider.userInfoModel != null
        //           ? Row(
        //               children: [
        //                 Container(
        //                   decoration: BoxDecoration(shape: BoxShape.circle),
        //                   child: ClipRRect(
        //                     borderRadius: BorderRadius.circular(20),
        //                     child: FadeInImage.assetNetwork(
        //                       placeholder: Images.placeholder_user,
        //                       width: 40,
        //                       height: 40,
        //                       fit: BoxFit.fill,
        //                       image:
        //                           '${Provider.of<SplashProvider>(context, listen: false).baseUrls.deliveryManImageUrl}/${profileProvider.userInfoModel.image}',
        //                     ),
        //                   ),
        //                 ),
        //                 SizedBox(
        //                   width: 8,
        //                 ),
        //                 Text(
        //                   profileProvider.userInfoModel.fName != null
        //                       ? '${profileProvider.userInfoModel.fName ?? ''} ${profileProvider.userInfoModel.lName ?? ''}'
        //                       : "",
        //                   style: Theme.of(context).textTheme.headline3.copyWith(
        //                       fontSize: Dimensions.FONT_SIZE_LARGE,
        //                       color:
        //                           Theme.of(context).textTheme.bodyText1.color),
        //                 )
        //               ],
        //             )
        //           : SizedBox.shrink(),
        // ),
      ),
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
