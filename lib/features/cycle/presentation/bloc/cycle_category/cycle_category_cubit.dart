// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:cyclego/features/cycle/domain/entities/cycle_detail_entity.dart';
import 'package:cyclego/features/cycle/domain/usecases/fetch_cycle_by_category.dart';

part 'cycle_category_state.dart';

class CycleCategoryCubit extends Cubit<CycleCategoryState> {
  final FetchCycleByCategoryUsecase fetchCycleByCategoryUsecase;
  CycleCategoryCubit(
    this.fetchCycleByCategoryUsecase,
  ) : super(CycleCategoryInitial());

  Future<void> getCycleByCategory({required String type}) async {
    emit(CycleCategoryLoading());

    try {
      final streamResponse = fetchCycleByCategoryUsecase.call(type);
      streamResponse.listen((cycles) {
        emit(CycleCategoryLoaded(cycle: cycles.first));
      });
    } on SocketException catch (_) {
      emit(CycleCategoryFaliure());
    } catch (_) {
      emit(CycleCategoryFaliure());
    }
  }
}
