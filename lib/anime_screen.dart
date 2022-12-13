import 'package:flutter/material.dart';
import 'package:p1_coronado/widgets/extrainfo.dart';
import 'package:p1_coronado/widgets/favoritecompleted.dart';
import 'package:p1_coronado/widgets/header.dart';
import 'package:p1_coronado/widgets/infogeneral.dart';
import 'package:p1_coronado/widgets/mynavbar.dart';
import 'package:p1_coronado/widgets/privacy.dart';

class AnimeScreen extends StatelessWidget {
  const AnimeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: AppBar(
        title: const MyNavBar(),
        backgroundColor: Colors.blue.shade900,
      ),
      body: Stack(
        children: [
          Column(
            children: const [
              Header(),
              GeneraInfo(),
              FavoriteCompleted(),
              ExtraInfo(),
            ],
          ),
          const Align(
            alignment: Alignment.bottomRight,
            child: Privacy(),
          ),
        ],
      ),
    ));
  }
}
