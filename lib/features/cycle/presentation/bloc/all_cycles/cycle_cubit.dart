import 'dart:io';

import 'package:cyclego/features/cycle/domain/usecases/get_all_cycles_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cyclego/features/cycle/domain/entities/cycle_detail_entity.dart';
import 'package:equatable/equatable.dart';

part 'cycle_state.dart';

class CycleCubit extends Cubit<CycleState> {
  final GetAllCyclesUsecase getAllCyclesUsecase;

  CycleCubit({
    required this.getAllCyclesUsecase,
  }) : super(CycleInitial());

  Future<void> getCycles({required CycleDetaillEntity cycle}) async {
    emit(CycleLoading());
    try {
      final streamResponse = getAllCyclesUsecase.call(cycle);
      streamResponse.listen((cycle) {
        emit(CycleLoaded(cycles: cycle));
      });
    } on SocketException catch (_) {
      emit(CycleFaliure());
    } catch (_) {
      emit(CycleFaliure());
    }
  }
}
