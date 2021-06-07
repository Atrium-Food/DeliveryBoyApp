import 'package:emojis/emoji.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resturant_delivery_boy/localization/language_constrants.dart';
import 'package:resturant_delivery_boy/provider/location_provider.dart';
import 'package:resturant_delivery_boy/provider/order_provider.dart';
import 'package:resturant_delivery_boy/utill/color_resources.dart';
import 'package:resturant_delivery_boy/utill/dimensions.dart';
import 'package:resturant_delivery_boy/view/screens/home/widget/order_widget.dart';


class AddressBottomSheet extends StatelessWidget {
  final GlobalKey<RefreshIndicatorState> refreshIndicatorKey;
  AddressBottomSheet({this.refreshIndicatorKey});

  @override
  Widget build(BuildContext context) {
    final _screenSize=MediaQuery.of(context).size;
    return Consumer<OrderProvider>(
              builder: (context, orderProvider, child) => SingleChildScrollView(
                // controller: scrollController,
                child: Container(
                  constraints: BoxConstraints(
                    maxHeight: _screenSize.height*0.7
                  ),
                  // height: _screenSize.height*0.5,
                  // padding: EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)
                    )
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 10,horizontal: 5),
                        color: Theme.of(context).primaryColorDark,
                        child: Row(
                          children: [
                            Padding(padding: EdgeInsets.only(left: 5),),
                            Text(getTranslated('active_order', context),
                                style: Theme.of(context).textTheme.headline3.copyWith(
                                    fontSize: Dimensions.FONT_SIZE_LARGE,
                                    color: Theme.of(context).accentColor)),
                            Spacer(),
                            Icon(Icons.keyboard_arrow_up),
                            Padding(padding: EdgeInsets.only(right: 5),),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        color: Theme.of(context).primaryColor,
                        width: _screenSize.width,
                        child: RefreshIndicator(
                          child: orderProvider.currentOrders != null
                              ? orderProvider.currentOrders.length != 0
                              ? ListView.builder(
                            shrinkWrap: true,
                            itemCount:
                            orderProvider.currentOrders.length,
                            // controller: scrollController,
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
                              Theme.of(context).textTheme.headline3.copyWith(color: Theme.of(context).primaryColorDark),
                            ),
                          )
                              : SizedBox.shrink(),
                          key: refreshIndicatorKey,
                          displacement: 0,
                          color: ColorResources.COLOR_WHITE,
                          backgroundColor: Theme.of(context).primaryColor,
                          onRefresh: () {
                            Provider.of<LocationProvider>(context, listen: false).getUserLocation();
                            return orderProvider.refresh(context);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ));
    ;
  }
}
