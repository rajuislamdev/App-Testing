import 'dart:convert';

class User {
  final int? id;
  final String? name;
  final String? phone;
  final String? email;
  final bool? isActive;
  final String? profilePhoto;
  final String? gender;
  final String? dateOfBirth;
  User({
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
    required this.isActive,
    required this.profilePhoto,
    required this.gender,
    required this.dateOfBirth,
  });

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id']?.toInt(),
      name: map['name'] as String?,
      phone: map['phone'] as String?,
      email: map['email'] as String?,
      isActive: map['is_active'] as bool?,
      profilePhoto: map['profile_photo'] as String?,
      gender: map['gender'] as String?,
      dateOfBirth: map['date_of_birth'] as String?,
    );
  }

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);
}
