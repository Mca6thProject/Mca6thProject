import 'dart:convert';

class UserModel {
  final String id;
  final String name;
  final String status;
  final String email;
  final String phno;
  final String address;
  final String course;
  final String regNo;
  final String semester;
  final String userType;
  final bool isBlock;
  UserModel({
    required this.id,
    required this.name,
    required this.status,
    required this.email,
    required this.phno,
    required this.address,
    required this.course,
    required this.regNo,
    required this.semester,
    required this.userType,
    required this.isBlock,
  });

  UserModel copyWith({
    String? id,
    String? name,
    String? status,
    String? email,
    String? phno,
    String? address,
    String? course,
    String? regNo,
    String? semester,
    String? userType,
    bool? isBlock,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      status: status ?? this.status,
      email: email ?? this.email,
      phno: phno ?? this.phno,
      address: address ?? this.address,
      course: course ?? this.course,
      regNo: regNo ?? this.regNo,
      semester: semester ?? this.semester,
      userType: userType ?? this.userType,
      isBlock: isBlock ?? this.isBlock,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'status': status,
      'email': email,
      'phno': phno,
      'address': address,
      'course': course,
      'regNo': regNo,
      'semester': semester,
      'userType': userType,
      'isBlock': isBlock,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      status: map['status'] ?? '',
      email: map['email'] ?? '',
      phno: map['phno'] ?? '',
      address: map['address'] ?? '',
      course: map['course'] ?? '',
      regNo: map['regNo'] ?? '',
      semester: map['semester'] ?? '',
      userType: map['userType'] ?? '',
      isBlock: map['isBlock'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(id: $id, name: $name, status: $status, email: $email, phno: $phno, address: $address, course: $course, regNo: $regNo, semester: $semester, userType: $userType, isBlock: $isBlock)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModel &&
        other.id == id &&
        other.name == name &&
        other.status == status &&
        other.email == email &&
        other.phno == phno &&
        other.address == address &&
        other.course == course &&
        other.regNo == regNo &&
        other.semester == semester &&
        other.userType == userType &&
        other.isBlock == isBlock;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        status.hashCode ^
        email.hashCode ^
        phno.hashCode ^
        address.hashCode ^
        course.hashCode ^
        regNo.hashCode ^
        semester.hashCode ^
        userType.hashCode ^
        isBlock.hashCode;
  }
}
