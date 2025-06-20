import 'dart:async';

import 'package:foode_delivery/feature/auth/data/models/location_model.dart';
import 'package:foode_delivery/feature/auth/data/repositories/auth_repository_impl.dart';
import '../../data/models/user_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState>{
  final AuthRepositoryImpl authRepository;

  AuthBloc({required this.authRepository}) : super(AuthInitial()){
    on<AuthSignInRequestedEvent>(authSignInRequested);
    on<AuthSignUpStep1RequestedEvent>(authSignUpStep1Requested);
    on<AuthSignUpStep2RequestedEvent>(authSignUpStep2Requested);
    on<UpdateProfileImageEvent>(updateProfileImageRequested);
    on<UpdateUserLocationEvent>(updateUserLocationRequested);
    on<RemoveUserLocationEvent>(removeUserLocationRequested);
    on<RemoveProfileImageEvent>(removeProfileImageRequested);
    on<UpdateUserProfileEvent>(updateUserProfileRequested);
    on<GetUserFromFireStoreEvent>(getUserFromFireStoreRequested);
  }

  FutureOr<void>authSignInRequested(AuthSignInRequestedEvent event, Emitter<AuthState>emit)async{
    emit(AuthLoading());
    try{
      final user = await authRepository.signIn(
          email: event.email,
          password: event.password,
      );
      emit(AuthSignInSuccess(user));
    }catch(e){
      emit(AuthFailure(e.toString()));
    }
  }

  FutureOr<void> authSignUpStep1Requested(AuthSignUpStep1RequestedEvent event, Emitter<AuthState> emit)async{
    emit(AuthLoading());
    try{
      final userId = await authRepository.signUp1(
          email: event.email,
          password: event.password
      );
      emit(AuthSignUpStep1Success(userId!));
    }catch(e){
      emit(AuthFailure(e.toString()));
    }
  }

  FutureOr<void>authSignUpStep2Requested(AuthSignUpStep2RequestedEvent event, Emitter<AuthState>emit)async{
    emit(AuthLoading());
    try{
      await authRepository.signUp2(
          userId: event.userId,
          fullName: event.fullName,
          nickName: event.nickName,
          phoneNumber: event.phoneNumber,
          dateOfBirth: event.dateOfBirth,
          address: event.address
      );
      emit(AuthSignUpStep2Success());
    }catch(e){
      emit(AuthFailure(e.toString()));
    }
  }

  FutureOr<void> updateProfileImageRequested(UpdateProfileImageEvent event, Emitter<AuthState>emit)async{
    emit(AuthLoading());
    try{
      await authRepository.updateProfileImage(userId: event.userId);
      emit(UpdateProfileImageSuccess());
    }catch(e){
      emit(AuthFailure(e.toString()));
    }
  }


  FutureOr<void> updateUserLocationRequested(UpdateUserLocationEvent event, Emitter<AuthState> emit)async{
    emit(AuthLoading());
    try{
      await authRepository.updateUserLocation(userId: event.userId, location: event.location);
      emit(UpdateUserLocationSuccess());
    }catch(e){
      emit(AuthFailure(e.toString()));
    }
  }

  FutureOr<void> removeProfileImageRequested(RemoveProfileImageEvent event, Emitter<AuthState>emit)async{
    emit(AuthLoading());
    try{
      await authRepository.removeProfileImage(event.userId);
      emit(RemoveProfileImageSuccess());
    }catch(e){
      emit(AuthFailure(e.toString()));
    }
  }

  FutureOr<void> removeUserLocationRequested(RemoveUserLocationEvent event, Emitter<AuthState>emit)async{
    emit(AuthLoading());
    try{
      await authRepository.removeUserLocation(event.userId);
      emit(RemoveUserLocationSuccess());
    }catch(e){
      emit(AuthFailure(e.toString()));
    }
  }

  FutureOr<void> updateUserProfileRequested(UpdateUserProfileEvent event, Emitter<AuthState>emit)async{
    emit(AuthLoading());
    try{
      final user = await authRepository.updateUserProfile(
          userId: event.userId,
          fullName: event.fullName,
         nickName: event.nickName,
        phoneNumber: event.phoneNumber,
        dateOfBirth: event.dateOfBirth,
        address: event.address,
        profileImageUrl: event.profileImageUrl,
        location: event.location
      );
      emit(UpdateUserProfileSuccess(user));
    }catch(e){
      emit(AuthFailure(e.toString()));
    }
  }

  FutureOr<void> getUserFromFireStoreRequested(GetUserFromFireStoreEvent event, Emitter<AuthState>emit)async{
    emit(AuthLoading());
    try{
      final userData = await authRepository.getUserFromFirestore(event.userId);
      if(userData!=null){
        final user = UserModel.fromJson(userData);
        emit(AuthSignInSuccess(user));
      }
      else{
        emit(AuthFailure("User not found"));
      }
    }catch(e){
      emit(AuthFailure(e.toString()));
    }
  }

}