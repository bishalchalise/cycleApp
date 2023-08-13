part of 'cycle_category_cubit.dart';

sealed class CycleCategoryState extends Equatable {
  const CycleCategoryState();
}

final class CycleCategoryInitial extends CycleCategoryState {
  @override
  List<Object> get props => [];
}

final class CycleCategoryLoading extends CycleCategoryState {
  @override
  List<Object> get props => [];
}

final class CycleCategoryLoaded extends CycleCategoryState {
  final CycleDetaillEntity cycle;
  const CycleCategoryLoaded({required this.cycle});
  @override
  List<Object> get props => [cycle];
}

final class CycleCategoryFaliure extends CycleCategoryState {
  @override
  List<Object> get props => [];
}
