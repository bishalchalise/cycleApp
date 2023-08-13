import 'package:flutter/material.dart';

class ActionButton extends StatefulWidget {
  final Icon icon;
  const ActionButton({super.key, required this.icon});

  @override
  State<ActionButton> createState() => _ActionButtonState();
}

class _ActionButtonState extends State<ActionButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
      child: Container(
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  blurRadius: 2,
                  spreadRadius: 1,
                  color: Theme.of(context).highlightColor)
            ]),
        child: IconButton(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          iconSize: 20,
          onPressed: () {},
          icon: widget.icon,
          color: Colors.red,
        ),
      ),
    );
  }
}
