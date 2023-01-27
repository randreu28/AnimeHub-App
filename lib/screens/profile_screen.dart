import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
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
                    'https://i.pinimg.com/564x/88/d9/fa/88d9faa3959bedd1f0eca6fca1de7c67.jpg',
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
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  )
                ],
              )
            ]),
          ],
        )
      ]),
    );
  }
}
