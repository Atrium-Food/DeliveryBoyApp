import 'package:emojis/emojis.dart';
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
import 'package:emojis/emoji.dart';

class RankScreen extends StatefulWidget {
  @override
  _RankScreenState createState() => _RankScreenState();
}

class _RankScreenState extends State<RankScreen> {
  bool val = true;

  @override
  Widget build(BuildContext context) {
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
      ),
      body: Consumer<ProfileProvider>(
        builder: (context, profileProvider, child) => Container(
          padding: EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(Dimensions.PADDING_SIZE_EXTRA_SMALL),
                  decoration: BoxDecoration(
                    color: ColorResources.BACKGROUND_COLOR,
                    borderRadius: BorderRadius.all(Radius.circular(3.0)),
                    boxShadow: [
                      BoxShadow(
                        color: ColorResources.COLOR_GREY,
                        offset: Offset(0.5, 0.5),
                        spreadRadius: 1.0,
                        blurRadius: 2,
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                          profileProvider.userInfoModel.image,
                        ),
                        radius: 30,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(profileProvider.userInfoModel.fName),
                          SizedBox(
                            height: 5,
                          ),
                          Text(profileProvider.userInfoModel.lName),
                        ],
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      Column(
                        children: [
                          Container(
                              padding: EdgeInsets.all(
                                  Dimensions.PADDING_SIZE_EXTRA_SMALL),
                              decoration: BoxDecoration(
                                color:
                                    ColorResources.COLOR_GRAY.withOpacity(0.3),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                              ),
                              child: Text('289 ${Emojis.fire}')),
                          SizedBox(
                            height: 1,
                          ),
                          Text(
                            'runs',
                            style: TextStyle(
                              fontSize: 8,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        children: [
                          Container(
                              padding: EdgeInsets.only(
                                  top: Dimensions.PADDING_SIZE_EXTRA_SMALL,
                                  bottom: Dimensions.PADDING_SIZE_EXTRA_SMALL,
                                  left: Dimensions.PADDING_SIZE_EXTRA_SMALL + 8,
                                  right:
                                      Dimensions.PADDING_SIZE_EXTRA_SMALL + 8),
                              decoration: BoxDecoration(
                                color: ColorResources.COLOR_PRIMARY
                                    .withOpacity(0.2),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                              ),
                              child: Text(
                                '17',
                                style: TextStyle(
                                  color: ColorResources.COLOR_PRIMARY,
                                ),
                              )),
                          SizedBox(
                            height: 1,
                          ),
                          Text(
                            'rank',
                            style: TextStyle(
                              fontSize: 8,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 18,
                      ),
                      GestureDetector(
                          child: Icon(
                            Icons.arrow_drop_down,
                            size: 21,
                            color: ColorResources.COLOR_BLACK,
                          ),
                          onTap: () {})
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Weekly Ranking',
                  style: rubikBold.copyWith(
                      fontSize: 20, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 0,
                ),
                Text(
                  'Raking resets every week',
                  style: TextStyle(
                    fontSize: 10,
                    color: ColorResources.COLOR_GREY,
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Center(
                  child: Container(
                    padding:
                        EdgeInsets.all(Dimensions.PADDING_SIZE_EXTRA_SMALL),
                    child: ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return Container(
                            padding:
                                EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
                            margin: EdgeInsets.only(
                                top: Dimensions.PADDING_SIZE_EXTRA_SMALL,
                                bottom: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                              // boxShadow: [
                              //   BoxShadow(
                              //       color: ColorResources.COLOR_GREY,
                              //       offset: Offset(0.3, 0.3),
                              //       spreadRadius: 0.5,
                              //       blurRadius: 1),
                              // ],
                              color: index < 3
                                  ? ColorResources.COLOR_PRIMARY
                                      .withOpacity(0.2)
                                  : ColorResources.BACKGROUND_COLOR,
                            ),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 13,
                                  child: Text(
                                    '${index + 1}',
                                    style: TextStyle(
                                        color: index < 3
                                            ? Colors.brown
                                            : ColorResources.COLOR_PRIMARY,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  backgroundColor: index < 3
                                      ? Color(0xFFFFD541)
                                      : Colors.transparent,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                CircleAvatar(
                                  backgroundColor: Colors.green,
                                  radius: 20,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(profileProvider.userInfoModel.fName),
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        '${328 - index} ${Emojis.fire}',
                                        style: rubikMedium,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
