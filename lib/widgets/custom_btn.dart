import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomBtn extends StatelessWidget {
  String name;
  Function() function;
  CustomBtn({super.key, required this.name, required this.function});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: function,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 60),
          backgroundColor: Theme.of(context).colorScheme.primary,
        ),
        child: Text(
          name,
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
        ));
  }
}
