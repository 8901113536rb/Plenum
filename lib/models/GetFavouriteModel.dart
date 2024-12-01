/// status : true
/// message : "Wishlist retrieved successfully!"
/// data : [{"id":4,"user_id":7,"product_id":1,"created_at":"2024-11-30T06:16:25.000000Z","updated_at":"2024-11-30T06:16:25.000000Z","product":{"id":1,"name":"High-Performance Lubricant X500","price":"150.00","category_id":1,"subcategory_id":1,"packing_size":"5 Liters","packing_type":"Plastic Drum","use_in_segment":"Automotive, Heavy Machinery, Aerospace","description":"A premium-grade lubricant engineered for high-performance and durability. Ideal for reducing friction, preventing corrosion, and ensuring smooth machinery operations in extreme environments. Certified for industrial use.","product_image":"https://adminapp.plenumbiotech.com/storage/app/public/products/1519374525product_image.jfif","visual_aids":["https://adminapp.plenumbiotech.com/storage/app/public/products/aids/1413552132visual_aid.jfif","https://adminapp.plenumbiotech.com/storage/app/public/products/aids/1592886192visual_aid.png"],"created_at":"2024-11-24T04:53:48.000000Z","updated_at":"2024-11-24T05:24:09.000000Z","product_status":"featured"}}]

class GetFavouriteModel {
  GetFavouriteModel({
      bool? status, 
      String? message, 
      List<Data>? data,}){
    _status = status;
    _message = message;
    _data = data;
}

