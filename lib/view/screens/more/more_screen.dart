import 'package:emojis/emojis.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resturant_delivery_boy/localization/language_constrants.dart';
import 'package:resturant_delivery_boy/provider/auth_provider.dart';
import 'package:resturant_delivery_boy/provider/order_provider.dart';
import 'package:resturant_delivery_boy/provider/profile_provider.dart';
import 'package:resturant_delivery_boy/provider/splash_provider.dart';
import 'package:resturant_delivery_boy/utill/color_resources.dart';
import 'package:resturant_delivery_boy/utill/dimensions.dart';
import 'package:resturant_delivery_boy/utill/images.dart';
import 'package:resturant_delivery_boy/utill/styles.dart';
import 'package:resturant_delivery_boy/view/base/custom_app_bar_online.dart';
import 'package:resturant_delivery_boy/view/base/status_widget.dart';
import 'package:resturant_delivery_boy/view/screens/auth/login_screen.dart';
import 'package:provider/provider.dart';
import 'package:resturant_delivery_boy/view/screens/more/profile_screen.dart';
import 'package:resturant_delivery_boy/view/screens/order/order_history_screen.dart';
import 'package:resturant_delivery_boy/view/screens/more/ratings_screen.dart';

class MoreScreen extends StatefulWidget {
  @override
  _MoreScreenState createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  bool val = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomOnlineAppBar(),
        backgroundColor: Theme.of(context).backgroundColor,
        body: Consumer<ProfileProvider>(
          builder: (context, profileProvider, child) => Container(
            padding: EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding:
                        EdgeInsets.all(Dimensions.PADDING_SIZE_EXTRA_SMALL),
                    color: Color(0xFF9A9A9A).withOpacity(0.15),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundImage:
                          profileProvider.userInfoModel?.image!=null? NetworkImage(profileProvider.userInfoModel.image) : AssetImage(Images.placeholder_user),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              profileProvider.userInfoModel.fName,
                              style: rubikMedium,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              profileProvider.userInfoModel.identityNumber,
                              style: TextStyle(
                                fontSize: 10,
                                color: ColorResources.COLOR_GREY,
                              ),
                            )
                          ],
                        ),
                        // Expanded(
                        //     child: Row(
                        //   mainAxisAlignment: MainAxisAlignment.end,
                        //   children: [
                        //     Container(
                        //       padding: EdgeInsets.all(
                        //           Dimensions.PADDING_SIZE_EXTRA_SMALL),
                        //       decoration: BoxDecoration(
                        //         color: Color(0xFF9A9A9A).withOpacity(0.2),
                        //         borderRadius:
                        //             BorderRadius.all(Radius.circular(15)),
                        //       ),
                        //       child: Text(
                        //         '4.8 ${Emojis.star}',
                        //         style: TextStyle(
                        //           fontSize: 15,
                        //           color: ColorResources.COLOR_GREY,
                        //         ),
                        //       ),
                        //     ),
                        //   ],
                        // ))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.phone_iphone,
                        color: Color(0xFF9A9A9A),
                        size: 15,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Phone: ${profileProvider.userInfoModel.phone}',
                        style:
                            TextStyle(color: Color(0xFF9A9A9A), fontSize: 10),
                      )
                    ],
                  ),
                  // SizedBox(
                  //   height: 7,
                  // ),
                  // Row(
                  //   children: [
                  //     Icon(
                  //       CupertinoIcons.map_pin_ellipse,
                  //       color: Color(0xFF9A9A9A),
                  //       size: 15,
                  //     ),
                  //     SizedBox(
                  //       width: 5,
                  //     ),g
                  //     Text(
                  //       'Area: Bangalore Urban',
                  //       style:
                  //           TextStyle(color: Color(0xFF9A9A9A), fontSize: 10),
                  //     )
                  //   ],
                  // ),
                  Container(
                    padding: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              getTranslated('theme_style', context),
                              style: Theme.of(context)
                                  .textTheme
                                  .headline3
                                  .copyWith(
                                      color: Theme.of(context).accentColor,
                                      fontSize: Dimensions.FONT_SIZE_LARGE),
                            ),
                            StatusWidget()
                          ],
                        ),
                        SizedBox(height: 20),
                        // GestureDetector(
                        //   onTap: () {
                        //     Navigator.push(
                        //         context,
                        //         MaterialPageRoute(
                        //             builder: (context) => ProfileScreen()));
                        //   },
                        //   child: _userInfoWidget(
                        //       context: context, text: 'Manage Profile'),
                        // ),
                        // SizedBox(height: 15),
                        // GestureDetector(
                        //     onTap: () {
                        //       Navigator.push(
                        //           context,
                        //           MaterialPageRoute(
                        //               builder: (context) => RatingsScreen()));
                        //     },
                        //     child: _userInfoWidget(
                        //         context: context, text: 'Ratings')),
                        // SizedBox(height: 15),
                        // _userInfoWidget(context: context, text: 'Benefits'),
                        // SizedBox(height: 20),
                        // // GestureDetector(
                        // //     onTap: () {
                        // //       Navigator.push(
                        // //           context,
                        // //           MaterialPageRoute(
                        // //               builder: (context) =>
                        // //                   OrderHistoryScreen()));
                        // //     },
                        // //     child: _userInfoWidget(
                        // //         context: context, text: 'History')),
                        // // SizedBox(height: 20),
                        // _userInfoWidget(
                        //     context: context, text: 'Contact Support'),
                        // SizedBox(height: 20),
                        InkWell(
                            onTap: () {
                              Provider.of<AuthProvider>(context, listen: false)
                                  .clearSharedData()
                                  .then((condition) {
                                Navigator.pop(context);
                                Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                        builder: (context) => LoginScreen()),
                                    (route) => false);
                              });
                            },
                            child: _userInfoWidget(
                                context: context, text: 'Logout')),
                        SizedBox(height: 20),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }

  Widget _userInfoWidget({String text, BuildContext context}) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(vertical: 18, horizontal: 22),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.PADDING_SIZE_SMALL),
          color: Theme.of(context).cardColor,
          border: Border.all(color: ColorResources.BORDER_COLOR)),
      child: Text(
        text ?? '',
        style: Theme.of(context)
            .textTheme
            .headline2
            .copyWith(color: Theme.of(context).focusColor),
      ),
    );
  }
}
