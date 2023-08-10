
import 'package:cyclego/features/auth/domain/entities/auth_user_entity.dart';
import 'package:cyclego/features/auth/domain/repositories/auth_repository.dart';

class CreateUserUseCase {
  final AuthRepository authRepository;

  CreateUserUseCase({
    required this.authRepository,
  });

  Future<void> call(AuthUserEntity user) {
    return authRepository.createUser(user);
  }
}
