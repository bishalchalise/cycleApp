import 'package:cyclego/features/auth/domain/entities/auth_user_entity.dart';
import 'package:cyclego/features/auth/domain/repositories/auth_repository.dart';

class GetUsersUseCase {
  final AuthRepository authRepository;

  GetUsersUseCase({
    required this.authRepository,
  });

  Stream<List<AuthUserEntity>> call(AuthUserEntity user) {
    return authRepository.getUsers(user);
  }
}
