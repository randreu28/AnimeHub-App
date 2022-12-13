import 'package:flutter/material.dart';

class MyNavBar extends StatelessWidget {
  const MyNavBar({
    Key? key,
  }) : super(key: key);

  static const espaciado = SizedBox(
    width: 15,
  );

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.network(
          "http://store-images.s-microsoft.com/image/apps.63654.9007199266506523.6eac6b6a-8bb6-459f-b5bb-28383cc469bc.1da183a6-e5d8-4b93-8abd-3e2de0139603",
          height: 70,
        ),
        const Spacer(),
        const Icon(Icons.person, size: 35),
        espaciado,
        const Icon(Icons.menu_book_sharp, size: 35),
        espaciado,
        const Icon(Icons.search, size: 35),
        espaciado,
        Stack(
          alignment: Alignment.topRight,
          children: [
            const Icon(
              Icons.menu,
              size: 35,
            ),
            Align(
              child: Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.orange.shade900,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
