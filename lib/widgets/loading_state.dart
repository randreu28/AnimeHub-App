import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';

class LoadingState extends StatelessWidget {
  const LoadingState({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
          height: 200.0, child: LoadingIndicator(size: 20, borderWidth: 1)),
    );
  }
}
