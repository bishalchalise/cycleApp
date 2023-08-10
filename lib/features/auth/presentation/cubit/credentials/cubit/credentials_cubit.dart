import 'dart:io';

import 'package:cyclego/features/auth/domain/entities/auth_user_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:cyclego/features/auth/domain/usercases/user/signin_usecase.dart';
import 'package:cyclego/features/auth/domain/usercases/user/signup_usecase.dart';

part 'credentials_state.dart';

class CredentialsCubit extends Cubit<CredentialsState> {
  final SignInUseCase signInUseCase;
  final SignUpUserUseCase signUpUserUseCase;
  CredentialsCubit(
   {required this.signInUseCase,
   required this.signUpUserUseCase,}
  ) : super(CredentialsInitial());

  Future<void> signInUser({
    required String email,
    required String password,
  }) async {
    emit(CredentialsLoading());
    try {
      await signInUseCase.call(
        AuthUserEntity(
        email: email,
        password: password,
      ));
      emit(CredentialsSuccess());
    } on SocketException catch (_) {
      emit(CredentialsFaliure());
    } catch (_) {
      emit(CredentialsFaliure());
    }
  }

   Future<void> signUpUser({
  required AuthUserEntity user
  }) async {
    emit(CredentialsLoading());
    try {
      await signUpUserUseCase.call(user);
      emit(CredentialsSuccess());
    } on SocketException catch (_) {
      emit(CredentialsFaliure());
    } catch (_) {
      emit(CredentialsFaliure());
    }
  }
}
