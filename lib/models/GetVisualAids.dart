/// status : true
/// message : "Visual aids retrieved successfully!"
/// visual_aids : ["https://adminapp.plenumbiotech.com/storage/app/public/products/aids/1413552132visual_aid.jfif","https://adminapp.plenumbiotech.com/storage/app/public/products/aids/1592886192visual_aid.png"]

class GetVisualAids {
  GetVisualAids({
      bool? status, 
      String? message, 
      List<String>? visualAids,}){
    _status = status;
    _message = message;
    _visualAids = visualAids;
}

  GetVisualAids.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _visualAids = json['visual_aids'] != null ? json['visual_aids'].cast<String>() : [];
  }
  bool? _status;
  String? _message;
  List<String>? _visualAids;
GetVisualAids copyWith({  bool? status,
  String? message,
  List<String>? visualAids,
}) => GetVisualAids(  status: status ?? _status,
  message: message ?? _message,
  visualAids: visualAids ?? _visualAids,
);
  bool? get status => _status;
  String? get message => _message;
  List<String>? get visualAids => _visualAids;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    map['visual_aids'] = _visualAids;
    return map;
  }

}