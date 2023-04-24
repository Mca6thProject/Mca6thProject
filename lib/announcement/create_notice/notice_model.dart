import 'dart:convert';

class Notice {
  final String id;
  final String title;
  final String subtitle;
  final String body;
  final String link;
  final String date;
  final String others;
  final String img;
  Notice({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.body,
    required this.link,
    required this.date,
    required this.others,
    required this.img,
  });

  Notice copyWith({
    String? id,
    String? title,
    String? subtitle,
    String? body,
    String? link,
    String? date,
    String? others,
    String? img,
  }) {
    return Notice(
      id: id ?? this.id,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      body: body ?? this.body,
      link: link ?? this.link,
      date: date ?? this.date,
      others: others ?? this.others,
      img: img ?? this.img,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'subtitle': subtitle,
      'body': body,
      'link': link,
      'date': date,
      'others': others,
      'img': img,
    };
  }

  factory Notice.fromMap(Map<String, dynamic> map) {
    return Notice(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      subtitle: map['subtitle'] ?? '',
      body: map['body'] ?? '',
      link: map['link'] ?? '',
      date: map['date'] ?? '',
      others: map['others'] ?? '',
      img: map['img'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Notice.fromJson(String source) => Notice.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Notice(id: $id, title: $title, subtitle: $subtitle, body: $body, link: $link, date: $date, others: $others, img: $img)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Notice &&
        other.id == id &&
        other.title == title &&
        other.subtitle == subtitle &&
        other.body == body &&
        other.link == link &&
        other.date == date &&
        other.others == others &&
        other.img == img;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        subtitle.hashCode ^
        body.hashCode ^
        link.hashCode ^
        date.hashCode ^
        others.hashCode ^
        img.hashCode;
  }
}
