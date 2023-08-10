// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cyclego/core/constants/constatns.dart';
import 'package:cyclego/features/auth/data/models/user/auth_user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cyclego/features/auth/data/data_scources/remote/remote_data_sources.dart';
import 'package:cyclego/features/auth/domain/entities/auth_user_entity.dart';

class FirebaseRemoteDataSourceImpl implements FirebaseRemoteDataSource {
  FirebaseFirestore firebaseFirestore;
  FirebaseAuth firebaseAuth;
  FirebaseRemoteDataSourceImpl({
    required this.firebaseFirestore,
    required this.firebaseAuth,
  });
  @override
  Future<void> createUser(AuthUserEntity user) async {
    final userCollection = firebaseFirestore.collection(
      FirebaseConsts.users,
    );
    final uid = await getCurrentUserId();
    userCollection.doc(uid).get().then(
      (userDoc) {
        final newUser = AuthUserModel(
          uid: uid,
          firstName: user.firstName,
          lastName: user.lastName,
          email: user.email,
        ).toJson();

        if (!userDoc.exists) {
          userCollection.doc(uid).set(newUser);
        } else {
          userCollection.doc(uid).update(newUser);
        }
      },
    ).catchError((error) {
      toast("Some Error Occured!");
    });
  }

  @override
  Future<String> getCurrentUserId() async => firebaseAuth.currentUser!.uid;
  @override
  Stream<List<AuthUserEntity>> getSingleUser(String uid) {
    final userCollection = firebaseFirestore
        .collection(FirebaseConsts.users)
        .where('uid', isEqualTo: uid)
        .limit(1);

    return userCollection.snapshots().map((querySnapshot) =>
        querySnapshot.docs.map((e) => AuthUserModel.fromSnapshot(e)).toList());
  }

  @override
  Stream<List<AuthUserEntity>> getUsers(AuthUserEntity user) {
    final userCollection = firebaseFirestore.collection(FirebaseConsts.users);

    return userCollection.snapshots().map(
          (querySnapshot) => querySnapshot.docs
              .map((e) => AuthUserModel.fromSnapshot(e))
              .toList(),
        );
  }

  @override
  Future<bool> isSignedIn() async => firebaseAuth.currentUser?.uid != null;
  @override
  Future<void> signInUser(AuthUserEntity user) async {
    try {
      if (user.email!.isNotEmpty || user.password!.isNotEmpty) {
        await firebaseAuth.signInWithEmailAndPassword(
            email: user.email!, password: user.password!);
      } else {
        toast('Email or Password cannot be Empty');
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        toast('User not found');
      } else if (e.code == 'wrong-password') {
        toast("Wrong Email or Password");
      }
    }
  }

  @override
  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }

  @override
  Future<void> signUpUser(AuthUserEntity user) async {
    try {
      await firebaseAuth
          .createUserWithEmailAndPassword(
        email: user.email!,
        password: user.password!,
      )
          .then((value) async {
        if (value.user?.uid != null) {
          await createUser(user);
        }
      });
      return;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        toast('Email already taken');
      } else {
        toast('Something went wrong');
      }
    }
  }

  @override
  Future<void> updateUser(AuthUserEntity user) async {
    final userCollection = firebaseFirestore.collection(FirebaseConsts.users);
    Map<String, dynamic> userInformation = {};

    if (user.firstName != '' || user.firstName != null) {
      userInformation['firstName'] = user.firstName;
    }
    if (user.lastName != '' || user.lastName != null) {
      userInformation['lastName'] = user.lastName;
    }
    if (user.photoURL != '' || user.photoURL != null) {
      userInformation['photoURL'] = user.photoURL;
    }
    if (user.password != '' || user.password != null) {
      userInformation['password'] = user.password;
    }
    userCollection.doc(user.uid).update(userInformation);
  }
}
