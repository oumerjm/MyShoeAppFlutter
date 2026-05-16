import 'package:flutter/material.dart';

void main() {
  runApp(const ShoeApp());
}


class ShoeApp extends StatelessWidget {
  const ShoeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: "Shoe_App",
      debugShowCheckedModeBanner: false ,
      theme: ThemeData.dark(
        useMaterial3: true
      ),
      home:  ProductDetailPage(),
    );
  }
}

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({super.key});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  @override
  Widget build(BuildContext context) {
    return  Placeholder();
  }
}