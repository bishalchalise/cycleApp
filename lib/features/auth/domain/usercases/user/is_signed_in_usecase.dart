
import 'package:cyclego/features/auth/domain/repositories/auth_repository.dart';

class IsSignedInUseCase {
  final AuthRepository authRepository;

  IsSignedInUseCase({
    required this.authRepository,
  });
  
  Future<bool> call() {
    return authRepository.isSignedIn();
  }
} 