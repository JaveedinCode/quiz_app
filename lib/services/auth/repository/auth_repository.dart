import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authRepositoryProvider = Provider(
  (ref) => AuthRepository(auth: FirebaseAuth.instance),
);

class AuthRepository {
  final FirebaseAuth auth;
  AuthRepository({
    required this.auth,
  });
  Future<void> signInWithEmailAndPassowrd({
    required String email,
    required String password,
  }) async {
    await signInWithEmailAndPassowrd(email: email, password: password);
  }

  Future<void> signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    await auth.createUserWithEmailAndPassword(email: email, password: password);
  }
}
