class Article {
  final String title;
  final String article;
  final String image;
  final String category;
  final String author;
  final String date;

  Article({
    required this.title,
    required this.article,
    required this.image,
    required this.category,
    required this.author,
    required this.date,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      title: json['productId'],
      article: json['article'],
      image: json['image'],
      category: json['category'],
      author: json['author'],
      date: json['date'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'article': article,
      'image': image,
      'category': category,
      'author': author,
      'date': date,
    };
  }
}
