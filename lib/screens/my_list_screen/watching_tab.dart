import 'package:flutter/material.dart';

class WatchingTab extends StatefulWidget {
  const WatchingTab({
    Key? key,
  }) : super(key: key);

  @override
  State<WatchingTab> createState() => _WatchingTabState();
}

class _WatchingTabState extends State<WatchingTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Column(
            children: const [Text("MYLIST")],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 180,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      //imagen
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //Image.network(anime!.image, height: 250),
                          Image.network(
                            'https://cdn.myanimelist.net/images/anime/1471/128323.jpg',
                            /* height: 150 */
                          ),
                        ],
                      ),
                      //info
                      Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.6),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  children: const [
                                    Text("NAME",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold))
                                  ],
                                ),
                                Column(
                                  children: [
                                    Container(
                                      child: Row(
                                        children: const [
                                          Text(
                                            "TV",
                                            textAlign: TextAlign.left,
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          Icon(Icons.star_border,
                                              color: Colors.white),
                                          Text(
                                            "SCORE",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          Icon(Icons.person,
                                              color: Colors.white),
                                          Text(
                                            "USERS",
                                            style:
                                                TextStyle(color: Colors.white),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      //icon
                      Align(
                        child: Container(
                          alignment: Alignment.topLeft,
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.8),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(2)),
                          ),
                          child: const Icon(
                            Icons.favorite_border,
                            size: 50,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
