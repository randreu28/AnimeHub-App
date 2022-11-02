import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: const Text("Product page"),
        backgroundColor: Theme.of(context).primaryColorDark,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Container(
              padding: const EdgeInsets.only(bottom: 15),
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColorDark,
                  borderRadius: BorderRadius.circular(15)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: SizedBox.fromSize(
                  child: Image.network(
                      'https://media.istockphoto.com/photos/beef-cheeseburger-on-black-plate-with-flames-in-background-picture-id1371431471?b=1&k=20&m=1371431471&s=170667a&w=0&h=I53raoVmACQjW7AGLHjgvAqKlOeM8OouCa4K2iloxC0=',
                      fit: BoxFit.cover),
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            decoration: BoxDecoration(
              color: Theme.of(context).highlightColor,
              borderRadius: BorderRadius.circular(5),
            ),
            child: const Text(
              "New",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(30.0),
            child: Text(
              "Big double cheeseburger",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 0),
            child: Text(
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey),
                "Marble beef, cheddar cheese, jalapeño pepper, pickled cucumber, lettuce, red onion, BBQ sauce"),
          ),
        ],
      ),
    );
  }
}
