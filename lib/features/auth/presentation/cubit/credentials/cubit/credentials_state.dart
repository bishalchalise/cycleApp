part of 'credentials_cubit.dart';

abstract class CredentialsState extends Equatable {
  const CredentialsState();
}

class CredentialsInitial extends CredentialsState {
  @override
  List<Object> get props => [];
}

class CredentialsLoading extends CredentialsState {
  @override
  List<Object> get props => [];
}
class CredentialsSuccess extends CredentialsState {
  @override
  List<Object> get props => [];
}
class CredentialsFaliure extends CredentialsState {
  @override
  List<Object> get props => [];
}
