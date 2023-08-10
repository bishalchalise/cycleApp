import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cyclego/features/auth/domain/entities/auth_user_entity.dart';
import 'package:cyclego/features/auth/domain/usercases/user/getusers_usecase.dart';
import 'package:cyclego/features/auth/domain/usercases/user/update_user_usecase.dart';
import 'package:equatable/equatable.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final UpdateUserUseCase updateUserUseCase;
  final GetUsersUseCase getUsersUseCase;

  UserCubit({
    required this.getUsersUseCase,
    required this.updateUserUseCase,
  }) : super(UserInitial());

  Future<void> getUsers({required AuthUserEntity user}) async {
    emit(UserLoading());
    try {
      final streamResponse = getUsersUseCase.call(user);
      streamResponse.listen((users) {
        emit(UserLoaded(users: users));
      });
    } on SocketException catch (_) {
      emit(UserFaliure());
    } catch (_) {
      emit(UserFaliure());
    }
  }


     Future<void> updateUser({
  required AuthUserEntity user
  }) async {

    try {
      await updateUserUseCase.call(user);

    } on SocketException catch (_) {
      emit(UserFaliure());
    } catch (_) {
      emit(UserFaliure());
    }
  }
}
