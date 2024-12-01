/// status : true
/// data : [{"id":1,"product_id":1,"title":"xcv","description":"xvxcvxcv","created_at":"2024-11-30T07:43:42.000000Z","updated_at":"2024-11-30T07:43:42.000000Z","product":{"id":1,"name":"High-Performance Lubricant X500"}}]

class GetNotificationModel {
  GetNotificationModel({
      bool? status, 
      List<Data>? data,}){
    _status = status;
    _data = data;
}

  GetNotificationModel.fromJson(dynamic json) {
    _status = json['status'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }
  bool? _status;
  List<Data>? _data;
GetNotificationModel copyWith({  bool? status,
  List<Data>? data,
}) => GetNotificationModel(  status: status ?? _status,
  data: data ?? _data,
);
  bool? get status => _status;
  List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 1
/// product_id : 1
/// title : "xcv"
/// description : "xvxcvxcv"
/// created_at : "2024-11-30T07:43:42.000000Z"
/// updated_at : "2024-11-30T07:43:42.000000Z"
/// product : {"id":1,"name":"High-Performance Lubricant X500"}

class Data {
  Data({
      num? id, 
      num? productId, 
      String? title, 
      String? description, 
      String? createdAt, 
      String? updatedAt, 
      Product? product,}){
    _id = id;
    _productId = productId;
    _title = title;
    _description = description;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _product = product;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _productId = json['product_id'];
    _title = json['title'];
    _description = json['description'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _product = json['product'] != null ? Product.fromJson(json['product']) : null;
  }
  num? _id;
  num? _productId;
  String? _title;
  String? _description;
  String? _createdAt;
  String? _updatedAt;
  Product? _product;
Data copyWith({  num? id,
  num? productId,
  String? title,
  String? description,
  String? createdAt,
  String? updatedAt,
  Product? product,
}) => Data(  id: id ?? _id,
  productId: productId ?? _productId,
  title: title ?? _title,
  description: description ?? _description,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  product: product ?? _product,
);
  num? get id => _id;
  num? get productId => _productId;
  String? get title => _title;
  String? get description => _description;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  Product? get product => _product;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['product_id'] = _productId;
    map['title'] = _title;
    map['description'] = _description;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    if (_product != null) {
      map['product'] = _product?.toJson();
    }
    return map;
  }

}

/// id : 1
/// name : "High-Performance Lubricant X500"

class Product {
  Product({
      num? id, 
      String? name,}){
    _id = id;
    _name = name;
}

  Product.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
  }
  num? _id;
  String? _name;
Product copyWith({  num? id,
  String? name,
}) => Product(  id: id ?? _id,
  name: name ?? _name,
);
  num? get id => _id;
  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    return map;
  }

}