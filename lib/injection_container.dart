import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cyclego/features/auth/data/data_scources/remote/remote_data_source_impl.dart';
import 'package:cyclego/features/auth/data/data_scources/remote/remote_data_sources.dart';
import 'package:cyclego/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:cyclego/features/auth/domain/repositories/auth_repository.dart';
import 'package:cyclego/features/auth/domain/usercases/user/create_user_usecase.dart';
import 'package:cyclego/features/auth/domain/usercases/user/get_current_user_id_usecase.dart';
import 'package:cyclego/features/auth/domain/usercases/user/get_single_user_usecase.dart';
import 'package:cyclego/features/auth/domain/usercases/user/getusers_usecase.dart';
import 'package:cyclego/features/auth/domain/usercases/user/is_signed_in_usecase.dart';
import 'package:cyclego/features/auth/domain/usercases/user/signin_usecase.dart';
import 'package:cyclego/features/auth/domain/usercases/user/signout_usecase.dart';
import 'package:cyclego/features/auth/domain/usercases/user/signup_usecase.dart';
import 'package:cyclego/features/auth/domain/usercases/user/update_user_usecase.dart';
import 'package:cyclego/features/auth/presentation/cubit/auth/cubit/auth_cubit.dart';
import 'package:cyclego/features/auth/presentation/cubit/credentials/cubit/credentials_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

import 'features/auth/presentation/cubit/user/cubit/user_cubit.dart';
import 'features/auth/presentation/cubit/user/get_single_user/cubit/single_user_cubit.dart';

final sl = GetIt.instance;

Future<void> intt() async {
  //Cubits
  sl.registerFactory(
    () => AuthCubit(
      signOutUseCase: sl.call(),
      getCurrentUserIdUsecase: sl.call(),
      isSignedInUseCase: sl.call(),
    ),
  );
  sl.registerFactory(
    () => CredentialsCubit(
      signInUseCase: sl.call(),
      signUpUserUseCase: sl.call(),
    ),
  );

  sl.registerFactory(
    () => UserCubit(
      getUsersUseCase: sl.call(),
      updateUserUseCase: sl.call(),
    ),
  );
  sl.registerFactory(
    () => SingleUserCubit(
      getSingleUserUseCase: sl.call(),
    ),
  );
  //Use Cases
  sl.registerLazySingleton(() => SignOutUseCase(authRepository: sl.call()));
  sl.registerLazySingleton(() => CreateUserUseCase(authRepository: sl.call()));
  sl.registerLazySingleton(
      () => GetCurrentUserIdUsecase(authRepository: sl.call()));
  sl.registerLazySingleton(
      () => GetSingleUserUseCase(authRepository: sl.call()));
  sl.registerLazySingleton(() => GetUsersUseCase(authRepository: sl.call()));
  sl.registerLazySingleton(() => IsSignedInUseCase(authRepository: sl.call()));
  sl.registerLazySingleton(() => SignInUseCase(authRepository: sl.call()));
  sl.registerLazySingleton(() => SignUpUserUseCase(authRepository: sl.call()));
  sl.registerLazySingleton(() => UpdateUserUseCase(authRepository: sl.call()));

  //Repository
  sl.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(remoteDataSource: sl.call()));

//
  sl.registerLazySingleton<FirebaseRemoteDataSource>(() =>
      FirebaseRemoteDataSourceImpl(
          firebaseFirestore: sl.call(), firebaseAuth: sl.call()));
  //Externals

  final firebaseFirestore = FirebaseFirestore.instance;
  final firebaseAuth = FirebaseAuth.instance;

  sl.registerLazySingleton(() => firebaseFirestore);
  sl.registerLazySingleton(() => firebaseAuth);
}
