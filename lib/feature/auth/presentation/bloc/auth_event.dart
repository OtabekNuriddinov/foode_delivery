part of 'auth_bloc.dart';

abstract class AuthEvent {}

class AuthSignInRequestedEvent extends AuthEvent {
  final String email;
  final String password;
  AuthSignInRequestedEvent({required this.email, required this.password});
}

class AuthSignUpStep1RequestedEvent extends AuthEvent {
  final String email;
  final String password;
  AuthSignUpStep1RequestedEvent({required this.email, required this.password});
}

class AuthSignUpStep2RequestedEvent extends AuthEvent {
  final String userId;
  final String fullName;
  final String nickName;
  final String phoneNumber;
  final DateTime dateOfBirth;
  final String address;

  AuthSignUpStep2RequestedEvent({
    required this.userId,
    required this.fullName,
    required this.nickName,
    required this.phoneNumber,
    required this.dateOfBirth,
    required this.address,
  });
}

class UpdateProfileImageEvent extends AuthEvent {
  final String userId;

  UpdateProfileImageEvent({required this.userId});
}

class UpdateUserLocationEvent extends AuthEvent {
  final String userId;
  final LocationModel location;

  UpdateUserLocationEvent({required this.userId, required this.location});
}

class GetUserFromFireStoreEvent extends AuthEvent {
  final String userId;

  GetUserFromFireStoreEvent({required this.userId});
}

class RemoveProfileImageEvent extends AuthEvent {
  final String userId;

  RemoveProfileImageEvent({required this.userId});
}

class RemoveUserLocationEvent extends AuthEvent {
  final String userId;

  RemoveUserLocationEvent(this.userId);
}

class UpdateUserProfileEvent extends AuthEvent {
  final String userId;
  String? fullName;
  String? nickName;
  String? phoneNumber;
  DateTime? dateOfBirth;
  String? address;
  String? profileImageUrl;
  LocationModel? location;

  UpdateUserProfileEvent({
    required this.userId,
    this.fullName,
    this.nickName,
    this.phoneNumber,
    this.dateOfBirth,
    this.address,
    this.profileImageUrl,
    this.location,
  });
}