  GetFavouriteModel.fromJson(dynamic json) {
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
GetFavouriteModel copyWith({  bool? status,
  String? message,
  List<Data>? data,
}) => GetFavouriteModel(  status: status ?? _status,
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

/// id : 4
/// user_id : 7
/// product_id : 1
/// created_at : "2024-11-30T06:16:25.000000Z"
/// updated_at : "2024-11-30T06:16:25.000000Z"
/// product : {"id":1,"name":"High-Performance Lubricant X500","price":"150.00","category_id":1,"subcategory_id":1,"packing_size":"5 Liters","packing_type":"Plastic Drum","use_in_segment":"Automotive, Heavy Machinery, Aerospace","description":"A premium-grade lubricant engineered for high-performance and durability. Ideal for reducing friction, preventing corrosion, and ensuring smooth machinery operations in extreme environments. Certified for industrial use.","product_image":"https://adminapp.plenumbiotech.com/storage/app/public/products/1519374525product_image.jfif","visual_aids":["https://adminapp.plenumbiotech.com/storage/app/public/products/aids/1413552132visual_aid.jfif","https://adminapp.plenumbiotech.com/storage/app/public/products/aids/1592886192visual_aid.png"],"created_at":"2024-11-24T04:53:48.000000Z","updated_at":"2024-11-24T05:24:09.000000Z","product_status":"featured"}

class Data {
  Data({
      num? id, 
      num? userId, 
      num? productId, 
      String? createdAt, 
      String? updatedAt, 
      Product? product,}){
    _id = id;
    _userId = userId;
    _productId = productId;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _product = product;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'];
    _productId = json['product_id'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _product = json['product'] != null ? Product.fromJson(json['product']) : null;
  }
  num? _id;
  num? _userId;
  num? _productId;
  String? _createdAt;
  String? _updatedAt;
  Product? _product;
Data copyWith({  num? id,
  num? userId,
  num? productId,
  String? createdAt,
  String? updatedAt,
  Product? product,
}) => Data(  id: id ?? _id,
  userId: userId ?? _userId,
  productId: productId ?? _productId,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  product: product ?? _product,
);
  num? get id => _id;
  num? get userId => _userId;
  num? get productId => _productId;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  Product? get product => _product;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['product_id'] = _productId;
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
/// price : "150.00"
/// category_id : 1
/// subcategory_id : 1
/// packing_size : "5 Liters"
/// packing_type : "Plastic Drum"
/// use_in_segment : "Automotive, Heavy Machinery, Aerospace"
/// description : "A premium-grade lubricant engineered for high-performance and durability. Ideal for reducing friction, preventing corrosion, and ensuring smooth machinery operations in extreme environments. Certified for industrial use."
/// product_image : "https://adminapp.plenumbiotech.com/storage/app/public/products/1519374525product_image.jfif"
/// visual_aids : ["https://adminapp.plenumbiotech.com/storage/app/public/products/aids/1413552132visual_aid.jfif","https://adminapp.plenumbiotech.com/storage/app/public/products/aids/1592886192visual_aid.png"]
/// created_at : "2024-11-24T04:53:48.000000Z"
/// updated_at : "2024-11-24T05:24:09.000000Z"
/// product_status : "featured"

class Product {
  Product({
      num? id, 
      String? name, 
      String? price, 
      num? categoryId, 
      num? subcategoryId, 
      String? packingSize, 
      String? packingType, 
      String? useInSegment, 
      String? description, 
      String? productImage, 
      List<String>? visualAids, 
      String? createdAt, 
      String? updatedAt, 
      String? productStatus,}){
    _id = id;
    _name = name;
    _price = price;
    _categoryId = categoryId;
    _subcategoryId = subcategoryId;
    _packingSize = packingSize;
    _packingType = packingType;
    _useInSegment = useInSegment;
    _description = description;
    _productImage = productImage;
    _visualAids = visualAids;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _productStatus = productStatus;
}

  Product.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _price = json['price'];
    _categoryId = json['category_id'];
    _subcategoryId = json['subcategory_id'];
    _packingSize = json['packing_size'];
    _packingType = json['packing_type'];
    _useInSegment = json['use_in_segment'];
    _description = json['description'];
    _productImage = json['product_image'];
    _visualAids = json['visual_aids'] != null ? json['visual_aids'].cast<String>() : [];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _productStatus = json['product_status'];
  }
  num? _id;
  String? _name;
  String? _price;
  num? _categoryId;
  num? _subcategoryId;
  String? _packingSize;
  String? _packingType;
  String? _useInSegment;
  String? _description;
  String? _productImage;
  List<String>? _visualAids;
  String? _createdAt;
  String? _updatedAt;
  String? _productStatus;
Product copyWith({  num? id,
  String? name,
  String? price,
  num? categoryId,
  num? subcategoryId,
  String? packingSize,
  String? packingType,
  String? useInSegment,
  String? description,
  String? productImage,
  List<String>? visualAids,
  String? createdAt,
  String? updatedAt,
  String? productStatus,
}) => Product(  id: id ?? _id,
  name: name ?? _name,
  price: price ?? _price,
  categoryId: categoryId ?? _categoryId,
  subcategoryId: subcategoryId ?? _subcategoryId,
  packingSize: packingSize ?? _packingSize,
  packingType: packingType ?? _packingType,
  useInSegment: useInSegment ?? _useInSegment,
  description: description ?? _description,
  productImage: productImage ?? _productImage,
  visualAids: visualAids ?? _visualAids,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  productStatus: productStatus ?? _productStatus,
);
  num? get id => _id;
  String? get name => _name;
  String? get price => _price;
  num? get categoryId => _categoryId;
  num? get subcategoryId => _subcategoryId;
  String? get packingSize => _packingSize;
  String? get packingType => _packingType;
  String? get useInSegment => _useInSegment;
  String? get description => _description;
  String? get productImage => _productImage;
  List<String>? get visualAids => _visualAids;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  String? get productStatus => _productStatus;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['price'] = _price;
    map['category_id'] = _categoryId;
    map['subcategory_id'] = _subcategoryId;
    map['packing_size'] = _packingSize;
    map['packing_type'] = _packingType;
    map['use_in_segment'] = _useInSegment;
    map['description'] = _description;
    map['product_image'] = _productImage;
    map['visual_aids'] = _visualAids;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['product_status'] = _productStatus;
    return map;
  }

}