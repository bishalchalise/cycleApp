import 'package:flutter/material.dart';

class AppBarContent extends StatelessWidget {
  final String title;
  const AppBarContent({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 50),
          child: Container(
            height: 40,
            width: 40,
            padding: const EdgeInsets.only(right: 3),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.white.withOpacity(0.5),
                  blurRadius: 5.0,
                  spreadRadius: 2.0,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: const Icon(
              Icons.keyboard_arrow_left_outlined,
              color: Colors.blue,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20),
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 40,
              fontWeight: FontWeight.bold,
              height: 1,
            ),
          ),
        ),
      ],
    );
  }
}
