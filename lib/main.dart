import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoe_app_flutter/constants.dart';
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

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({super.key});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int _currentPage = 0;
  final List<String> _sizes = ['5', '5.5', '6', '6.6', '7', '7.5', '8'];
  int _selectedSizeIndex = 1;
  int _selectedUnitIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            //top navbar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      print("ouch!!");
                    },
                    child: Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: kDark,
                      size: 20,
                    ),
                  ),
                  //try to get the image in a local folder later
                  SvgPicture.network(
                    'https://upload.wikimedia.org/wikipedia/commons/a/a6/Logo_NIKE.svg',
                    height: 22,
                    colorFilter: const ColorFilter.mode(kDark, BlendMode.srcIn),
                  ),
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        width: 42,
                        height: 42,
                        decoration: BoxDecoration(
                          color: kDark,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(
                          Icons.shopping_bag_rounded,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                      Positioned(
                        top: -4,
                        right: -4,

                        child: Container(
                          alignment: Alignment.center,
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            color: kOrange,
                            shape: BoxShape.circle,
                          ),
                          child: Text(
                            "3",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 260,
                      child: Stack(
                        children: [
                          // ── Swipeable images ──────────────────
                          PageView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount: 3,
                            onPageChanged: (i) =>
                                setState(() => _currentPage = i),
                            itemBuilder: (context, index) {
                              int imageNumber = index + 1;
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 24,
                                ),
                                child: Image.asset(
                                  'images/NikeImage$imageNumber.png',
                                  fit: BoxFit.contain,
                                ),
                              );
                            },
                          ),

                          // ── Dot indicators ────────────────────
                          Positioned(
                            bottom: 10,
                            left: 0,
                            right: 0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(5, (i) {
                                final active = i == _currentPage;
                                return AnimatedContainer(
                                  duration: const Duration(milliseconds: 250),
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 3,
                                  ),
                                  width: active ? 22 : 7,
                                  height: 7,
                                  decoration: BoxDecoration(
                                    color: active
                                        ? kDark
                                        : kGrey.withValues(alpha: 0.34),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                );
                              }),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Men's Shoe",
                                    style: TextStyle(
                                      color: kGrey,
                                      fontSize: 15,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.star_rounded,
                                        color: kOrange,
                                        size: 18,
                                      ),
                                      SizedBox(width: 3),
                                      Text(
                                        "(4.5)",
                                        style: TextStyle(
                                          color: kGrey,
                                          fontSize: 13,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 6),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Nike Air Max",
                                    style: TextStyle(
                                      fontSize: 28,
                                      color: kDark,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                  Text(
                                    "\$290.00",
                                    style: TextStyle(
                                      color: kDark,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // ── Label row: "Size:" + US UK EU ────
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Size:",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: kDark,
                                    ),
                                  ),
                                  Row(
                                    children: List.generate(3, (i) {
                                      final units = ['US', 'UK', 'EU'];
                                      final active = i == _selectedUnitIndex;
                                      return GestureDetector(
                                        onTap: () => setState(
                                          () => _selectedUnitIndex = i,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                            left: 14,
                                          ),
                                          child: Text(
                                            units[i],
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                              color: active ? kDark : kGrey,
                                              decoration: active
                                                  ? TextDecoration.underline
                                                  : null,
                                              decorationColor: kDark,
                                              decorationThickness: 1.5,
                                            ),
                                          ),
                                        ),
                                      );
                                    }),
                                  ),
                                ],
                              ),

                              SizedBox(height: 14),

                              // ── Size chips ────────────────────────
                              SizedBox(
                                height: 52,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: _sizes.length,
                                  itemBuilder: (context, i) {
                                    final selected = i == _selectedSizeIndex;
                                    return GestureDetector(
                                      onTap: () => setState(
                                        () => _selectedSizeIndex = i,
                                      ),
                                      child: AnimatedContainer(
                                        duration: const Duration(
                                          milliseconds: 200,
                                        ),
                                        margin: const EdgeInsets.only(
                                          right: 10,
                                        ),
                                        width: 54,
                                        height: 54,
                                        decoration: BoxDecoration(
                                          color: selected
                                              ? kOrange
                                              : Colors.white,
                                          borderRadius: BorderRadius.circular(
                                            13,
                                          ),
                                          border: Border.all(
                                            color: selected
                                                ? kOrange
                                                : const Color(0xFFDDDDDD),
                                            width: 1.5,
                                          ),
                                        ),
                                        alignment: Alignment.center,
                                        child: Text(
                                          _sizes[i],
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600,
                                            color: selected
                                                ? Colors.white
                                                : kDark,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Column(
                            children: [
                              InkWell(
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 16),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("data", 
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: kDark
                                    ) ,
                                    ),
                                    Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      color: kDark,)
                                  ],
                                ),
                                ),
                            ),
                            ]
                            
                          ),
                          SizedBox(height: 100),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Placeholder(fallbackHeight: 70, color: Colors.amber),
          ],
        ),
      ),
    );
  }
}
