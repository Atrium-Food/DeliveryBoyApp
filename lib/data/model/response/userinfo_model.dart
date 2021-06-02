class UserInfoModel {
  int id;
  String fName;
  String lName;
  String phone;
  String altPhone;
  String email;
  String identityNumber;
  String identityType;
  String identityImage;
  String image;
  String password;
  String createdAt;
  String updatedAt;
  String authToken;
  String adhaar;
  String dlNumber;
  String dlExp;
  double rating;
  int runs;

  UserInfoModel(
      {this.id,
      this.fName,
      this.lName,
      this.phone,
      this.altPhone,
      this.adhaar,
      this.dlExp,
      this.rating,
      this.dlNumber,
      this.email,
      this.identityNumber,
      this.identityType,
      this.identityImage,
      this.image,
      this.password,
      this.createdAt,
      this.updatedAt,
      this.authToken,
      this.runs});

  UserInfoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fName = json['f_name'];
    lName = json['l_name'];
    phone = json['phone'];
    altPhone = json['altPhone'];
    email = json['email'];
    identityNumber = json['identity_number'];
    identityType = json['identity_type'];
    identityImage = json['identity_image'];
    image = json['image'];
    password = json['password'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    authToken = json['auth_token'];
    adhaar = json['adhaar'];
    dlNumber = json['dlNumber'];
    dlExp = json['dlExp'];
    rating = json['rating'];
    runs = json['runs'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['f_name'] = this.fName;
    data['l_name'] = this.lName;
    data['phone'] = this.phone;
    data['altPhone'] = this.altPhone;
    data['email'] = this.email;
    data['identity_number'] = this.identityNumber;
    data['identity_type'] = this.identityType;
    data['identity_image'] = this.identityImage;
    data['image'] = this.image;
    data['password'] = this.password;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['auth_token'] = this.authToken;
    data['adhaar'] = this.adhaar;
    data['dlNumber'] = this.dlNumber;
    data['dlExp'] = this.dlExp;
    data['rating'] = this.rating;
    data['runs'] = this.runs;

    return data;
  }
}
