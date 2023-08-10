import 'package:cyclego/features/auth/domain/usercases/user/get_current_user_id_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:cyclego/features/auth/domain/usercases/user/is_signed_in_usecase.dart';
import 'package:cyclego/features/auth/domain/usercases/user/signout_usecase.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final SignOutUseCase signOutUseCase;
  final GetCurrentUserIdUsecase getCurrentUserIdUsecase;
  final IsSignedInUseCase isSignedInUseCase;
  AuthCubit({
    required this.signOutUseCase,
    required this.getCurrentUserIdUsecase,
    required this.isSignedInUseCase,
  }) : super(AuthInitial());

  Future<void> appStarted(BuildContext context) async {
    try {
      bool isSignIn = await isSignedInUseCase.call();
      if (isSignIn == true) {
        final uid = await getCurrentUserIdUsecase.call();
        emit(
          Authenticated(uid: uid),
        );
      } else {
        emit(
          UnAuthenticated(),
        );
      }
    } catch (_) {
      emit(
        UnAuthenticated(),
      );
    }
  }

  Future<void> loggedIn() async {
    try {
      final uid = await getCurrentUserIdUsecase.call();
      emit(Authenticated(uid: uid));
    } catch (_) {
      emit(UnAuthenticated());
    }
  }

  Future<void> loggedOut() async {
    try {
      await signOutUseCase.call();
      emit(UnAuthenticated());
    } catch (_) {
      emit(UnAuthenticated());
    }
  }
}
