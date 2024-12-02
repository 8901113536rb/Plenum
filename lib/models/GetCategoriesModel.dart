/// message : "Listing Successful!"
/// status : true
/// basepath : "https://adminapp.plenumbiotech.com"
/// data : [{"id":1,"name":"Genetics"},{"id":2,"name":"Microbiology"},{"id":3,"name":"Drug Development"},{"id":4,"name":"Pharmacology"},{"id":5,"name":"Patient Care"},{"id":6,"name":"Public Health"},{"id":7,"name":"Health Informatics"},{"id":8,"name":"Diagnostic Equipment"},{"id":9,"name":"Therapeutic Devices"},{"id":10,"name":"Surgical Instruments"}]

class GetCategoriesModel {
  GetCategoriesModel({
      String? message, 
      bool? status, 
      String? basepath, 
      List<Data>? data,}){
    _message = message;
    _status = status;
    _basepath = basepath;
    _data = data;
}

  GetCategoriesModel.fromJson(dynamic json) {
    _message = json['message'];
    _status = json['status'];
    _basepath = json['basepath'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }
  String? _message;
  bool? _status;
  String? _basepath;
  List<Data>? _data;
GetCategoriesModel copyWith({  String? message,
  bool? status,
  String? basepath,
  List<Data>? data,
}) => GetCategoriesModel(  message: message ?? _message,
  status: status ?? _status,
  basepath: basepath ?? _basepath,
  data: data ?? _data,
);
  String? get message => _message;
  bool? get status => _status;
  String? get basepath => _basepath;
  List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    map['status'] = _status;
    map['basepath'] = _basepath;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 1
/// name : "Genetics"

class Data {
  Data({
      num? id, 
      String? name,}){
    _id = id;
    _name = name;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
  }
  num? _id;
  String? _name;
Data copyWith({  num? id,
  String? name,
}) => Data(  id: id ?? _id,
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