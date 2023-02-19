import 'dart:convert';

class RetailerModel {
  final String imgUrl;
  final String title;
  final String detail;
  RetailerModel({
    required this.imgUrl,
    required this.title,
    required this.detail,
  });

  RetailerModel copyWith({
    String? imgUrl,
    String? title,
    String? detail,
  }) {
    return RetailerModel(
      imgUrl: imgUrl ?? this.imgUrl,
      title: title ?? this.title,
      detail: detail ?? this.detail,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'imgUrl': imgUrl});
    result.addAll({'title': title});
    result.addAll({'detail': detail});

    return result;
  }

  factory RetailerModel.fromMap(Map<String, dynamic> map) {
    return RetailerModel(
      imgUrl: map['imgUrl'] ?? '',
      title: map['title'] ?? '',
      detail: map['detail'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory RetailerModel.fromJson(String source) =>
      RetailerModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'RetailerModel(imgUrl: $imgUrl, title: $title, detail: $detail)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RetailerModel &&
        other.imgUrl == imgUrl &&
        other.title == title &&
        other.detail == detail;
  }

  @override
  int get hashCode => imgUrl.hashCode ^ title.hashCode ^ detail.hashCode;
}
