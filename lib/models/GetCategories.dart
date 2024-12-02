class GetCategories {
  GetCategories({
      String? message, 
      bool? status, 
      List<Data>? data,}){
    _message = message;
    _status = status;
    _data = data;
}

  GetCategories.fromJson(dynamic json) {
    _message = json['message'];
    _status = json['status'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }
  String? _message;
  bool? _status;
  List<Data>? _data;
GetCategories copyWith({  String? message,
  bool? status,
  List<Data>? data,
}) => GetCategories(  message: message ?? _message,
  status: status ?? _status,
  data: data ?? _data,
);
  String? get message => _message;
  bool? get status => _status;
  List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    map['status'] = _status;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Data {
  Data({
      num? id, 
      String? name, 
      List<Subcategories>? subcategories,}){
    _id = id;
    _name = name;
    _subcategories = subcategories;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    if (json['subcategories'] != null) {
      _subcategories = [];
      json['subcategories'].forEach((v) {
        _subcategories?.add(Subcategories.fromJson(v));
      });
    }
  }
  num? _id;
  String? _name;
  List<Subcategories>? _subcategories;
Data copyWith({  num? id,
  String? name,
  List<Subcategories>? subcategories,
}) => Data(  id: id ?? _id,
  name: name ?? _name,
  subcategories: subcategories ?? _subcategories,
);
  num? get id => _id;
  String? get name => _name;
  List<Subcategories>? get subcategories => _subcategories;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    if (_subcategories != null) {
      map['subcategories'] = _subcategories?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Subcategories {
  Subcategories({
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

  Subcategories.fromJson(dynamic json) {
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
Subcategories copyWith({  num? id,
  num? categoryId,
  String? subcategoryimage,
  num? sort,
  String? name,
  String? status,
  String? createdAt,
  String? updatedAt,
}) => Subcategories(  id: id ?? _id,
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