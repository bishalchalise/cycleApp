import 'package:flutter/material.dart';

class CommonTextField extends StatelessWidget {
  final TextEditingController controller;
  final bool obscureText;
  final String hintText;
  final String label;
  final int maxLine;
  final Widget? prefixIcon; 
  final Widget? suffixicon; 
  const CommonTextField({
    Key? key,
    required this.controller,
    required this.obscureText,
    required this.hintText,
    required this.label,
     this.prefixIcon,
     this.suffixicon,
    this.maxLine = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
     height: 80,
      width: double.infinity,
       padding: const EdgeInsets.symmetric(
        horizontal: 30.0,
        vertical: 12.0,
      ),
      child: TextFormField(
        obscureText: obscureText,
        controller: controller,
        autofocus: true,
        obscuringCharacter : '*',
        decoration: InputDecoration(
          label: Text(label),
          hintText: hintText,
          prefixIcon: prefixIcon,
          suffixIcon:suffixicon,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.blue,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.blue,
            ),
          ),
        ),
        
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Enter Your $hintText";
          }
          return null;
        },
        maxLines: maxLine,
      ),
    );
  }
}
