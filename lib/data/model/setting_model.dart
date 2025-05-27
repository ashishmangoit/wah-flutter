class SettingsModel {
  final Footer footer;
  final Header header;
  final Category category;
  final DealCard dealCard;

  SettingsModel({
    required this.footer,
    required this.header,
    required this.category,
    required this.dealCard,
  });

  factory SettingsModel.fromJson(Map<String, dynamic> json) {
    final value = json['value'] as Map<String, dynamic>;
    return SettingsModel(
      footer: Footer.fromJson(value['footer']),
      header: Header.fromJson(value['header']),
      category: Category.fromJson(value['category']),
      dealCard: DealCard.fromJson(value['deal_card']),
    );
  }
}

class Footer {
  final double height;
  final double textPadding;

  Footer({required this.height, required this.textPadding});

  factory Footer.fromJson(Map<String, dynamic> json) => Footer(
        height: double.parse(json['height']),
        textPadding: double.parse(json['text_padding']),
      );
}

class Header {
  final double height;
  final double padding;
  final String? background;

  Header({required this.height, required this.padding, this.background});

  factory Header.fromJson(Map<String, dynamic> json) => Header(
        height: double.parse(json['height']),
        padding: double.parse(json['padding']),
        background: json['background'],
      );
}

class Category {
  final double grid;
  final double padding;

  Category({required this.grid, required this.padding});

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        grid: double.parse(json['grid_image_size']),
        padding: double.parse(json['padding']),
      );
}

class DealCard {
  final double width;
  final double margin;
  final double padding;
  final String background;
  final double borderRadius;
  final String textImagePosition;

  DealCard({
    required this.width,
    required this.margin,
    required this.padding,
    required this.background,
    required this.borderRadius,
    required this.textImagePosition,
  });

  factory DealCard.fromJson(Map<String, dynamic> json) => DealCard(
        width: double.parse(json['width']),
        margin: double.parse(json['margin']),
        padding: double.parse(json['padding']),
        background: json['background'],
        borderRadius: double.parse(json['border_radius']),
        textImagePosition: json['text_image_position'],
      );
}
