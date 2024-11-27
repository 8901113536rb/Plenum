/// success : true
/// data : {"id":7,"first_name":"pooja","last_name":"rani","email":"poojaodd2001@gmail.com","phone":"9350083544","image":"/storage/app/public/profile_images/orRe4WhlFlJWPptXsdmDmuaUEmUgJaHlH6OYXm5i.jpg","user_type":null,"otp":null,"is_verified":1,"created_at":"2024-11-26T05:06:55.000000Z","updated_at":"2024-11-26T11:26:55.000000Z","addresses":[{"id":3,"user_id":7,"house_number":"1469","street":"nada sahib","city":"Panchkula","state":"Haryana","pincode":"134109","landmark":null,"created_at":"2024-11-26T05:06:55.000000Z","updated_at":"2024-11-26T05:06:55.000000Z"}]}

class GetprofileModel {
  GetprofileModel({
      bool? success, 
      Data? data,}){
    _success = success;
    _data = data;
}

  GetprofileModel.fromJson(dynamic json) {
    _success = json['success'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _success;
  Data? _data;
GetprofileModel copyWith({  bool? success,
  Data? data,
}) => GetprofileModel(  success: success ?? _success,
  data: data ?? _data,
);
  bool? get success => _success;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}

/// id : 7
/// first_name : "pooja"
/// last_name : "rani"
/// email : "poojaodd2001@gmail.com"
/// phone : "9350083544"
/// image : "/storage/app/public/profile_images/orRe4WhlFlJWPptXsdmDmuaUEmUgJaHlH6OYXm5i.jpg"
/// user_type : null
/// otp : null
/// is_verified : 1
/// created_at : "2024-11-26T05:06:55.000000Z"
/// updated_at : "2024-11-26T11:26:55.000000Z"
/// addresses : [{"id":3,"user_id":7,"house_number":"1469","street":"nada sahib","city":"Panchkula","state":"Haryana","pincode":"134109","landmark":null,"created_at":"2024-11-26T05:06:55.000000Z","updated_at":"2024-11-26T05:06:55.000000Z"}]

class Data {
  Data({
      num? id, 
      String? firstName, 
      String? lastName, 
      String? email, 
      String? phone, 
      String? image, 
      dynamic userType, 
      dynamic otp, 
      num? isVerified, 
      String? createdAt, 
      String? updatedAt, 
      List<Addresses>? addresses,}){
    _id = id;
    _firstName = firstName;
    _lastName = lastName;
    _email = email;
    _phone = phone;
    _image = image;
    _userType = userType;
    _otp = otp;
    _isVerified = isVerified;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _addresses = addresses;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _firstName = json['first_name'];
    _lastName = json['last_name'];
    _email = json['email'];
    _phone = json['phone'];
    _image = json['image'];
    _userType = json['user_type'];
    _otp = json['otp'];
    _isVerified = json['is_verified'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    if (json['addresses'] != null) {
      _addresses = [];
      json['addresses'].forEach((v) {
        _addresses?.add(Addresses.fromJson(v));
      });
    }
  }
  num? _id;
  String? _firstName;
  String? _lastName;
  String? _email;
  String? _phone;
  String? _image;
  dynamic _userType;
  dynamic _otp;
  num? _isVerified;
  String? _createdAt;
  String? _updatedAt;
  List<Addresses>? _addresses;
Data copyWith({  num? id,
  String? firstName,
  String? lastName,
  String? email,
  String? phone,
  String? image,
  dynamic userType,
  dynamic otp,
  num? isVerified,
  String? createdAt,
  String? updatedAt,
  List<Addresses>? addresses,
}) => Data(  id: id ?? _id,
  firstName: firstName ?? _firstName,
  lastName: lastName ?? _lastName,
  email: email ?? _email,
  phone: phone ?? _phone,
  image: image ?? _image,
  userType: userType ?? _userType,
  otp: otp ?? _otp,
  isVerified: isVerified ?? _isVerified,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  addresses: addresses ?? _addresses,
);
  num? get id => _id;
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get email => _email;
  String? get phone => _phone;
  String? get image => _image;
  dynamic get userType => _userType;
  dynamic get otp => _otp;
  num? get isVerified => _isVerified;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  List<Addresses>? get addresses => _addresses;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['first_name'] = _firstName;
    map['last_name'] = _lastName;
    map['email'] = _email;
    map['phone'] = _phone;
    map['image'] = _image;
    map['user_type'] = _userType;
    map['otp'] = _otp;
    map['is_verified'] = _isVerified;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    if (_addresses != null) {
      map['addresses'] = _addresses?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 3
/// user_id : 7
/// house_number : "1469"
/// street : "nada sahib"
/// city : "Panchkula"
/// state : "Haryana"
/// pincode : "134109"
/// landmark : null
/// created_at : "2024-11-26T05:06:55.000000Z"
/// updated_at : "2024-11-26T05:06:55.000000Z"

class Addresses {
  Addresses({
      num? id, 
      num? userId, 
      String? houseNumber, 
      String? street, 
      String? city, 
      String? state, 
      String? pincode, 
      dynamic landmark, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _userId = userId;
    _houseNumber = houseNumber;
    _street = street;
    _city = city;
    _state = state;
    _pincode = pincode;
    _landmark = landmark;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Addresses.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'];
    _houseNumber = json['house_number'];
    _street = json['street'];
    _city = json['city'];
    _state = json['state'];
    _pincode = json['pincode'];
    _landmark = json['landmark'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  num? _userId;
  String? _houseNumber;
  String? _street;
  String? _city;
  String? _state;
  String? _pincode;
  dynamic _landmark;
  String? _createdAt;
  String? _updatedAt;
Addresses copyWith({  num? id,
  num? userId,
  String? houseNumber,
  String? street,
  String? city,
  String? state,
  String? pincode,
  dynamic landmark,
  String? createdAt,
  String? updatedAt,
}) => Addresses(  id: id ?? _id,
  userId: userId ?? _userId,
  houseNumber: houseNumber ?? _houseNumber,
  street: street ?? _street,
  city: city ?? _city,
  state: state ?? _state,
  pincode: pincode ?? _pincode,
  landmark: landmark ?? _landmark,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  num? get id => _id;
  num? get userId => _userId;
  String? get houseNumber => _houseNumber;
  String? get street => _street;
  String? get city => _city;
  String? get state => _state;
  String? get pincode => _pincode;
  dynamic get landmark => _landmark;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['house_number'] = _houseNumber;
    map['street'] = _street;
    map['city'] = _city;
    map['state'] = _state;
    map['pincode'] = _pincode;
    map['landmark'] = _landmark;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}