import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:p1_coronado/utilities/loaders.dart';
import 'package:intl/intl.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userLoad = ref.watch(loadUserProvider(username: "oddaelita"));

    return userLoad.when(
      data: (user) {
        final DateFormat formatter = DateFormat('yyyy-MM-dd');
        final String fechaCum = formatter.format(user.birthday!);
        final String fechaJoin = formatter.format(user.joined);
        return Scaffold(
          body: ListView(children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    color: Colors.teal,
                    child: Image.network(
                      user.image!,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Text(
                        user.username,
                        style: const TextStyle(
                            fontSize: 26, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        children: [
                          const Spacer(),
                          const Icon(Icons.cake),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            "Birthday: ",
                          ),
                          Text(fechaCum),
                          const Spacer(),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          const Spacer(),
                          const Icon(Icons.location_on),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text("Location: "),
                          Text(user.location.toString()),
                          const Spacer(),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          const Spacer(),
                          const Icon(Icons.person_add_alt_rounded),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text("Joined on: "),
                          Text(fechaJoin),
                          const Spacer(),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          const Spacer(),
                          const Icon(Icons.person),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text("Gender: "),
                          Text(user.gender.toString()),
                          const Spacer(),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    color: Colors.grey.shade900.withOpacity(0.5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Spacer(),
                        CWatching(),
                        Spacer(),
                        Completed(),
                        Spacer(),
                        Favorite(),
                        Spacer(),
                      ],
                    ))
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

class Favorite extends StatelessWidget {
  const Favorite({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Spacer(),
          Text(
            "0",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          Center(
            child: Text(
              "Favorites",
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Icon(
            Icons.favorite,
            color: Colors.red,
            size: 30,
          ),
          Spacer(),
        ],
      ),
    );
  }
}

class Completed extends StatelessWidget {
  const Completed({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 100,
      child: Column(
        children: const [
          Spacer(),
          Text(
            "0",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          Center(
            child: Text(
              "Completed",
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Icon(
            Icons.tv,
            size: 30,
          ),
          Spacer(),
        ],
      ),
    );
  }
}

class CWatching extends StatelessWidget {
  const CWatching({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 100,
      child: Column(
        children: const [
          Spacer(),
          Text(
            "0",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          Center(
            child: Text(
              "Watching",
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Icon(
            Icons.live_tv,
            size: 30,
          ),
          Spacer(),
        ],
      ),
    );
  }
}
