// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:open_fashion/constants/style_guides.dart';

part 'product.g.dart';

@HiveType(typeId: HiveId.product)
class Product extends HiveObject {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String brand;
  @HiveField(3)
  final String image;
  @HiveField(4)
  final double price;
  @HiveField(5)
  final String category;
  @HiveField(6)
  final Rating rating;

  Product({
    required this.id,
    required this.title,
    required this.brand,
    required this.image,
    required this.price,
    required this.category,
    required this.rating,
  });

  factory Product.empty() => Product(id: 0, title: '', image: '', price: 0, category: '', rating: Rating.empty(), brand: '');

  

  Product copyWith({
    int? id,
    String? title,
    String? brand,
    String? image,
    double? price,
    String? category,
    Rating? rating,
  }) {
    return Product(
      id: id ?? this.id,
      title: title ?? this.title,
      brand: brand ?? this.brand,
      image: image ?? this.image,
      price: price ?? this.price,
      category: category ?? this.category,
      rating: rating ?? this.rating,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'brand': brand,
      'image': image,
      'price': price,
      'category': category,
      'rating': rating.toMap(),
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'] as int,
      title: map['title'] as String,
      brand: map['brand'] as String,
      image: map['image'] as String,
      price: map['price'] as double,
      category: map['category'] as String,
      rating: Rating.fromMap(map['rating'] as Map<String,dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) => Product.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Product(id: $id, title: $title, brand: $brand, image: $image, price: $price, category: $category, rating: $rating)';
  }

  @override
  bool operator ==(covariant Product other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.title == title &&
      other.brand == brand &&
      other.image == image &&
      other.price == price &&
      other.category == category &&
      other.rating == rating;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      title.hashCode ^
      brand.hashCode ^
      image.hashCode ^
      price.hashCode ^
      category.hashCode ^
      rating.hashCode;
  }
}

@HiveType(typeId: HiveId.rating)
class Rating {
  @HiveField(0)
  double rate;
  @HiveField(1)
  int count;

  Rating({
    required this.rate,
    required this.count,
  });
  factory Rating.empty() => Rating(rate: 0, count: 0);

  Rating copyWith({
    double? rate,
    int? count,
  }) {
    return Rating(
      rate: rate ?? this.rate,
      count: count ?? this.count,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'rate': rate,
      'count': count,
    };
  }

  factory Rating.fromMap(Map<String, dynamic> map) {
    return Rating(
      rate: map['rate']?.toDouble() ?? 0.0,
      count: map['count']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Rating.fromJson(String source) => Rating.fromMap(json.decode(source));

  @override
  String toString() => 'Rating(rate: $rate, count: $count)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Rating &&
      other.rate == rate &&
      other.count == count;
  }

  @override
  int get hashCode => rate.hashCode ^ count.hashCode;
}