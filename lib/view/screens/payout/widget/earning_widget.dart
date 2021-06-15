import 'package:flutter/material.dart';
import 'package:resturant_delivery_boy/data/model/body/performance_body.dart';
import 'package:resturant_delivery_boy/provider/theme_provider.dart';
import 'package:resturant_delivery_boy/utill/dimensions.dart';

class EarningWidget extends StatelessWidget {
  EarningBody earning;
  String first;
  String last;
  EarningWidget({@required this.earning,this.first,this.last});

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
          border: Border.all(width: 0.4,color: Theme.of(context).accentColor),
          borderRadius: BorderRadius.circular(5)
      ),
      width: _screenSize.width*0.9,
      child: Column(
        children: [
           Container(
             padding: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
             child: Row(
               children: [
                 Text("Earning's ${first}",style: Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 20),),
                 Spacer(),
                 Text('\u{20B9}'+earning.total.toString(),style: Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 20),),
               ],
             ),
           ),
          Container(
            padding: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
            child: Row(
              children: [
                Text("Earning's ${last}",style: Theme.of(context).textTheme.bodyText2.copyWith(fontSize: 15),),
                Spacer(),
                Text('\u{20B9}'+earning.last.toString(),style: Theme.of(context).textTheme.bodyText2.copyWith(fontSize: 15),),
              ],
            ),
          ),
          Container(
            color: Colors.black12,
            padding: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 6.0),
                  child: Icon(Icons.receipt_long,color: Theme.of(context).primaryColor),
                ),
                Text("Order",style: Theme.of(context).textTheme.bodyText2.copyWith(fontSize: 18)),
                Spacer(),
                Text('\u{20B9}'+earning.orderPay.toString(),style: Theme.of(context).textTheme.bodyText2.copyWith(fontSize: 18))
              ],
            ),
          ),
          Container(
            color: Colors.black12,
            padding: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 6.0),
                  child: Icon(Icons.receipt_long,color: Theme.of(context).primaryColor,),
                ),
                Text("Tips",style: Theme.of(context).textTheme.bodyText2.copyWith(fontSize: 18)),
                Spacer(),
                Text('\u{20B9}'+earning.tips.toString(),style: Theme.of(context).textTheme.bodyText2.copyWith(fontSize: 18))
              ],
            ),
          )
        ],
      ),
    );
  }
}
