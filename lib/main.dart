import 'package:flutter/material.dart';
import 'product_detail_screen.dart';

// import 'ShoeStack.dart';

void main() {
  runApp(const ShoeApp());
}

class ShoeApp extends StatelessWidget {
  const ShoeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Shoe_App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(useMaterial3: true),
      home: ProductDetailPage(),
    );
  }
}

