// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'cycle_cubit.dart';

sealed class CycleState extends Equatable {
  const CycleState();

  @override
  List<Object> get props => [];
}

class CycleInitial extends CycleState {
  @override
  List<Object> get props => [];
}

class CycleLoading extends CycleState {
  @override
  List<Object> get props => [];
}

class CycleLoaded extends CycleState {
  final List<CycleDetaillEntity> cycles;
  const CycleLoaded({
    required this.cycles,
  });
  @override
  List<Object> get props => [cycles];
}

class CycleFaliure extends CycleState {
  @override
  List<Object> get props => [];
}
