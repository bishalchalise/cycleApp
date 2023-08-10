import '../entities/auth_user_entity.dart';

abstract class AuthRepository {
 
  Future<void> signUpUser(AuthUserEntity user);
  Future<void> signInUser(AuthUserEntity user);
  Future<void> signOut();
  Future<void> createUser(AuthUserEntity user);
  Future<void> updateUser(AuthUserEntity user);
  Future<bool> isSignedIn();
  Stream<List<AuthUserEntity>> getUsers(AuthUserEntity user);
  Stream<List<AuthUserEntity>> getSingleUser(String user);
  Future<String> getCurrentUserId();
  
}
