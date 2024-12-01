/// data : [{"id":1,"name":"High-Performance Lubricant X500","price":"150.00","category_id":1,"subcategory_id":1,"packing_size":"5 Liters","packing_type":"Plastic Drum","use_in_segment":"Automotive, Heavy Machinery, Aerospace","description":"A premium-grade lubricant engineered for high-performance and durability. Ideal for reducing friction, preventing corrosion, and ensuring smooth machinery operations in extreme environments. Certified for industrial use.","product_image":"https://adminapp.plenumbiotech.com/storage/app/public/products/1519374525product_image.jfif","visual_aids":["https://adminapp.plenumbiotech.com/storage/app/public/products/aids/1413552132visual_aid.jfif","https://adminapp.plenumbiotech.com/storage/app/public/products/aids/1592886192visual_aid.png"],"created_at":"2024-11-24T04:53:48.000000Z","updated_at":"2024-12-01T06:14:49.000000Z","product_status":"new_launches","inWishlist":false,"category":{"id":1,"sort":1,"name":"Biotechnology","status":"active","created_at":"2024-11-24T07:38:38.000000Z","updated_at":"2024-11-30T07:06:29.000000Z","deleted_at":"2024-11-24 07:38:38"},"subcategory":{"id":1,"category_id":1,"subcategoryimage":"/storage/app/public/subcategory/1322713001subcategory","sort":1,"name":"Genetics","status":"active","created_at":"2024-11-24T07:39:06.000000Z","updated_at":"2024-11-29T05:06:49.000000Z"}}]

class GetNewLaunchingModel {
  GetNewLaunchingModel({
      List<Data>? data,}){
    _data = data;
}

  GetNewLaunchingModel.fromJson(dynamic json) {
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }
  List<Data>? _data;
GetNewLaunchingModel copyWith({  List<Data>? data,
}) => GetNewLaunchingModel(  data: data ?? _data,
);
  List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
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
/// updated_at : "2024-12-01T06:14:49.000000Z"
/// product_status : "new_launches"
/// inWishlist : false
/// category : {"id":1,"sort":1,"name":"Biotechnology","status":"active","created_at":"2024-11-24T07:38:38.000000Z","updated_at":"2024-11-30T07:06:29.000000Z","deleted_at":"2024-11-24 07:38:38"}
/// subcategory : {"id":1,"category_id":1,"subcategoryimage":"/storage/app/public/subcategory/1322713001subcategory","sort":1,"name":"Genetics","status":"active","created_at":"2024-11-24T07:39:06.000000Z","updated_at":"2024-11-29T05:06:49.000000Z"}

class Data {
  Data({
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
      String? productStatus, 
      bool? inWishlist, 
      Category? category, 
      Subcategory? subcategory,}){
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
    _inWishlist = inWishlist;
    _category = category;
    _subcategory = subcategory;
}

  Data.fromJson(dynamic json) {
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
    _inWishlist = json['inWishlist'];
    _category = json['category'] != null ? Category.fromJson(json['category']) : null;
    _subcategory = json['subcategory'] != null ? Subcategory.fromJson(json['subcategory']) : null;
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
  bool? _inWishlist;
  Category? _category;
  Subcategory? _subcategory;
Data copyWith({  num? id,
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
  bool? inWishlist,
  Category? category,
  Subcategory? subcategory,
}) => Data(  id: id ?? _id,
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
  inWishlist: inWishlist ?? _inWishlist,
  category: category ?? _category,
  subcategory: subcategory ?? _subcategory,
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
  bool? get inWishlist => _inWishlist;
  Category? get category => _category;
  Subcategory? get subcategory => _subcategory;

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
    map['inWishlist'] = _inWishlist;
    if (_category != null) {
      map['category'] = _category?.toJson();
    }
    if (_subcategory != null) {
      map['subcategory'] = _subcategory?.toJson();
    }
    return map;
  }

}

/// id : 1
/// category_id : 1
/// subcategoryimage : "/storage/app/public/subcategory/1322713001subcategory"
/// sort : 1
/// name : "Genetics"
/// status : "active"
/// created_at : "2024-11-24T07:39:06.000000Z"
/// updated_at : "2024-11-29T05:06:49.000000Z"

class Subcategory {
  Subcategory({
      num? id, 
      num? categoryId, 
      String? subcategoryimage, 
      num? sort, 
      String? name, 
      String? status, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _categoryId = categoryId;
    _subcategoryimage = subcategoryimage;
    _sort = sort;
    _name = name;
    _status = status;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Subcategory.fromJson(dynamic json) {
    _id = json['id'];
    _categoryId = json['category_id'];
    _subcategoryimage = json['subcategoryimage'];
    _sort = json['sort'];
    _name = json['name'];
    _status = json['status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  num? _categoryId;
  String? _subcategoryimage;
  num? _sort;
  String? _name;
  String? _status;
  String? _createdAt;
  String? _updatedAt;
Subcategory copyWith({  num? id,
  num? categoryId,
  String? subcategoryimage,
  num? sort,
  String? name,
  String? status,
  String? createdAt,
  String? updatedAt,
}) => Subcategory(  id: id ?? _id,
  categoryId: categoryId ?? _categoryId,
  subcategoryimage: subcategoryimage ?? _subcategoryimage,
  sort: sort ?? _sort,
  name: name ?? _name,
  status: status ?? _status,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  num? get id => _id;
  num? get categoryId => _categoryId;
  String? get subcategoryimage => _subcategoryimage;
  num? get sort => _sort;
  String? get name => _name;
  String? get status => _status;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['category_id'] = _categoryId;
    map['subcategoryimage'] = _subcategoryimage;
    map['sort'] = _sort;
    map['name'] = _name;
    map['status'] = _status;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}

/// id : 1
/// sort : 1
/// name : "Biotechnology"
/// status : "active"
/// created_at : "2024-11-24T07:38:38.000000Z"
/// updated_at : "2024-11-30T07:06:29.000000Z"
/// deleted_at : "2024-11-24 07:38:38"

class Category {
  Category({
      num? id, 
      num? sort, 
      String? name, 
      String? status, 
      String? createdAt, 
      String? updatedAt, 
      String? deletedAt,}){
    _id = id;
    _sort = sort;
    _name = name;
    _status = status;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _deletedAt = deletedAt;
}

  Category.fromJson(dynamic json) {
    _id = json['id'];
    _sort = json['sort'];
    _name = json['name'];
    _status = json['status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _deletedAt = json['deleted_at'];
  }
  num? _id;
  num? _sort;
  String? _name;
  String? _status;
  String? _createdAt;
  String? _updatedAt;
  String? _deletedAt;
Category copyWith({  num? id,
  num? sort,
  String? name,
  String? status,
  String? createdAt,
  String? updatedAt,
  String? deletedAt,
}) => Category(  id: id ?? _id,
  sort: sort ?? _sort,
  name: name ?? _name,
  status: status ?? _status,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  deletedAt: deletedAt ?? _deletedAt,
);
  num? get id => _id;
  num? get sort => _sort;
  String? get name => _name;
  String? get status => _status;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  String? get deletedAt => _deletedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['sort'] = _sort;
    map['name'] = _name;
    map['status'] = _status;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['deleted_at'] = _deletedAt;
    return map;
  }

}