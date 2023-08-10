import '../../../domain/entities/auth_user_entity.dart';


abstract class FirebaseRemoteDataSource {
 
  Future<void> signUpUser(AuthUserEntity user);
  Future<void> signInUser(AuthUserEntity user);
  Future<bool> isSignedIn();
  Future<void> signOut();

  Stream<List<AuthUserEntity>> getUsers(AuthUserEntity user);
  Stream<List<AuthUserEntity>> getSingleUser(String uid);
  Future<String> getCurrentUserId();
    Future<void> createUser(AuthUserEntity user);
    Future<void> updateUser(AuthUserEntity user);
}

