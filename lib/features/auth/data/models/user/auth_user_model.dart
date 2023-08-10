// ignore_for_file: annotate_overrides, overridden_fields

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:cyclego/features/auth/domain/entities/auth_user_entity.dart';

class AuthUserModel extends AuthUserEntity {
  final String? uid;
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? photoURL;
  const AuthUserModel({
    this.uid,
    this.email,
    this.firstName,
    this.lastName,
    this.photoURL,
  }) : super(
          uid: uid,
          email: email,
          firstName: firstName,
          lastName: lastName,
          photoURL: photoURL,
  
        );

  factory AuthUserModel.fromSnapshot(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return AuthUserModel(
      uid: snapshot['uid'],
      email: snapshot['email'],
      firstName: snapshot['firstName'],
      lastName: snapshot['lastName'],
      photoURL: snapshot['photoURL'],
    );
  }
  Map<String, dynamic> toJson() => {
        "uid": uid,
        "email": email,
        "firstName": firstName,
        "lastName": lastName,
        "photoURL": photoURL,
      };
}
