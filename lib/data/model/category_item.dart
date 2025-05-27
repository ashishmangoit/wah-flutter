class CategoryItem {
  final String title;
  final String iconUrl;

  CategoryItem({required this.title, required this.iconUrl});

  factory CategoryItem.fromJson(Map<String, dynamic> json) {
    return CategoryItem(
      title: json['title'],
      iconUrl: json['iconUrl'],
    );
  }
}
