class ProductCard {
  final String imageUrl;
  final String title;
  final String brand;
  final String rating;
  final String review;

  final bool trending;

  ProductCard({
    required this.title,
    required this.imageUrl,
    required this.brand,
    required this.rating,
    required this.review,
    required this.trending,
  });

  factory ProductCard.fromJson(Map<String, dynamic> json) {
    return ProductCard(
      title: json['title'],
      imageUrl: json['imageUrl'],
      brand: json['imageUrl'],
      rating: json['imageUrl'],
      review: json['review'],
      trending: json['imageUrl'],
    );
  }
}
