
part of 'single_user_cubit.dart';

abstract class SingleUserState extends Equatable {
  const SingleUserState();
}

class SingleUserInitial extends SingleUserState {
  @override
  List<Object> get props => [];
}

class SingleUserLoading extends SingleUserState {
  @override
  List<Object> get props => [];
}

class SingleUserLoaded extends SingleUserState {
  final AuthUserEntity user;
 const SingleUserLoaded({
    required this.user,
  });
  @override
  List<Object> get props => [user];
}

class SingleUserFaliure extends SingleUserState {
  @override
  List<Object> get props => [];
}
