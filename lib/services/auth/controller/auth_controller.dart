import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app/services/auth/repository/auth_repository.dart';

final authControllerProvider = Provider(
  (ref) => AuthController(
    authRepository: ref.watch(authRepositoryProvider),
  ),
);

class AuthController {
  final AuthRepository authRepository;

  AuthController({required this.authRepository});

  Future<void> signInWithEmailAndPassowrd({
    required String email,
    required String password,
  }) async {
    return authRepository.signInWithEmailAndPassowrd(
        email: email, password: password);
  }

  Future<void> signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    return authRepository.signUpWithEmailAndPassword(
        email: email, password: password);
  }
}
