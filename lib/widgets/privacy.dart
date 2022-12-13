import 'package:flutter/material.dart';

class Privacy extends StatelessWidget {
  const Privacy({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      height: 30,
      decoration: const BoxDecoration(
        color: Color(0xFF368bd6),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.settings_outlined,
              color: Colors.white,
            ),
            SizedBox(
              width: 4,
            ),
            Text(
              "Privacy",
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
