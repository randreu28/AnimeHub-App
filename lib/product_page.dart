import 'package:flutter/material.dart';
import 'package:p1/models/product.dart';

class ProductPage extends StatelessWidget {
  final Product product;
  const ProductPage({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const space = SizedBox(height: 20);
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text(product.name),
        backgroundColor: Theme.of(context).primaryColorDark,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: 15),
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColorDark,
                  borderRadius: BorderRadius.circular(15)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: SizedBox.fromSize(
                  child: Image.network(product.image, fit: BoxFit.cover),
                ),
              ),
            ),
            space,
            if (product.isNew == true)
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
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
            space,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Text(
                product.name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ),
            space,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 0),
              child: Text(
                product.description,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.grey),
              ),
            ),
            space,
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    const Icon(
                        Icons.label_important_outline), //Not the same icon...
                    const SizedBox(
                      width: 5,
                    ),
                    Text("${product.price} \$"),
                  ],
                ),
                const SizedBox(width: 20),
                Row(
                  children: [
                    const Icon(
                        Icons.monitor_weight_outlined), //Not the same icon...
                    const SizedBox(
                      width: 5,
                    ),
                    Text("${product.weight} g"),
                  ],
                ),
              ],
            ),
            space,
            space,
            ElevatedButton(
                onPressed: product.onPressed,
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      Theme.of(context).highlightColor),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                  ),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 60),
                  child: Text(
                    "Taste it for ${product.price}\$",
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
