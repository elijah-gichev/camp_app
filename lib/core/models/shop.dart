import 'dart:convert';

class Shop {
  final String title;
  final String category;

  Shop(
    this.title,
    this.category,
  );

  Shop copyWith({
    String? title,
    String? category,
  }) {
    return Shop(
      title ?? this.title,
      category ?? this.category,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'category': category,
    };
  }

  factory Shop.fromMap(Map<String, dynamic> map) {
    return Shop(
      map['title'] ?? '',
      map['category'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Shop.fromJson(String source) => Shop.fromMap(json.decode(source));

  @override
  String toString() => 'Shop(title: $title, category: $category)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Shop && other.title == title && other.category == category;
  }

  @override
  int get hashCode => title.hashCode ^ category.hashCode;
}
