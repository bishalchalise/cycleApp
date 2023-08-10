import 'dart:io';
import 'package:cyclego/features/auth/domain/usercases/user/get_single_user_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cyclego/features/auth/domain/entities/auth_user_entity.dart';
part 'single_user_state.dart';

class SingleUserCubit extends Cubit<SingleUserState> {
  final GetSingleUserUseCase getSingleUserUseCase;
  SingleUserCubit({
    required this.getSingleUserUseCase,
  }) : super(SingleUserInitial());

  Future<void> getSingleUser({required String uid}) async {
    emit(SingleUserLoading());
    try {
      final streamResponse = getSingleUserUseCase.call(uid);
      streamResponse.listen((users) {
        emit(SingleUserLoaded(user: users.first));
      });
    } on SocketException catch (_) {
      emit(SingleUserFaliure());
    } catch (_) {
      emit(SingleUserFaliure());
    }
  }
}
