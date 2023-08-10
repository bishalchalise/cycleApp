import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FirebaseConsts {
  static const String users = 'users';


}
  void toast(String message) {
    Fluttertoast.showToast(
      msg: message, 
      toastLength: Toast.LENGTH_LONG, 
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      textColor: Colors.white, 
      backgroundColor: Colors.blue, 
      fontSize: 16.0,
      );
  }