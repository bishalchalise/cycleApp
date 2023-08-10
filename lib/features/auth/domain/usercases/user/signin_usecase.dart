
import 'package:cyclego/features/auth/domain/entities/auth_user_entity.dart';
import 'package:cyclego/features/auth/domain/repositories/auth_repository.dart';

class SignInUseCase {
  final AuthRepository authRepository;

  SignInUseCase({
    required this.authRepository,
  });
  
  Future<void> call(AuthUserEntity user) {
    return authRepository.signInUser(user);
  }
}
