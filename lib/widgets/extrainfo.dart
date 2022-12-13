import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/anime.dart';

class ExtraInfo extends StatelessWidget {
  const ExtraInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final anime = context.watch<Anime>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: const Color(0xFFe1e7f5),
                  borderRadius: BorderRadius.circular(5)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  anime.order,
                  style: const TextStyle(
                    color: Color(0xFF2e51a2),
                    fontSize: 12,
                  ),
                ),
              )),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Synopsis",
                    textAlign: TextAlign.left,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    anime.synopsis,
                    textAlign: TextAlign.left,
                    style: const TextStyle(fontSize: 15),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    anime.synopsis2,
                    textAlign: TextAlign.left,
                    style: const TextStyle(fontSize: 15),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
