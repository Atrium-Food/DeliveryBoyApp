import 'package:emojis/emojis.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resturant_delivery_boy/localization/language_constrants.dart';
import 'package:resturant_delivery_boy/provider/deposit_provider.dart';
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
import 'package:flutter_xlider/flutter_xlider.dart';

class DepositScreen extends StatefulWidget {
  @override
  _DepositScreenState createState() => _DepositScreenState();
}

class _DepositScreenState extends State<DepositScreen> {
  bool val = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Consumer<DepositProvider>(
        builder: (context, depositProvider, child) {
          return Container(
            padding: EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Available Limit',
                            style:
                                Theme.of(context).textTheme.headline4.copyWith(
                                      fontSize: 18,
                                    ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            '31 May',
                            style: rubikRegular.copyWith(
                                color: Color(0xFF9A9A9A), fontSize: 14),
                          ),
                        ],
                      ),
                      Text(
                        '₹${depositProvider.depositModel.inHand.toString()}',
                        style: rubikMedium.copyWith(fontSize: 23),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  FlutterSlider(
                    max: depositProvider.depositModel.maxValue,
                    disabled: true,
                    values: [depositProvider.depositModel.inHand],
                    min: 0,
                    tooltip: FlutterSliderTooltip(
                        alwaysShowTooltip: true,
                        format: (String value) {
                          return '₹' + value;
                        },
                        custom: (value) {
                          return Text(
                            '₹ ${value.toString()}',
                            style: rubikRegular.copyWith(
                              color: ColorResources.COLOR_GREY,
                            ),
                          );
                        }),
                    trackBar: FlutterSliderTrackBar(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '₹0',
                        style: TextStyle(color: ColorResources.COLOR_GREY),
                      ),
                      Text(
                        '₹ ${depositProvider.depositModel.maxValue}',
                        style: TextStyle(color: ColorResources.COLOR_GREY),
                      ),
                    ],
                  ),
                  Divider(
                    color: ColorResources.COLOR_GREY,
                    thickness: 1,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Cash in Hand',
                            style: rubikRegular.copyWith(fontSize: 13),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Deposit cash when you reach the limit',
                            style: rubikRegular.copyWith(
                                color: Color(0xFF9A9A9A), fontSize: 11),
                          ),
                        ],
                      ),
                      Text(
                        '₹${depositProvider.depositModel.maxValue - depositProvider.depositModel.inHand}',
                        style: rubikMedium.copyWith(fontSize: 20),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Divider(
                    color: ColorResources.COLOR_GREY,
                    thickness: 1,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Available Balance',
                        style: TextStyle(
                            color: ColorResources.COLOR_GREY,
                            fontSize: 18,
                            fontWeight: FontWeight.w200),
                      ),
                      Text(
                        '₹ 0',
                        style: TextStyle(
                            color: ColorResources.COLOR_GREY, fontSize: 15),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Divider(
                    color: ColorResources.COLOR_GREY,
                    thickness: 1,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  _paymentMethodWidget(text: 'Pay by UPI', context: context),
                  SizedBox(
                    height: 20,
                  ),
                  _paymentMethodWidget(
                      text: 'Deposit at Pantry', context: context),
                  SizedBox(
                    height: 20,
                  ),
                  _paymentMethodWidget(
                      text: 'Pay by Card / Netbanking', context: context)
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _paymentMethodWidget({String text, BuildContext context}) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(vertical: 18, horizontal: 22),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.PADDING_SIZE_SMALL),
          color: ColorResources.COLOR_PRIMARY,
          border: Border.all(color: ColorResources.BORDER_COLOR)),
      child: Center(
        child: Text(
          text ?? '',
          style: Theme.of(context)
              .textTheme
              .headline2
              .copyWith(color: ColorResources.COLOR_WHITE),
        ),
      ),
    );
  }
}
