class GetAboutUs {
  GetAboutUs({
      String? message, 
      bool? status, 
      Data? data,}){
    _message = message;
    _status = status;
    _data = data;
}

  GetAboutUs.fromJson(dynamic json) {
    _message = json['message'];
    _status = json['status'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? _message;
  bool? _status;
  Data? _data;
GetAboutUs copyWith({  String? message,
  bool? status,
  Data? data,
}) => GetAboutUs(  message: message ?? _message,
  status: status ?? _status,
  data: data ?? _data,
);
  String? get message => _message;
  bool? get status => _status;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    map['status'] = _status;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}

class Data {
  Data({
      num? id, 
      String? icon, 
      String? title, 
      String? bannerImg, 
      String? createdAt, 
      String? updatedAt, 
      String? description, 
      String? driveUrl, 
      String? about,}){
    _id = id;
    _icon = icon;
    _title = title;
    _bannerImg = bannerImg;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _description = description;
    _driveUrl = driveUrl;
    _about = about;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _icon = json['icon'];
    _title = json['title'];
    _bannerImg = json['bannerImg'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _description = json['description'];
    _driveUrl = json['drive_url'];
    _about = json['about'];
  }
  num? _id;
  String? _icon;
  String? _title;
  String? _bannerImg;
  String? _createdAt;
  String? _updatedAt;
  String? _description;
  String? _driveUrl;
  String? _about;
Data copyWith({  num? id,
  String? icon,
  String? title,
  String? bannerImg,
  String? createdAt,
  String? updatedAt,
  String? description,
  String? driveUrl,
  String? about,
}) => Data(  id: id ?? _id,
  icon: icon ?? _icon,
  title: title ?? _title,
  bannerImg: bannerImg ?? _bannerImg,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  description: description ?? _description,
  driveUrl: driveUrl ?? _driveUrl,
  about: about ?? _about,
);
  num? get id => _id;
  String? get icon => _icon;
  String? get title => _title;
  String? get bannerImg => _bannerImg;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  String? get description => _description;
  String? get driveUrl => _driveUrl;
  String? get about => _about;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['icon'] = _icon;
    map['title'] = _title;
    map['bannerImg'] = _bannerImg;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['description'] = _description;
    map['drive_url'] = _driveUrl;
    map['about'] = _about;
    return map;
  }

}