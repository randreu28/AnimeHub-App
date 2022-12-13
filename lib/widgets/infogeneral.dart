import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/anime.dart';

class GeneraInfo extends StatelessWidget {
  const GeneraInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final anime = context.watch<Anime>();
    return Row(
      children: [
        Image.network(anime.image, height: 250),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(Icons.star_border_outlined, size: 30),
                  Text(anime.rating, style: const TextStyle(fontSize: 23)),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    anime.users,
                    style: const TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                ],
              ),
              Row(
                children: [
                  const Text(
                    "Ranked",
                    style: TextStyle(color: Color(0xFF2e51a2), fontSize: 14),
                  ),
                  Text(
                    anime.ranking,
                    style:
                        const TextStyle(color: Color(0xFF2e51a2), fontSize: 17),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                anime.canal,
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Aired",
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
              Text(
                anime.aired,
                style: const TextStyle(
                  color: Color(0xFF2e51a2),
                  fontSize: 17,
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              const Text(
                "Studios",
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
              Text(
                anime.studio,
                style: const TextStyle(
                  color: Color(0xFF2e51a2),
                  fontSize: 17,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: const [
                    Icon(
                      Icons.play_arrow,
                      color: Color(0xFF2e51a2),
                    ),
                    Text(
                      "More Information",
                      style: TextStyle(
                        color: Color(0xFF2e51a2),
                        fontSize: 17,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
