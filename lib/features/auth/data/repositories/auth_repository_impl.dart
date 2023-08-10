import 'package:cyclego/features/auth/data/data_scources/remote/remote_data_sources.dart';
import 'package:cyclego/features/auth/domain/entities/auth_user_entity.dart';
import 'package:cyclego/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseRemoteDataSource remoteDataSource;
  AuthRepositoryImpl({
    required this.remoteDataSource,
  });
  @override
  Future<void> createUser(AuthUserEntity user) async =>
      remoteDataSource.createUser(user);

  @override
  Future<String> getCurrentUserId() async =>
      remoteDataSource.getCurrentUserId();

  @override
  Stream<List<AuthUserEntity>> getSingleUser(String user) =>
      remoteDataSource.getSingleUser(user);

  @override
  Stream<List<AuthUserEntity>> getUsers(AuthUserEntity user) =>
      remoteDataSource.getUsers(user);

  @override
  Future<bool> isSignedIn() async => remoteDataSource.isSignedIn();

  @override
  Future<void> signInUser(AuthUserEntity user) async =>
      remoteDataSource.signInUser(user);

  @override
  Future<void> signOut() async => remoteDataSource.signOut();

  @override
  Future<void> signUpUser(AuthUserEntity user) async =>
      remoteDataSource.signUpUser(user);

  @override
  Future<void> updateUser(AuthUserEntity user) async =>
      remoteDataSource.updateUser(user);
}
