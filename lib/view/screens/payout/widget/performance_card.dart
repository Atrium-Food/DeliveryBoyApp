import 'package:flutter/material.dart';
import 'package:resturant_delivery_boy/data/model/body/performance_body.dart';
import 'package:resturant_delivery_boy/utill/color_resources.dart';
import 'package:resturant_delivery_boy/utill/dimensions.dart';

class PerformanceCard extends StatelessWidget {
  PerformanceBody performance;
  PerformanceCard({@required this.performance});
  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return Container(
      height: 80,
      decoration: BoxDecoration(
        border: Border.all(width: 0.25,color: Theme.of(context).accentColor),
        borderRadius: BorderRadius.circular(5)
      ),
      width: _screenSize.width*0.9,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: _screenSize.width*0.28,
            decoration: BoxDecoration(
              border: Border(
                right: BorderSide(width: 0.2,color: Theme.of(context).accentColor)
              )
            ),
            child: Center(
              child: Column(

                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(performance.trips.toString(),style: Theme.of(context).textTheme.bodyText2.copyWith(color: Theme.of(context).accentColor,backgroundColor: Colors.black12,
                  fontSize: 22),),
                  Text("Trips",style: Theme.of(context).textTheme.headline1.copyWith(fontSize: 15,color: Theme.of(context).accentColor),)
                ],
              ),
            ),
          ),
          Container(
            width: _screenSize.width*0.28,
            decoration: BoxDecoration(
                border: Border(
                    right: BorderSide(width: 0.2,color: Theme.of(context).accentColor)
                )
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(performance.hours.toString(),style: Theme.of(context).textTheme.bodyText2.copyWith(color: Theme.of(context).accentColor,backgroundColor: Colors.black12,
                    fontSize: 20,),),
                Text("Hours",style: Theme.of(context).textTheme.headline1.copyWith(fontSize: 15),)
              ],
            ),
          ),
          Container(
            width: _screenSize.width*0.28,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(performance.orders.toString(),style: Theme.of(context).textTheme.bodyText2.copyWith(color: Theme.of(context).accentColor,backgroundColor: Colors.black12,
                    fontSize: 20,),),
                Text("Orders",style: Theme.of(context).textTheme.headline1.copyWith(fontSize: 15,color: Theme.of(context).accentColor),)
              ],
            ),
          )
        ],
      ),
    );
  }
}
