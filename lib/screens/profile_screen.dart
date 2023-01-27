import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:p1_coronado/utilities/loaders.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userLoad = ref.watch(loadUserProvider(username: "oddaelita"));

    return userLoad.when(
      data: (user) {
        return Scaffold(
          body: ListView(children: [
            Column(
              children: [
                Row(children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      padding: const EdgeInsets.all(5.0),
                      color: Colors.teal,
                      child: Image.network(
                        user.image!,
                        height: 180,
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Text(
                        "oddaelita",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      )
                    ],
                  )
                ]),
              ],
            )
          ]),
        );
      },
      error: (error, stackTrace) {
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
      },
      loading: () {
        return const Center(
          child: SizedBox(
              height: 200.0, child: LoadingIndicator(size: 20, borderWidth: 1)),
        );
      },
    );
  }
}
