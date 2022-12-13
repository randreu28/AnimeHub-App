import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/anime.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final anime = context.watch<Anime>();
    return Container(
        width: double.infinity,
        color: const Color(0xFFe1e7f5),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                anime.titulo,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
              ),
              Text(
                anime.subtitulo,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ));
  }
}
