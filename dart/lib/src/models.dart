/// Response models for the Human Name Parser API.

/// API Response wrapper.
class HumannameparserResponse {
  final String status;
  final dynamic error;
  final HumannameparserData? data;

  HumannameparserResponse({
    required this.status,
    this.error,
    this.data,
  });

  factory HumannameparserResponse.fromJson(Map<String, dynamic> json) => HumannameparserResponse(
    status: json['status'] as String? ?? '',
    error: json['error'],
    data: json['data'] != null ? HumannameparserData.fromJson(json['data']) : null,
  );

  Map<String, dynamic> toJson() => {
    'status': status,
    if (error != null) 'error': error,
    if (data != null) 'data': data,
  };
}

/// Response data for the Human Name Parser API.

class HumannameparserData {
  String? name;
  HumannameparserDataParsed? parsed;

  HumannameparserData({
    this.name,
    this.parsed,
  });

  factory HumannameparserData.fromJson(Map<String, dynamic> json) => HumannameparserData(
      name: json['name'],
      parsed: json['parsed'] != null ? HumannameparserDataParsed.fromJson(json['parsed']) : null,
    );
}

class HumannameparserDataParsed {
  String? title;
  String? first;
  String? middle;
  String? last;
  String? nick;
  String? suffix;

  HumannameparserDataParsed({
    this.title,
    this.first,
    this.middle,
    this.last,
    this.nick,
    this.suffix,
  });

  factory HumannameparserDataParsed.fromJson(Map<String, dynamic> json) => HumannameparserDataParsed(
      title: json['title'],
      first: json['first'],
      middle: json['middle'],
      last: json['last'],
      nick: json['nick'],
      suffix: json['suffix'],
    );
}

class HumannameparserRequest {
  String name;

  HumannameparserRequest({
    required this.name,
  });

  Map<String, dynamic> toJson() => {
      'name': name,
    };
}
