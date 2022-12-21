import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';

class AuthGate extends StatelessWidget {
  final Widget app;
  const AuthGate({Key? key, required this.app}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
        if (!snapshot.hasData) {
          return const MaterialApp(
            home: SignInScreen(
              providerConfigs: [
                EmailProviderConfiguration(),
              ],
            ),
          );
        }
        return app;
      },
    );
  }
}
