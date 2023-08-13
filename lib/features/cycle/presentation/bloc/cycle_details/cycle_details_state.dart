// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'cycle_details_cubit.dart';

sealed class CycleDetailsState extends Equatable {
  const CycleDetailsState();

  @override
  List<Object> get props => [];
}

class CycleDetailsInitial extends CycleDetailsState {
  @override
  List<Object> get props => [];
}

class CycleDetailsLoading extends CycleDetailsState {
  @override
  List<Object> get props => [];
}

class CycleDetailsLoaded extends CycleDetailsState {
  final CycleDetaillEntity cycle; 
  const CycleDetailsLoaded({
    required this.cycle,
  });
  @override
  List<Object> get props => [cycle];
}

class CycleDetailsFaliure extends CycleDetailsState {
  @override
  List<Object> get props => [];
}
