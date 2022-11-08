class Product {
  String name;
  bool isNew;
  String description;
  double price;
  double weight;
  String image;
  void Function()? onPressed;

  Product({
    required this.name,
    required this.isNew,
    required this.description,
    required this.price,
    required this.weight,
    required this.image,
    required this.onPressed,
  });
}
