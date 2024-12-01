/// message : "Listing Successful!"
/// status : true
/// basepath : "https://adminapp.plenumbiotech.com"
/// data : [{"id":1,"image":"https://adminapp.plenumbiotech.com/storage/app/public/banner/1549773431banner.jpg"},{"id":3,"image":"https://adminapp.plenumbiotech.com/storage/app/public/banner/1162310348banner.jpg"},{"id":11,"image":"https://adminapp.plenumbiotech.com/storage/app/public/banner/536774551authorimage.jpg"}]

class GetBannerModel {
  GetBannerModel({
      String? message, 
      bool? status, 
      String? basepath, 
      List<Data>? data,}){
    _message = message;
    _status = status;
    _basepath = basepath;
    _data = data;
}

  GetBannerModel.fromJson(dynamic json) {
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
GetBannerModel copyWith({  String? message,
  bool? status,
  String? basepath,
  List<Data>? data,
}) => GetBannerModel(  message: message ?? _message,
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
/// image : "https://adminapp.plenumbiotech.com/storage/app/public/banner/1549773431banner.jpg"

class Data {
  Data({
      num? id, 
      String? image,}){
    _id = id;
    _image = image;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _image = json['image'];
  }
  num? _id;
  String? _image;
Data copyWith({  num? id,
  String? image,
}) => Data(  id: id ?? _id,
  image: image ?? _image,
);
  num? get id => _id;
  String? get image => _image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['image'] = _image;
    return map;
  }

}