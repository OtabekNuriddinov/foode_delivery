import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entities/user.dart';
import 'location_model.dart';

class UserModel extends User {
  UserModel({
    required super.userId,
    required super.fullName,
    required super.nickName,
    required super.email,
    required super.password,
    required super.phoneNumber,
    required super.dateOfBirth,
    required super.address,
    super.profileImageUrl,
    super.location,
    required super.isVerified,
    required super.createdAt,
    super.updatedAt,
  });

  static DateTime _parseDateTime(dynamic dateValue) {
    if (dateValue == null) return DateTime.now();

    if (dateValue is Timestamp) {
      return dateValue.toDate();
    } else if (dateValue is String) {
      return DateTime.parse(dateValue);
    } else if (dateValue is DateTime) {
      return dateValue;
    }
    return DateTime.now();
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userId: json['userId'] ?? '',
      fullName: json['fullName'] ?? '',
      nickName: json['nickName'] ?? '',
      email: json['email'] ?? '',
      password: json['password'] ?? '',
      phoneNumber: json['phoneNumber'] ?? '',
      dateOfBirth: _parseDateTime(json['dateOfBirth']),
      address: json['address'] ?? '',
      profileImageUrl: json['profileImageUrl'],
      location: json['location'] != null
          ? LocationModel.fromJson(json['location'])
          : null,
      isVerified: json['isVerified'] ?? false,
      createdAt: _parseDateTime(json['createdAt']),
      updatedAt: json['updatedAt'] != null
          ? _parseDateTime(json['updatedAt'])
          : null,
    );
  }
  User toEntity() {
    return User(
      userId: userId,
      fullName: fullName,
      nickName: nickName,
      email: email,
      password: password,
      phoneNumber: phoneNumber,
      dateOfBirth: dateOfBirth,
      address: address,
      profileImageUrl: profileImageUrl,
      location: location,
      isVerified: isVerified,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  factory UserModel.fromEntity(User user) {
    return UserModel(
      userId: user.userId,
      fullName: user.fullName,
      nickName: user.nickName,
      email: user.email,
      password: user.password,
      phoneNumber: user.phoneNumber,
      dateOfBirth: user.dateOfBirth,
      location: user.location,
      address: user.address,
      profileImageUrl: user.profileImageUrl,
      isVerified: user.isVerified,
      createdAt: user.createdAt,
      updatedAt: user.updatedAt,
    );
  }


}

