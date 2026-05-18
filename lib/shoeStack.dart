import 'package:flutter/material.dart';

class ShoeStack extends StatefulWidget {
  const ShoeStack({super.key});

  @override
  State<ShoeStack> createState() => _ShoeStackState();
}

class _ShoeStackState extends State<ShoeStack> {
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final int totalNikeImages = 5;

    return SizedBox(
      height: 260,
      child: Stack(
        children: [
          PageView.builder(
            physics: BouncingScrollPhysics(),
            controller: _pageController,
            itemCount: totalNikeImages,
            itemBuilder: (context, index) {
              int imageNumber = index + 1;
              String assetPath = 'assets/images/NikeImages($imageNumber).png';

              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),               
                  child: Center(
                    child: Image.asset(assetPath, fit: BoxFit.contain),
                  ),
              );
            },
          ),
          Positioned(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
            ))
        ],
      ),
    );
  }
}
