import 'package:flutter/material.dart';

class Products with ChangeNotifier {
  final String? id;
  final String? title;
  final String? imageURL;
  final double? price;
  final String? desc;
  final String? sellerName;
  final String? arFilter;
  bool isFavorite;
  Products(
      {this.id,
      this.title,
      this.imageURL,
      this.price,
      this.desc,
      this.sellerName,
      this.arFilter,
      this.isFavorite = false});
}
