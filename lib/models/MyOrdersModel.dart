class MyOrdersModel {
  MyOrdersModel({
      bool? status, 
      String? message, 
      ProductData? productData,}){
    _status = status;
    _message = message;
    _productData = productData;
}

  MyOrdersModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _productData = json['productData'] != null ? ProductData.fromJson(json['productData']) : null;
  }
  bool? _status;
  String? _message;
  ProductData? _productData;
MyOrdersModel copyWith({  bool? status,
  String? message,
  ProductData? productData,
}) => MyOrdersModel(  status: status ?? _status,
  message: message ?? _message,
  productData: productData ?? _productData,
);
  bool? get status => _status;
  String? get message => _message;
  ProductData? get productData => _productData;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_productData != null) {
      map['productData'] = _productData?.toJson();
    }
    return map;
  }

}

class ProductData {
  ProductData({
      num? currentPage, 
      List<Data>? data, 
      String? firstPageUrl, 
      num? from, 
      num? lastPage, 
      String? lastPageUrl, 
      List<Links>? links, 
      dynamic nextPageUrl, 
      String? path, 
      num? perPage, 
      dynamic prevPageUrl, 
      num? to, 
      num? total,}){
    _currentPage = currentPage;
    _data = data;
    _firstPageUrl = firstPageUrl;
    _from = from;
    _lastPage = lastPage;
    _lastPageUrl = lastPageUrl;
    _links = links;
    _nextPageUrl = nextPageUrl;
    _path = path;
    _perPage = perPage;
    _prevPageUrl = prevPageUrl;
    _to = to;
    _total = total;
}

  ProductData.fromJson(dynamic json) {
    _currentPage = json['current_page'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
    _firstPageUrl = json['first_page_url'];
    _from = json['from'];
    _lastPage = json['last_page'];
    _lastPageUrl = json['last_page_url'];
    if (json['links'] != null) {
      _links = [];
      json['links'].forEach((v) {
        _links?.add(Links.fromJson(v));
      });
    }
    _nextPageUrl = json['next_page_url'];
    _path = json['path'];
    _perPage = json['per_page'];
    _prevPageUrl = json['prev_page_url'];
    _to = json['to'];
    _total = json['total'];
  }
  num? _currentPage;
  List<Data>? _data;
  String? _firstPageUrl;
  num? _from;
  num? _lastPage;
  String? _lastPageUrl;
  List<Links>? _links;
  dynamic _nextPageUrl;
  String? _path;
  num? _perPage;
  dynamic _prevPageUrl;
  num? _to;
  num? _total;
ProductData copyWith({  num? currentPage,
  List<Data>? data,
  String? firstPageUrl,
  num? from,
  num? lastPage,
  String? lastPageUrl,
  List<Links>? links,
  dynamic nextPageUrl,
  String? path,
  num? perPage,
  dynamic prevPageUrl,
  num? to,
  num? total,
}) => ProductData(  currentPage: currentPage ?? _currentPage,
  data: data ?? _data,
  firstPageUrl: firstPageUrl ?? _firstPageUrl,
  from: from ?? _from,
  lastPage: lastPage ?? _lastPage,
  lastPageUrl: lastPageUrl ?? _lastPageUrl,
  links: links ?? _links,
  nextPageUrl: nextPageUrl ?? _nextPageUrl,
  path: path ?? _path,
  perPage: perPage ?? _perPage,
  prevPageUrl: prevPageUrl ?? _prevPageUrl,
  to: to ?? _to,
  total: total ?? _total,
);
  num? get currentPage => _currentPage;
  List<Data>? get data => _data;
  String? get firstPageUrl => _firstPageUrl;
  num? get from => _from;
  num? get lastPage => _lastPage;
  String? get lastPageUrl => _lastPageUrl;
  List<Links>? get links => _links;
  dynamic get nextPageUrl => _nextPageUrl;
  String? get path => _path;
  num? get perPage => _perPage;
  dynamic get prevPageUrl => _prevPageUrl;
  num? get to => _to;
  num? get total => _total;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['current_page'] = _currentPage;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    map['first_page_url'] = _firstPageUrl;
    map['from'] = _from;
    map['last_page'] = _lastPage;
    map['last_page_url'] = _lastPageUrl;
    if (_links != null) {
      map['links'] = _links?.map((v) => v.toJson()).toList();
    }
    map['next_page_url'] = _nextPageUrl;
    map['path'] = _path;
    map['per_page'] = _perPage;
    map['prev_page_url'] = _prevPageUrl;
    map['to'] = _to;
    map['total'] = _total;
    return map;
  }

}

class Links {
  Links({
      dynamic url, 
      String? label, 
      bool? active,}){
    _url = url;
    _label = label;
    _active = active;
}

  Links.fromJson(dynamic json) {
    _url = json['url'];
    _label = json['label'];
    _active = json['active'];
  }
  dynamic _url;
  String? _label;
  bool? _active;
Links copyWith({  dynamic url,
  String? label,
  bool? active,
}) => Links(  url: url ?? _url,
  label: label ?? _label,
  active: active ?? _active,
);
  dynamic get url => _url;
  String? get label => _label;
  bool? get active => _active;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['url'] = _url;
    map['label'] = _label;
    map['active'] = _active;
    return map;
  }

}

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