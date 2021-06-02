import 'dart:ffi';

import 'package:emojis/emojis.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:resturant_delivery_boy/provider/profile_provider.dart';
import 'package:resturant_delivery_boy/utill/color_resources.dart';
import 'package:resturant_delivery_boy/utill/dimensions.dart';
import 'package:resturant_delivery_boy/utill/styles.dart';
import 'package:resturant_delivery_boy/view/screens/profile/widgets/star_display_widget.dart';

class RatingsScreen extends StatelessWidget {
  const RatingsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.BACKGROUND_COLOR,
      appBar: AppBar(
        backgroundColor: ColorResources.BACKGROUND_COLOR,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            CupertinoIcons.back,
            color: ColorResources.COLOR_BLACK,
          ),
        ),
        title: Text(
          'Ratings',
          style: rubikBold.copyWith(
              fontSize: 25,
              color: ColorResources.COLOR_BLACK,
              fontWeight: FontWeight.w500),
        ),
        centerTitle: false,
      ),
      body: Consumer<ProfileProvider>(
        builder: (context, profileProvider, child) => Container(
          padding: EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Overall',
                      style: rubikMedium.copyWith(
                          fontWeight: FontWeight.w600, fontSize: 17),
                    ),
                    Container(
                      padding:
                          EdgeInsets.all(Dimensions.PADDING_SIZE_EXTRA_SMALL),
                      decoration: BoxDecoration(
                        color: ColorResources.COLOR_WHITE,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: Offset(1, 1),
                          ),
                        ],
                      ),
                      child: Text(
                        '4.8 ${Emojis.star}',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w300,
                          color: ColorResources.COLOR_GREY,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 13,
                ),
                Text(
                  'Your last 10 delivery ratings will be shown here',
                  style: TextStyle(
                    color: Color(0xFFC4C4C4),
                    fontSize: 12,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: ListView.builder(
                      itemCount: 10,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(
                              top: Dimensions.PADDING_SIZE_EXTRA_SMALL,
                              bottom: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                          padding:
                              EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
                          decoration: BoxDecoration(
                            color: ColorResources.COLOR_WHITE,
                            borderRadius: BorderRadius.all(
                              Radius.circular(5),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 1,
                                offset: Offset(1, 1),
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              Text(
                                'User ${index + 1}',
                                style: rubikMedium.copyWith(fontSize: 15),
                              ),
                              Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      'Rated you',
                                      style: rubikRegular.copyWith(
                                          fontSize: 13,
                                          color: Color(0xFFC4C4C4)),
                                    ),
                                    SizedBox(
                                      width: 7,
                                    ),
                                    StarDisplayWidget(
                                      value: 4,
                                      filledStar: Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                      unfilledStar: Icon(
                                        Icons.star_border_outlined,
                                        color: Colors.amber,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
