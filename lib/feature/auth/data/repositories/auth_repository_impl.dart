import 'package:foode_delivery/feature/auth/data/datasources/auth_remote_data_source.dart';
import 'package:foode_delivery/feature/auth/data/models/location_model.dart';
import 'package:foode_delivery/feature/auth/data/models/user_model.dart';
import 'package:foode_delivery/feature/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;

  AuthRepositoryImpl({required this.authRemoteDataSource});

  @override
  Future<Map<String, dynamic>?> getUserFromFirestore(String userId) async {
    return await authRemoteDataSource.getUserFromFireStore(userId);
  }

  @override
  Future<void> removeProfileImage(String userId) async {
    await authRemoteDataSource.removeProfileImage(userId);
  }

  @override
  Future<void> removeUserLocation(String userId) async {
    await authRemoteDataSource.removeUserLocation(userId);
  }

  @override
  Future<UserModel> signIn({
    required String email,
    required String password,
  }) async {
    return await authRemoteDataSource.signIn(email, password);
  }

  @override
  Future<void> signOut() async {
    await authRemoteDataSource.signOut();
  }

  @override
  Future<String?> signUp1({
    required String email,
    required String password,
  }) async {
    return await authRemoteDataSource.sigUpStep1(
      email: email,
      password: password,
    );
  }

  @override
  Future<void> signUp2({
    required String userId,
    required String fullName,
    required String nickName,
    required String phoneNumber,
    required DateTime dateOfBirth,
    required String address,
  }) async {
    await authRemoteDataSource.signUpStep2(
      userId: userId,
      fullName: fullName,
      nickName: nickName,
      phoneNumber: phoneNumber,
      dateOfBirth: dateOfBirth,
      address: address,
    );
  }

  @override
  Future<void> updateProfileImage({required String userId}) async {
    await authRemoteDataSource.updateProfileImage(userId: userId);
  }

  @override
  Future<void> updateUserLocation({
    required String userId,
    required LocationModel location,
  }) async {
    await authRemoteDataSource.updateUserLocation(
      userId: userId,
      location: location,
    );
  }

  @override
  Future<UserModel> updateUserProfile({
    required String userId,
    String? fullName,
    String? nickName,
    String? phoneNumber,
    DateTime? dateOfBirth,
    String? address,
    String? profileImageUrl,
    LocationModel? location,
  }) async {
    return await authRemoteDataSource.updateUserProfile(
      userId: userId,
      fullName: fullName,
      nickName: nickName,
      phoneNumber: phoneNumber,
      dateOfBirth: dateOfBirth,
      address: address,
      profileImageUrl: profileImageUrl,
      location: location,
    );
  }
}
