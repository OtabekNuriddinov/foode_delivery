import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:foode_delivery/feature/auth/data/models/location_model.dart';
import 'package:foode_delivery/feature/auth/data/models/user_model.dart';


class AuthRemoteDataSource {
  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;
  AuthRemoteDataSource({
    required FirebaseAuth auth,
    required FirebaseFirestore firestore,
  }) : _auth = auth,
       _firestore = firestore;

  Future<UserModel> signIn(String email, String password) async {
    final userCredential = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    final user = userCredential.user;
    if (user == null) throw Exception("User not found");
    final doc = await _firestore.collection('users').doc(user.uid).get();
    if (!doc.exists || doc.data() == null) throw Exception("User data not found in Firestore");
    return UserModel.fromJson(doc.data()!);
  }

  /// #SIGN UP
  // 1-qadam: Email va parolni kiritish
  Future<String?> sigUpStep1({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user!.uid;
    } catch (e) {
      throw Exception(
        'Ro\'yxatdan o\'tish jarayonida xatolik: ${e.toString()}',
      );
    }
  }

  // 2-qadam: Profil haqida oddiy ma'lumotlarni yozish
  Future<void> signUpStep2({
    required String userId,
    required String fullName,
    required String nickName,
    required String phoneNumber,
    required DateTime dateOfBirth,
    required String address,
  }) async {
    await _firestore.collection('users').doc(userId).set({
      'userId': userId,
      'fullName': fullName,
      'nickName': nickName,
      'phoneNumber': phoneNumber,
      'dateOfBirth': dateOfBirth.toIso8601String(),
      'address': address,
      'profileImageUrl': null,
      'location': null,
      'createdAt': Timestamp.fromDate(DateTime.now()),
      'updatedAt': null,
    }, SetOptions(merge: true));
  }

  // 3-qadam: Profil rasmi yuklash
  Future<void> updateProfileImage({required String userId}) async {
    try {
      const String profileImageUrl = "assets/icons/main_logo.png";
      await _firestore.collection('users').doc(userId).update({
        'profileImageUrl': profileImageUrl,
        'updatedAt': Timestamp.fromDate(DateTime.now()),
      });
    } catch (e) {
      throw Exception('Profil rasmi saqlashda xatolik: ${e.toString()}');
    }
  }

  // 4-qadam: Foydalanuvchining joylashuvini aniqlash yoki saqlash
  Future<void> updateUserLocation({
    required String userId,
    required LocationModel location,
  }) async {
    try {
      await _firestore.collection('users').doc(userId).update({
        'location': {
          'lat': location.lat,
          'long': location.long,
          'street': location.street,
        },
        'updatedAt': Timestamp.fromDate(DateTime.now()),
      });
    } catch (e) {
      throw Exception('Location saqlashda xatolik: ${e.toString()}');
    }
  }

  Future<UserModel> updateUserProfile({
    required String userId,
    String? fullName,
    String? nickName,
    String? phoneNumber,
    DateTime? dateOfBirth,
    String? address,
    String? profileImageUrl,
    LocationModel? location,
  })async{
    try{
      Map<String, dynamic> updateData = {
        'updatedAt': Timestamp.fromDate(DateTime.now()),
      };
      if (fullName != null) updateData['fullName'] = fullName;
      if (nickName != null) updateData['nickName'] = nickName;
      if (phoneNumber != null) updateData['phoneNumber'] = phoneNumber;
      if (dateOfBirth != null) updateData['dateOfBirth'] = Timestamp.fromDate(dateOfBirth);
      if (address != null) updateData['address'] = address;
      if (profileImageUrl != null) updateData['profileImageUrl'] = profileImageUrl;
      if(location!=null){
        updateData['location'] = {
          'lat': location.lat,
          'long': location.long,
          'street': location.street,
        };
      }

      await _firestore.collection('users').doc(userId).update(updateData);

      final doc = await _firestore.collection('users').doc(userId).get();
      if (!doc.exists) throw Exception("User data not found in Firestore");
      return UserModel.fromJson(doc.data()!);
    }catch(e){
      throw Exception('Profil yangilashda xatolik: ${e.toString()}');
    }
  }

  Future<void>removeProfileImage(String userId)async{
    try{
      await _firestore.collection('users').doc(userId).update({
        'profileImageUrl': null,
        'updatedAt': Timestamp.fromDate(DateTime.now()),
      });
    }catch(e){
      throw Exception('Profil rasmini o\'chirishda xatolik: ${e.toString()}');
    }
  }

  Future<void> removeUserLocation(String userId)async{
    try{
      await _firestore.collection('users').doc(userId).update({
        'location': null,
        'updatedAt': Timestamp.fromDate(DateTime.now()),
      });

    }catch(e){
      throw Exception('Location o\'chirishda xatolik: ${e.toString()}');
    }
  }

  Future<Map<String, dynamic>?> getUserFromFireStore(String userId)async{
    final doc = await _firestore.collection('users').doc(userId).get();
    if(doc.exists){
      return doc.data();
    }
    return null;
  }

  Future<void> signOut()async{
    await _auth.signOut();
  }
}
