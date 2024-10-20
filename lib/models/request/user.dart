import 'dart:convert';

class User {
  final String name;
  final String phone;
  final String password;
  User({
    required this.name,
    required this.phone,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'phone': phone,
      'password': password,
    };
  }

  String toJson() => json.encode(toMap());
}
