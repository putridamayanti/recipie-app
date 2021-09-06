class Product {
  final image;
  final name;
  final description;

  Product({
    this.image,
    this.name,
    this.description,
  });

  factory Product.fromJson(Map json) {
    return new Product(
        image: json['image'],
        name: json['name'],
        description: json['description']);
  }
}
