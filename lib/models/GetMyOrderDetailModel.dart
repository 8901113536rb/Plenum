/// status : true
/// message : "Order details retrieved successfully!"
/// data : {"id":8,"user_id":7,"address":"{\"id\":3,\"user_id\":7,\"house_number\":\"1469\",\"street\":\"nada sahib\",\"city\":\"Panchkula\",\"state\":\"Haryana\",\"pincode\":\"134109\",\"landmark\":null,\"created_at\":\"2024-11-26T05:06:55.000000Z\",\"updated_at\":\"2024-11-26T05:06:55.000000Z\"}","status":"Pending","created_at":"2024-12-01T11:35:25.000000Z","updated_at":"2024-12-01T11:35:25.000000Z","products":[{"id":8,"order_id":8,"product_id":1,"quantity":2,"price":"150.00","created_at":"2024-12-01T11:35:25.000000Z","updated_at":"2024-12-01T11:35:25.000000Z","product":{"id":1,"name":"High-Performance Lubricant X500","price":"150.00","category_id":1,"subcategory_id":1,"packing_size":"5 Liters","packing_type":"Plastic Drum","use_in_segment":"Automotive, Heavy Machinery, Aerospace","description":"A premium-grade lubricant engineered for high-performance and durability. Ideal for reducing friction, preventing corrosion, and ensuring smooth machinery operations in extreme environments. Certified for industrial use.","product_image":"https://adminapp.plenumbiotech.com/storage/app/public/products/1519374525product_image.jfif","visual_aids":["https://adminapp.plenumbiotech.com/storage/app/public/products/aids/1413552132visual_aid.jfif","https://adminapp.plenumbiotech.com/storage/app/public/products/aids/1592886192visual_aid.png"],"created_at":"2024-11-24T04:53:48.000000Z","updated_at":"2024-11-24T05:24:09.000000Z","product_status":"featured"}}]}

class GetMyOrderDetailModel {
  GetMyOrderDetailModel({
      bool? status, 
      String? message, 
      Data? data,}){
    _status = status;
    _message = message;
    _data = data;
}

  GetMyOrderDetailModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _status;
  String? _message;
  Data? _data;
GetMyOrderDetailModel copyWith({  bool? status,
  String? message,
  Data? data,
}) => GetMyOrderDetailModel(  status: status ?? _status,
  message: message ?? _message,
  data: data ?? _data,
);
  bool? get status => _status;
  String? get message => _message;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}

/// id : 8
/// user_id : 7
/// address : "{\"id\":3,\"user_id\":7,\"house_number\":\"1469\",\"street\":\"nada sahib\",\"city\":\"Panchkula\",\"state\":\"Haryana\",\"pincode\":\"134109\",\"landmark\":null,\"created_at\":\"2024-11-26T05:06:55.000000Z\",\"updated_at\":\"2024-11-26T05:06:55.000000Z\"}"
/// status : "Pending"
/// created_at : "2024-12-01T11:35:25.000000Z"
/// updated_at : "2024-12-01T11:35:25.000000Z"
/// products : [{"id":8,"order_id":8,"product_id":1,"quantity":2,"price":"150.00","created_at":"2024-12-01T11:35:25.000000Z","updated_at":"2024-12-01T11:35:25.000000Z","product":{"id":1,"name":"High-Performance Lubricant X500","price":"150.00","category_id":1,"subcategory_id":1,"packing_size":"5 Liters","packing_type":"Plastic Drum","use_in_segment":"Automotive, Heavy Machinery, Aerospace","description":"A premium-grade lubricant engineered for high-performance and durability. Ideal for reducing friction, preventing corrosion, and ensuring smooth machinery operations in extreme environments. Certified for industrial use.","product_image":"https://adminapp.plenumbiotech.com/storage/app/public/products/1519374525product_image.jfif","visual_aids":["https://adminapp.plenumbiotech.com/storage/app/public/products/aids/1413552132visual_aid.jfif","https://adminapp.plenumbiotech.com/storage/app/public/products/aids/1592886192visual_aid.png"],"created_at":"2024-11-24T04:53:48.000000Z","updated_at":"2024-11-24T05:24:09.000000Z","product_status":"featured"}}]

