class Product {
  final String title;
  final String category;
  final String description;
  final double price;
  final int rating;
  final String imageName;

  Product({
    required this.title,
    required this.category,
    required this.description,
    required this.price,
    required this.rating,
    required this.imageName,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      title: json['title'],
      category: json['category'],
      description: json['description'],
      price: json['price'],
      rating: json['rating'],
      imageName: json['imageName'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'category': category,
      'description': description,
      'price': price,
      'rating': rating,
      'imageName': imageName,
    };
  }
}
