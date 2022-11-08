import 'package:flutter/material.dart';
import 'package:p1/models/product.dart';
import 'package:provider/provider.dart';

class Feature extends StatelessWidget {
  final String type; //Is it better a bool?
  const Feature({Key? key, required this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final product = context.watch<Product>();
    return Row(
      children: [
        Icon(type == "price"
            ? Icons.label_important_outline //Not the same icons...
            : Icons.monitor_weight_outlined),
        const SizedBox(
          width: 5,
        ),
        type == "price"
            ? Text("${product.price} \$")
            : Text("${product.weight} g")
      ],
    );
  }
}
