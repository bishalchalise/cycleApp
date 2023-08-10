// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'user_cubit.dart';

abstract class UserState extends Equatable {
  const UserState();
}

class UserInitial extends UserState {
  @override
  List<Object> get props => [];
}

class UserLoading extends UserState {
  @override
  List<Object> get props => [];
}

class UserLoaded extends UserState {
  final List<AuthUserEntity> users;
  const UserLoaded({
    required this.users,
  });
  @override
  List<Object> get props => [users];
}

class UserFaliure extends UserState {
  @override
  List<Object> get props => [];
}
