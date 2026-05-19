import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  final List<Map<String, dynamic>> _items = [
  {'name': 'Nike Air Max',  'price': 290.00, 'qty': 1, 'bookmarked': true,  'image': 'assets/images/NikeImages(1).png'},
  {'name': 'Nike Wmns',     'price': 290.00, 'qty': 1, 'bookmarked': false, 'image': 'assets/images/NikeImages(2).png'},
  {'name': 'Nike Flyknit 3','price': 290.00, 'qty': 1, 'bookmarked': true,  'image': 'assets/images/NikeImages(3).png'},
];

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}