/// status : true
/// message : "Addresses retrieved successfully!"
/// data : [{"id":3,"user_id":7,"house_number":"1469","street":"nada sahib","city":"Panchkula","state":"Haryana","pincode":"134109","landmark":null,"created_at":"2024-11-26T05:06:55.000000Z","updated_at":"2024-11-26T05:06:55.000000Z"}]

class GetaddressModel {
  GetaddressModel({
      bool? status, 
      String? message, 
      List<Data>? data,}){
    _status = status;
    _message = message;
    _data = data;
}

  GetaddressModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }
  bool? _status;
  String? _message;
  List<Data>? _data;
GetaddressModel copyWith({  bool? status,
  String? message,
  List<Data>? data,
}) => GetaddressModel(  status: status ?? _status,
  message: message ?? _message,
  data: data ?? _data,
);
  bool? get status => _status;
  String? get message => _message;
  List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
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

class Data {
  Data({
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

  Data.fromJson(dynamic json) {
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
Data copyWith({  num? id,
  num? userId,
  String? houseNumber,
  String? street,
  String? city,
  String? state,
  String? pincode,
  dynamic landmark,
  String? createdAt,
  String? updatedAt,
}) => Data(  id: id ?? _id,
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