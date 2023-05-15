import 'dart:convert';

class Annoucement {
  final String id;
  final String title;
  final String subtitle;
  final String body;
  final String link;
  final String date;
  final String others;
  final String img;
  final String type;
  Annoucement({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.body,
    required this.link,
    required this.date,
    required this.others,
    required this.img,
    required this.type,
  });

  Annoucement copyWith({
    String? id,
    String? title,
    String? subtitle,
    String? body,
    String? link,
    String? date,
    String? others,
    String? img,
    String? type,
  }) {
    return Annoucement(
      id: id ?? this.id,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      body: body ?? this.body,
      link: link ?? this.link,
      date: date ?? this.date,
      others: others ?? this.others,
      img: img ?? this.img,
      type: type ?? this.type,
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
      'type': type,
    };
  }

  factory Annoucement.fromMap(Map<String, dynamic> map) {
    return Annoucement(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      subtitle: map['subtitle'] ?? '',
      body: map['body'] ?? '',
      link: map['link'] ?? '',
      date: map['date'] ?? '',
      others: map['others'] ?? '',
      img: map['img'] ?? '',
      type: map['type'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Annoucement.fromJson(String source) =>
      Annoucement.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Annoucement(id: $id, title: $title, subtitle: $subtitle, body: $body, link: $link, date: $date, others: $others, img: $img, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Annoucement &&
        other.id == id &&
        other.title == title &&
        other.subtitle == subtitle &&
        other.body == body &&
        other.link == link &&
        other.date == date &&
        other.others == others &&
        other.img == img &&
        other.type == type;
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
        img.hashCode ^
        type.hashCode;
  }
}
