import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:p1_coronado/utilities/loaders.dart';
import 'package:intl/intl.dart';
import 'package:p1_coronado/widgets/error_state.dart';
import 'package:p1_coronado/widgets/loading_state.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userLoad = ref.watch(loadUserProvider(username: "TheDead117"));

    return userLoad.when(
      data: (user) {
        final DateFormat formatter = DateFormat('yyyy-MM-dd');
        String fechaCum = "No date available";
        String fechaJoin = "No date available";

        if (user.birthday != null && user.joined != null) {
          fechaCum = formatter.format(user.birthday!);
          fechaJoin = formatter.format(user.joined!);
        }
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
                      user.image != null
                          ? user.image!
                          : 'https://i.postimg.cc/zv414PTR/imagenot.png',
                      height: user.image != null ? null : 300,
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
                          Text(user.location != null
                              ? user.location.toString()
                              : "No location available"),
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
                          Text(user.gender != null
                              ? user.gender.toString()
                              : "No gender available"),
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
        return ErrorState(error: error);
      },
      loading: () {
        return const LoadingState();
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
