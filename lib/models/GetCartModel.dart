class GetCartModel {
  GetCartModel({
      bool? status, 
      String? message, 
      List<ProductData>? productData,}){
    _status = status;
    _message = message;
    _productData = productData;
}

  GetCartModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    if (json['productData'] != null) {
      _productData = [];
      json['productData'].forEach((v) {
        _productData?.add(ProductData.fromJson(v));
      });
    }
  }
  bool? _status;
  String? _message;
  List<ProductData>? _productData;
GetCartModel copyWith({  bool? status,
  String? message,
  List<ProductData>? productData,
}) => GetCartModel(  status: status ?? _status,
  message: message ?? _message,
  productData: productData ?? _productData,
);
  bool? get status => _status;
  String? get message => _message;
  List<ProductData>? get productData => _productData;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_productData != null) {
      map['productData'] = _productData?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class ProductData {
  ProductData({
      num? id, 
      num? userId, 
      num? productId, 
      num? quantity, 
      String? createdAt, 
      String? updatedAt, 
      Product? product,}){
    _id = id;
    _userId = userId;
    _productId = productId;
    _quantity = quantity;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _product = product;
}

  ProductData.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'];
    _productId = json['product_id'];
    _quantity = json['quantity'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _product = json['product'] != null ? Product.fromJson(json['product']) : null;
  }
  num? _id;
  num? _userId;
  num? _productId;
  num? _quantity;
  String? _createdAt;
  String? _updatedAt;
  Product? _product;
ProductData copyWith({  num? id,
  num? userId,
  num? productId,
  num? quantity,
  String? createdAt,
  String? updatedAt,
  Product? product,
}) => ProductData(  id: id ?? _id,
  userId: userId ?? _userId,
  productId: productId ?? _productId,
  quantity: quantity ?? _quantity,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  product: product ?? _product,
);
  num? get id => _id;
  num? get userId => _userId;
  num? get productId => _productId;
  num? get quantity => _quantity;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  Product? get product => _product;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['product_id'] = _productId;
    map['quantity'] = _quantity;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    if (_product != null) {
      map['product'] = _product?.toJson();
    }
    return map;
  }

}

class Product {
  Product({
      num? id, 
      String? name, 
      String? price, 
      num? categoryId, 
      num? subcategoryId, 
      String? packingSize, 
      String? packingType, 
      dynamic useInSegment, 
      String? description, 
      String? productImage, 
      dynamic visualAids, 
      String? createdAt, 
      String? updatedAt, 
      dynamic productStatus,}){
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
    _visualAids = json['visual_aids'];
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
  dynamic _useInSegment;
  String? _description;
  String? _productImage;
  dynamic _visualAids;
  String? _createdAt;
  String? _updatedAt;
  dynamic _productStatus;
Product copyWith({  num? id,
  String? name,
  String? price,
  num? categoryId,
  num? subcategoryId,
  String? packingSize,
  String? packingType,
  dynamic useInSegment,
  String? description,
  String? productImage,
  dynamic visualAids,
  String? createdAt,
  String? updatedAt,
  dynamic productStatus,
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
  dynamic get useInSegment => _useInSegment;
  String? get description => _description;
  String? get productImage => _productImage;
  dynamic get visualAids => _visualAids;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  dynamic get productStatus => _productStatus;

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