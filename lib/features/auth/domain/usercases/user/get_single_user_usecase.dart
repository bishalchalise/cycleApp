import 'package:cyclego/features/auth/domain/entities/auth_user_entity.dart';
import 'package:cyclego/features/auth/domain/repositories/auth_repository.dart';

class GetSingleUserUseCase {
  final AuthRepository authRepository;

  GetSingleUserUseCase({
    required this.authRepository,
  });

  Stream<List<AuthUserEntity>> call(String uid) {
    return authRepository.getSingleUser( uid);
  }
}
