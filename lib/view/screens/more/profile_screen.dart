import 'package:emojis/emojis.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resturant_delivery_boy/provider/profile_provider.dart';
import 'package:resturant_delivery_boy/utill/color_resources.dart';
import 'package:resturant_delivery_boy/utill/dimensions.dart';
import 'package:resturant_delivery_boy/utill/styles.dart';
import 'package:resturant_delivery_boy/view/base/custom_button.dart';
import 'package:resturant_delivery_boy/view/base/custom_text_field.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _altNoEdit = false;
  bool _bankEdit = false;
  final TextEditingController _altPhoneController = TextEditingController();
  final TextEditingController _bankNameController = TextEditingController();
  final TextEditingController _accController = TextEditingController();
  final TextEditingController _ifscController = TextEditingController();
  final FocusNode _numberFocus = FocusNode();
  final FocusNode _nameFocus = FocusNode();
  final FocusNode _accFocus = FocusNode();
  final FocusNode _ifscFocus = FocusNode();
  String _bankName = '';
  String _accNo = '';
  String _ifsc = '';
  String _alternatePhone = '';
  String _altPhoneError = '';
  String _nameError = '';
  String _accError = '';
  String _ifscError = '';

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    _altPhoneController.dispose();
    _bankNameController.dispose();
    _accController.dispose();
    _ifscController.dispose();

    _altPhoneError = '';
    _nameError = '';
    _accError = '';
    _ifscError = '';
  }

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
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              _alternatePhone.length > 0
                                  ? _alternatePhone
                                  : '-',
                              style: rubikRegular.copyWith(fontSize: 15),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  _altNoEdit = true;
                                });
                              },
                              child: Icon(
                                CupertinoIcons.pencil,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                _altNoEdit
                    ? CustomTextField(
                        hintText: 'Alt. Phone',
                        controller: _altPhoneController,
                        isShowSuffixIcon: true,
                        focusNode: _numberFocus,
                        inputType: TextInputType.phone,
                        isShowBorder: true,
                        errorMessage: _altPhoneError,
                      )
                    : SizedBox.shrink(),
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
                      onTap: () {
                        setState(() {
                          _bankEdit = true;
                        });
                      },
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
                      _bankName.length > 0 ? _bankName : 'required',
                      style: rubikRegular.copyWith(fontSize: 15),
                    ),
                  ],
                ),
                _bankEdit
                    ? CustomTextField(
                        hintText: 'Bank Name',
                        controller: _bankNameController,
                        isShowSuffixIcon: false,
                        focusNode: _nameFocus,
                        inputType: TextInputType.name,
                        isShowBorder: true,
                        errorMessage: _nameError,
                      )
                    : SizedBox.shrink(),
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
                      _accNo.length > 0 ? _accNo : 'required',
                      style: rubikRegular.copyWith(fontSize: 15),
                    ),
                  ],
                ),
                _bankEdit
                    ? CustomTextField(
                        hintText: 'Account Number',
                        controller: _accController,
                        isShowSuffixIcon: false,
                        focusNode: _accFocus,
                        inputType: TextInputType.number,
                        isShowBorder: true,
                        errorMessage: _accError,
                      )
                    : SizedBox.shrink(),
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
                      _ifsc.length > 0 ? _ifsc : 'required',
                      style: rubikRegular.copyWith(fontSize: 15),
                    ),
                  ],
                ),
                _bankEdit
                    ? CustomTextField(
                        hintText: 'IFSC',
                        controller: _ifscController,
                        isShowSuffixIcon: false,
                        focusNode: _ifscFocus,
                        inputType: TextInputType.text,
                        isShowBorder: true,
                        errorMessage: _ifscError,
                      )
                    : SizedBox.shrink(),
                Divider(
                  color: ColorResources.COLOR_GREY.withOpacity(0.5),
                  height: 30,
                  thickness: 1,
                ),
                (_altNoEdit || _bankEdit)
                    ? CustomButton(
                        btnTxt: 'Submit',
                        onTap: () {
                          setState(() {
                            if (_altNoEdit &&
                                _altPhoneController.text.length != 10) {
                              _altPhoneError = 'invalid phone number';
                            } else {
                              _altPhoneError = '';
                            }

                            if (_bankEdit &&
                                (_bankNameController.text.length == 0 ||
                                    _accController.text.length != 12 ||
                                    _ifscController.text.length == 0)) {
                              if (_bankNameController.text.length == 0) {
                                _nameError = 'required';
                              } else {
                                _nameError = '';
                              }

                              if (_accController.text.length == 0) {
                                _accError = 'required';
                              } else if (_accController.text.length != 12) {
                                _accError = 'invalid account number';
                              } else {
                                _accError = '';
                              }

                              if (_ifscController.text.length == 0) {
                                _ifscError = 'required';
                              } else {
                                _ifscError = '';
                              }
                            } else {
                              _bankName = _bankNameController.text;
                              _accNo = _accController.text;
                              _ifsc = _ifscController.text;

                              _bankNameController.text = '';
                              _accController.text = '';
                              _ifscController.text = '';

                              _bankEdit = false;
                            }

                            if (_altNoEdit) {
                              if (_altPhoneController.text.length == 10) {
                                _alternatePhone = _altPhoneController.text;
                              }
                              _altNoEdit = false;
                              _altPhoneError = '';
                            }
                            _altPhoneController.text = '';
                          });
                        },
                      )
                    : SizedBox.shrink(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
