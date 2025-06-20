import 'location.dart';

class User{
  final String userId;
  final String fullName;
  final String nickName;
  final String email;
  final String password;
  final String phoneNumber;
  final DateTime dateOfBirth;
  final String address;
  final String? profileImageUrl;
  final Location? location;
  final bool isVerified;
  final DateTime createdAt;
  final DateTime? updatedAt;

  const User({
    required this.userId,
    required this.fullName,
    required this.nickName,
    required this.email,
    required this.password,
    required this.phoneNumber,
    required this.dateOfBirth,
    required this.address,
    this.profileImageUrl,
    this.location,
    required this.isVerified,
    required this.createdAt,
    this.updatedAt,
  });

  User copyWith({
    String? userId,
    String? fullName,
    String? nickName,
    String? email,
    String? password,
    String? phoneNumber,
    DateTime? dateOfBirth,
    String? address,
    String? profileImageUrl,
    Location? location,
    bool? isVerified,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return User(
      userId: userId ?? this.userId,
      fullName: fullName ?? this.fullName,
      nickName: nickName ?? this.nickName,
      email: email ?? this.email,
      password: password ?? this.password,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      address: address ?? this.address,
      profileImageUrl: profileImageUrl ?? this.profileImageUrl,
      location: location ?? this.location,
      isVerified: isVerified ?? this.isVerified,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}