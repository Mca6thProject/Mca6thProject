import 'dart:convert';

class AuthModel {
  final String id;
  final bool isLogin;
  AuthModel({
    required this.id,
    required this.isLogin,
  });

  AuthModel copyWith({
    String? id,
    bool? isLogin,
  }) {
    return AuthModel(
      id: id ?? this.id,
      isLogin: isLogin ?? this.isLogin,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'isLogin': isLogin,
    };
  }

  factory AuthModel.fromMap(Map<String, dynamic> map) {
    return AuthModel(
      id: map['id'] ?? '',
      isLogin: map['isLogin'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthModel.fromJson(String source) =>
      AuthModel.fromMap(json.decode(source));

  @override
  String toString() => 'AuthModel(id: $id, isLogin: $isLogin)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AuthModel && other.id == id && other.isLogin == isLogin;
  }

  @override
  int get hashCode => id.hashCode ^ isLogin.hashCode;
}
