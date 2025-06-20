import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foode_delivery/feature/auth/data/datasources/auth_remote_data_source.dart';
import 'package:foode_delivery/feature/auth/data/repositories/auth_repository_impl.dart';
import 'package:foode_delivery/feature/auth/presentation/bloc/auth_bloc.dart';
import 'app.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final firebaseAuth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;

  final authDataSource = AuthRemoteDataSource(
    auth: firebaseAuth,
    firestore: firestore,
  );
  final authRepository = AuthRepositoryImpl(
    authRemoteDataSource: authDataSource,
  );

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => AuthBloc(
            authRepository: authRepository,
          ),
        ),
      ],
      child: const Foode(),
    ),
  );
}
