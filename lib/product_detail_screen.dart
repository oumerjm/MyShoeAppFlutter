import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'constants.dart';
import 'cart_Screen.dart';
import 'widgets.dart';

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

  bool _descExpanded = false;
  bool _deliveryExpanded = false;

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
                  CircleBackButton(onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const CartScreen()),
                    ),
                    ),
                  
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
                      height: 230,
                      child: Stack(
                        children: [
                          PageView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount: 5,
                            onPageChanged: (i) =>
                                setState(() => _currentPage = i),
                            itemBuilder: (context, index) {
                              int imageNumber = index + 1;
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 24,
                                ),
                                child: Image.asset(
                                  'assets/images/NikeImage$imageNumber.png',
                                  fit: BoxFit.contain,
                                ),
                              );
                            },
                          ),

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
                              Divider(
                                height: 1,
                                thickness: 1,
                                color: Color(0xFFF0F0F0),
                              ),

                              // ── Description accordion ─────────────
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  InkWell(
                                    onTap: () => setState(
                                      () => _descExpanded = !_descExpanded,
                                    ),
                                    splashColor: Colors.transparent,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 16,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Description',
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600,
                                              color: kDark,
                                            ),
                                          ),
                                          Icon(
                                            _descExpanded
                                                ? Icons
                                                      .keyboard_arrow_up_rounded
                                                : Icons
                                                      .keyboard_arrow_down_rounded,
                                            color: kDark,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  if (_descExpanded)
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        bottom: 14,
                                      ),
                                      child: Text(
                                        'The Nike Air Max SC is crafted with synthetic leather and mesh for durability and breathability. The foam midsole adds lightweight cushioning for all-day comfort.',
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: kGrey,
                                          height: 1.65,
                                        ),
                                      ),
                                    ),
                                ],
                              ),

                              Divider(
                                height: 1,
                                thickness: 1,
                                color: Color(0xFFF0F0F0),
                              ),

                              // ── Free Delivery accordion ───────────
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  InkWell(
                                    onTap: () => setState(
                                      () => _deliveryExpanded =
                                          !_deliveryExpanded,
                                    ),
                                    splashColor: Colors.transparent,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 16,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Free Delivery and Returns',
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600,
                                              color: kDark,
                                            ),
                                          ),
                                          Icon(
                                            _deliveryExpanded
                                                ? Icons
                                                      .keyboard_arrow_up_rounded
                                                : Icons
                                                      .keyboard_arrow_down_rounded,
                                            color: kDark,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  if (_deliveryExpanded)
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        bottom: 14,
                                      ),
                                      child: Text(
                                        'Free standard delivery on orders over \$50. Easy free returns within 30 days of purchase.',
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: kGrey,
                                          height: 1.65,
                                        ),
                                      ),
                                    ),
                                ],
                              ),

                              Divider(
                                height: 1,
                                thickness: 1,
                                color: Color(0xFFF0F0F0),
                              ),
                            ],
                          ),
                          SizedBox(height: 100),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20, 14, 20, 22),
              decoration: BoxDecoration(
                border: Border(top: BorderSide(color: Color(0xFFF0F0F0))),
              ),
              child: Row(
                children: [
                  Container(
                    width: 52,
                    height: 52,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(13),
                      border: Border.all(color: Color(0xFFDDDDDD), width: 1.5),
                    ),
                    child: Icon(
                      Icons.bookmark_border_rounded,
                      color: kDark,
                      size: 22,
                    ),
                  ),
                  SizedBox(width: 14),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 54,

                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: kDark,
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          "Add to Cart",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
