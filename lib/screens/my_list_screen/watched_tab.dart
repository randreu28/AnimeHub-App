import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

class WatchedTab extends StatefulWidget {
  const WatchedTab({super.key});

  @override
  State<WatchedTab> createState() => _WatchedTabState();
}

class _WatchedTabState extends State<WatchedTab> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Watched tab"),
    );
  }
}
