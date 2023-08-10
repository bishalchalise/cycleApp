
import 'package:cyclego/features/auth/domain/repositories/auth_repository.dart';

class GetCurrentUserIdUsecase {
  final AuthRepository authRepository;

  GetCurrentUserIdUsecase({
    required this.authRepository,
  });
  
  Future<String> call() {
    return authRepository.getCurrentUserId();
  }
}