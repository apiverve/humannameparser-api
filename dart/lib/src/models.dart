/// Response models for the Human Name Parser API.

/// API Response wrapper.
class HumannameparserResponse {
  final String status;
  final dynamic error;
  final HumannameparserData? data;

  /// Set only when the current plan locks one or more fields; null otherwise.
  final PremiumInfo? premium;

  HumannameparserResponse({
    required this.status,
    this.error,
    this.data,
    this.premium,
  });

  factory HumannameparserResponse.fromJson(Map<String, dynamic> json) => HumannameparserResponse(
    status: json['status'] as String? ?? '',
    error: json['error'],
    data: json['data'] != null ? HumannameparserData.fromJson(json['data']) : null,
    premium: json['premium'] != null ? PremiumInfo.fromJson(json['premium']) : null,
  );

  Map<String, dynamic> toJson() => {
    'status': status,
    if (error != null) 'error': error,
    if (data != null) 'data': data,
    if (premium != null) 'premium': premium!.toJson(),
  };
}

/// Describes fields the current plan does not unlock. Locked fields arrive as null
/// in [data], and [lockedFields] names them (nested ones use dot paths).
class PremiumInfo {
  final String? message;
  final String? upgradeUrl;
  final List<String>? lockedFields;

  PremiumInfo({this.message, this.upgradeUrl, this.lockedFields});

  factory PremiumInfo.fromJson(Map<String, dynamic> json) => PremiumInfo(
    message: json['message'] as String?,
    upgradeUrl: json['upgrade_url'] as String?,
    lockedFields: (json['locked_fields'] as List?)?.map((e) => e.toString()).toList(),
  );

  Map<String, dynamic> toJson() => {
    if (message != null) 'message': message,
    if (upgradeUrl != null) 'upgrade_url': upgradeUrl,
    if (lockedFields != null) 'locked_fields': lockedFields,
  };
}

/// Response data for the Human Name Parser API.

class HumannameparserData {
  String? name;
  HumannameparserDataParsed? parsed;
  String? initials;
  String? formalName;

  HumannameparserData({
    this.name,
    this.parsed,
    this.initials,
    this.formalName,
  });

  factory HumannameparserData.fromJson(Map<String, dynamic> json) => HumannameparserData(
      name: json['name'],
      parsed: json['parsed'] != null ? HumannameparserDataParsed.fromJson(json['parsed']) : null,
      initials: json['initials'],
      formalName: json['formalName'],
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
