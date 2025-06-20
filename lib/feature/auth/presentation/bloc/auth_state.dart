part of 'auth_bloc.dart';

abstract class AuthState{}

class AuthInitial extends AuthState{}

class AuthLoading extends AuthState{}

class AuthFailure extends AuthState{
  final String message;
  AuthFailure(String? message) : message = message ?? "Noma'lum xatolik";
}

class AuthSignInSuccess extends AuthState{
  final UserModel user;
  AuthSignInSuccess(this.user);
}

class AuthSignUpStep1Success extends AuthState{
  final String userId;
  AuthSignUpStep1Success(this.userId);
}

class AuthSignUpStep2Success extends AuthState{

}

class UpdateProfileImageSuccess extends AuthState{

}

class UpdateUserLocationSuccess extends AuthState{

}

class RemoveProfileImageSuccess extends AuthState{

}

class RemoveUserLocationSuccess extends AuthState{

}

class GetUserFromFireStoreSuccess extends AuthState{

}

class UpdateUserProfileSuccess extends AuthState{
  final UserModel user;
  UpdateUserProfileSuccess(this.user);
}



