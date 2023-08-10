import 'package:equatable/equatable.dart';

class AuthUserEntity extends Equatable {
  final String? uid;
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? photoURL;
  final String? password;

  const AuthUserEntity({
    this.uid,
    this.email,
    this.firstName,
    this.lastName,
    this.photoURL,
    this.password,
  });

  

  @override
  List<Object?> get props => [
        uid,
        firstName,
        lastName,
        email,
        photoURL,
        password,
      ];
}
