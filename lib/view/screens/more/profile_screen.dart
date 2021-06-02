import 'package:emojis/emojis.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resturant_delivery_boy/provider/profile_provider.dart';
import 'package:resturant_delivery_boy/utill/color_resources.dart';
import 'package:resturant_delivery_boy/utill/dimensions.dart';
import 'package:resturant_delivery_boy/utill/styles.dart';
import 'package:resturant_delivery_boy/view/base/custom_app_bar.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          'Profile',
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
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: CircleAvatar(
                    child: Image.network(profileProvider.userInfoModel.image),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Center(
                  child: Text(
                      '${profileProvider.userInfoModel.fName} ${profileProvider.userInfoModel.lName} (${profileProvider.userInfoModel.identityNumber})'),
                ),
                SizedBox(
                  height: 5,
                ),
                Center(
                  child: Text('City: Bangalore'),
                ),
                SizedBox(
                  height: 5,
                ),
                Center(
                  child: Text(
                    '4.8 ${Emojis.star}',
                    style: rubikMedium,
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  'Edit Personal Details',
                  style: rubikMedium.copyWith(fontSize: 18),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Phone',
                      style: rubikMedium.copyWith(
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      profileProvider.userInfoModel.phone,
                      style: rubikRegular.copyWith(fontSize: 15),
                    ),
                  ],
                ),
                Divider(
                  color: ColorResources.COLOR_GREY.withOpacity(0.5),
                  height: 30,
                  thickness: 1,
                ),
                Row(
                  children: [
                    Text(
                      'Alternate Phone',
                      style: rubikMedium.copyWith(
                        fontSize: 15,
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            '0000000000',
                            style: rubikRegular.copyWith(fontSize: 15),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          GestureDetector(
                            child: Icon(
                              CupertinoIcons.pencil,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Divider(
                  color: ColorResources.COLOR_GREY.withOpacity(0.5),
                  height: 30,
                  thickness: 1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Adhaar No.',
                      style: rubikMedium.copyWith(
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      '1111 2222 3333 4444',
                      style: rubikRegular.copyWith(fontSize: 15),
                    ),
                  ],
                ),
                Divider(
                  color: ColorResources.COLOR_GREY.withOpacity(0.5),
                  height: 30,
                  thickness: 1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'DL No.',
                      style: rubikMedium.copyWith(
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      'KA0125400089356',
                      style: rubikRegular.copyWith(fontSize: 15),
                    ),
                  ],
                ),
                Divider(
                  color: ColorResources.COLOR_GREY.withOpacity(0.5),
                  height: 30,
                  thickness: 1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'DL Expiry',
                      style: rubikMedium.copyWith(
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      '${DateTime.now().year}',
                      style: rubikRegular.copyWith(fontSize: 15),
                    ),
                  ],
                ),
                Divider(
                  color: ColorResources.COLOR_GREY.withOpacity(0.5),
                  height: 30,
                  thickness: 1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Rating',
                      style: rubikMedium.copyWith(
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      '4.8',
                      style: rubikRegular.copyWith(fontSize: 15),
                    ),
                  ],
                ),
                Divider(
                  color: ColorResources.COLOR_GREY.withOpacity(0.5),
                  height: 30,
                  thickness: 3,
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Bank Details',
                      style: rubikMedium.copyWith(fontSize: 18),
                    ),
                    GestureDetector(
                      child: Icon(
                        CupertinoIcons.pen,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Bank Name',
                      style: rubikMedium.copyWith(
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      'CANARA BANK',
                      style: rubikRegular.copyWith(fontSize: 15),
                    ),
                  ],
                ),
                Divider(
                  color: ColorResources.COLOR_GREY.withOpacity(0.5),
                  thickness: 1,
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Account No.',
                      style: rubikMedium.copyWith(
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      '11221122334',
                      style: rubikRegular.copyWith(fontSize: 15),
                    ),
                  ],
                ),
                Divider(
                  color: ColorResources.COLOR_GREY.withOpacity(0.5),
                  height: 30,
                  thickness: 1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'IFSC Code',
                      style: rubikMedium.copyWith(
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      'CNRB001100211',
                      style: rubikRegular.copyWith(fontSize: 15),
                    ),
                  ],
                ),
                Divider(
                  color: ColorResources.COLOR_GREY.withOpacity(0.5),
                  height: 30,
                  thickness: 1,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
