// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:cyclego/features/cycle/domain/entities/cycle_detail_entity.dart';
import 'package:cyclego/features/cycle/domain/usecases/fetch_cycle_details_usecase.dart';

part 'cycle_details_state.dart';

class CycleDetailsCubit extends Cubit<CycleDetailsState> {
  final FetchCycleDetailsUsecase fetchCycleDetailsUsecase;
  CycleDetailsCubit(
    this.fetchCycleDetailsUsecase,
  ) : super(CycleDetailsInitial());

  Future<void> getCycleDetails({required String id}) async {
    emit(CycleDetailsLoading());

    try {
      final streamResponse = fetchCycleDetailsUsecase.call(id);
      streamResponse.listen((cycles) {
        emit(CycleDetailsLoaded(cycle: cycles.first));
      });
    } on SocketException catch (_) {
      emit(CycleDetailsFaliure());
    } catch (_) {
        emit(CycleDetailsFaliure());
    }
  }
}

