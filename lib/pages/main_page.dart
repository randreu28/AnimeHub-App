import 'package:flutter/material.dart';
import 'package:p1/pages/product_page.dart';

import '../models/product.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: const Text("Go to Second Screen"),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductPage(
                    product: Product(
                        name: "Big doube cheeseburger",
                        description:
                            "Marble beef cheese, jalapeño pepper, pickled cucumber lettuce, red onion, BBQ sauce",
                        image:
                            "https://media.istockphoto.com/photos/beef-cheeseburger-on-black-plate-with-flames-in-background-picture-id1371431471?b=1&k=20&m=1371431471&s=170667a&w=0&h=I53raoVmACQjW7AGLHjgvAqKlOeM8OouCa4K2iloxC0=",
                        isNew: true,
                        onPressed: null,
                        price: 8.5,
                        weight: 320)),
              ),
            );
          },
        ),
      ),
    );
  }
}
