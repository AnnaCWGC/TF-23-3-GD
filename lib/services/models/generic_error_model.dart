class GenericErrorModel {
  GenericErrorModel({
    this.message,
    this.data,
    this.token,
  });
  late final Message? message;
  late final List<dynamic>? data;
  late final Null token;

  GenericErrorModel.fromJson(Map<String, dynamic> json) {
    message = Message.fromJson(json['message']);
    data = List.castFrom<dynamic, dynamic>(json['data']);
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['message'] = message!.toJson();
    _data['data'] = data;
    _data['token'] = token;
    return _data;
  }
}

class Message {
  Message({
    required this.code,
    required this.message,
  });
  late final String code;
  late final String message;

  Message.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['code'] = code;
    _data['message'] = message;
    return _data;
  }
}