class Data {
  Data({
      num? id, 
      num? userId, 
      String? address, 
      String? status, 
      String? createdAt, 
      String? updatedAt, 
      List<Products>? products,}){
    _id = id;
    _userId = userId;
    _address = address;
    _status = status;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _products = products;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'];
    _address = json['address'];
    _status = json['status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    if (json['products'] != null) {
      _products = [];
      json['products'].forEach((v) {
        _products?.add(Products.fromJson(v));
      });
    }
  }
  num? _id;
  num? _userId;
  String? _address;
  String? _status;
  String? _createdAt;
  String? _updatedAt;
  List<Products>? _products;
Data copyWith({  num? id,
  num? userId,
  String? address,
  String? status,
  String? createdAt,
  String? updatedAt,
  List<Products>? products,
}) => Data(  id: id ?? _id,
  userId: userId ?? _userId,
  address: address ?? _address,
  status: status ?? _status,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  products: products ?? _products,
);
  num? get id => _id;
  num? get userId => _userId;
  String? get address => _address;
  String? get status => _status;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  List<Products>? get products => _products;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['address'] = _address;
    map['status'] = _status;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    if (_products != null) {
      map['products'] = _products?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 8
/// order_id : 8
/// product_id : 1
/// quantity : 2
/// price : "150.00"
/// created_at : "2024-12-01T11:35:25.000000Z"
/// updated_at : "2024-12-01T11:35:25.000000Z"
/// product : {"id":1,"name":"High-Performance Lubricant X500","price":"150.00","category_id":1,"subcategory_id":1,"packing_size":"5 Liters","packing_type":"Plastic Drum","use_in_segment":"Automotive, Heavy Machinery, Aerospace","description":"A premium-grade lubricant engineered for high-performance and durability. Ideal for reducing friction, preventing corrosion, and ensuring smooth machinery operations in extreme environments. Certified for industrial use.","product_image":"https://adminapp.plenumbiotech.com/storage/app/public/products/1519374525product_image.jfif","visual_aids":["https://adminapp.plenumbiotech.com/storage/app/public/products/aids/1413552132visual_aid.jfif","https://adminapp.plenumbiotech.com/storage/app/public/products/aids/1592886192visual_aid.png"],"created_at":"2024-11-24T04:53:48.000000Z","updated_at":"2024-11-24T05:24:09.000000Z","product_status":"featured"}

class Products {
  Products({
      num? id, 
      num? orderId, 
      num? productId, 
      num? quantity, 
      String? price, 
      String? createdAt, 
      String? updatedAt, 
      Product? product,}){
    _id = id;
    _orderId = orderId;
    _productId = productId;
    _quantity = quantity;
    _price = price;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _product = product;
}

  Products.fromJson(dynamic json) {
    _id = json['id'];
    _orderId = json['order_id'];
    _productId = json['product_id'];
    _quantity = json['quantity'];
    _price = json['price'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _product = json['product'] != null ? Product.fromJson(json['product']) : null;
  }
  num? _id;
  num? _orderId;
  num? _productId;
  num? _quantity;
  String? _price;
  String? _createdAt;
  String? _updatedAt;
  Product? _product;
Products copyWith({  num? id,
  num? orderId,
  num? productId,
  num? quantity,
  String? price,
  String? createdAt,
  String? updatedAt,
  Product? product,
}) => Products(  id: id ?? _id,
  orderId: orderId ?? _orderId,
  productId: productId ?? _productId,
  quantity: quantity ?? _quantity,
  price: price ?? _price,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  product: product ?? _product,
);
  num? get id => _id;
  num? get orderId => _orderId;
  num? get productId => _productId;
  num? get quantity => _quantity;
  String? get price => _price;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  Product? get product => _product;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['order_id'] = _orderId;
    map['product_id'] = _productId;
    map['quantity'] = _quantity;
    map['price'] = _price;
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