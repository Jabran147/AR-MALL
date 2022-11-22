import 'package:flutter/material.dart';
import '../model/product_model.dart';

class ProductProvider with ChangeNotifier {
  final List<Products> _items = [
    Products(
        id: 'p1',
        title: 'Air Jordan 2',
        imageURL:
            'https://www.sneakerjagers.com/_next/image?url=https%3A%2F%2Fstatic.sneakerjagers.com%2Fp%2F4QJnUEmrzfz02iP9nX25oyB9qGZ3M915YbFK2iTy.png&w=1920&q=100',
        price: 9999.99,
        desc:
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry`s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
        sellerName: 'Nike',
        arFilter:
            'https://lens.snapchat.com/4394187f0b4c428c913656befdfcc633?share_id=BBCCa9fseJ4&locale=en-GB'),
    Products(
        id: 'p2',
        title: 'Air Jordan 3',
        imageURL:
            'https://www.sneakerjagers.com/_next/image?url=https%3A%2F%2Fstatic.sneakerjagers.com%2Fp%2F4QJnUEmrzfz02iP9nX25oyB9qGZ3M915YbFK2iTy.png&w=1920&q=100',
        price: 10999.99,
        desc:
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry`s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
        sellerName: 'Nike',
        arFilter:
            'https://lens.snapchat.com/4394187f0b4c428c913656befdfcc633?share_id=BBCCa9fseJ4&locale=en-GB'),
    Products(
        id: 'p3',
        title: 'Air Jordan 4',
        imageURL:
            'https://www.sneakerjagers.com/_next/image?url=https%3A%2F%2Fstatic.sneakerjagers.com%2Fp%2F4QJnUEmrzfz02iP9nX25oyB9qGZ3M915YbFK2iTy.png&w=1920&q=100',
        price: 11999.99,
        desc:
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry`s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
        sellerName: 'Nike',
        arFilter:
            'https://lens.snapchat.com/4394187f0b4c428c913656befdfcc633?share_id=BBCCa9fseJ4&locale=en-GB'),
    Products(
        id: 'p4',
        title: 'Air Jordan 5',
        imageURL:
            'https://www.sneakerjagers.com/_next/image?url=https%3A%2F%2Fstatic.sneakerjagers.com%2Fp%2F4QJnUEmrzfz02iP9nX25oyB9qGZ3M915YbFK2iTy.png&w=1920&q=100',
        price: 12999.99,
        desc:
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry`s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
        sellerName: 'Nike',
        arFilter:
            'https://lens.snapchat.com/4394187f0b4c428c913656befdfcc633?share_id=BBCCa9fseJ4&locale=en-GB'),
  ];

  List<Products> get items {
    return [..._items];
  }
}
