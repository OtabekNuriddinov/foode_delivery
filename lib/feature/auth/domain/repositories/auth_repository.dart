import 'package:foode_delivery/feature/auth/data/models/user_model.dart';

import '../../data/models/location_model.dart';

abstract class AuthRepository {
  Future<UserModel> signIn({required String email, required String password});
  Future<void> signUp1({required String email, required String password});
  Future<void> signUp2({
    required String userId,
    required String fullName,
    required String nickName,
    required String phoneNumber,
    required DateTime dateOfBirth,
    required String address,
  });

  Future<void> updateProfileImage({required String userId});

  Future<void> updateUserLocation({
    required String userId,
    required LocationModel location,
  });

  Future<UserModel> updateUserProfile({
    required String userId,
    String? fullName,
    String? nickName,
    String? phoneNumber,
    DateTime? dateOfBirth,
    String? address,
    String? profileImageUrl,
    LocationModel? location,
  });

  Future<void>removeProfileImage(String userId);
  Future<void> removeUserLocation(String userId);
  Future<void> getUserFromFirestore(String userId);
  Future<void> signOut();

}
