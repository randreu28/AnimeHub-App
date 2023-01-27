import 'package:flutter/material.dart';

class ErrorState extends StatelessWidget {
  final Object error;
  const ErrorState({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text(
          "An error has occured. Please try again later. ($error)",
          maxLines: 2,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 10, color: Colors.red),
        ),
      ),
    );
  }
}
