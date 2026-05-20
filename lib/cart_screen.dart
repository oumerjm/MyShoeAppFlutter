import 'package:flutter/material.dart';
import 'package:shoe_app_flutter/constants.dart';
import 'package:shoe_app_flutter/widgets.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final List<Map<String, dynamic>> _items = [
    {
      'name': 'Nike Air Max',
      'price': 290.00,
      'qty': 1,
      'bookmarked': true,
      'image': 'assets/images/NikeImage1.png',
    },
    {
      'name': 'Nike Wmns',
      'price': 290.00,
      'qty': 1,
      'bookmarked': false,
      'image': 'assets/images/NikeImage2.png',
    },
    {
      'name': 'Nike Flyknit 3',
      'price': 290.00,
      'qty': 1,
      'bookmarked': true,
      'image': 'assets/images/NikeImage3.png',
    },
  ];

  double get _total =>
      _items.fold(0.0, (sum, item) => sum + item['price'] * item['qty']);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Top nav ───────────────────────────
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: kDark,
                      size: 20,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const Text(
                      'SEE BOOKMARK LIST',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: kGrey,
                        decoration: TextDecoration.underline,
                        decorationColor: kGrey,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // ── Header ────────────────────────────
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text(
                    'My Bag',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w800,
                      color: kDark,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Text(
                      '${_items.length} Items',
                      style: const TextStyle(fontSize: 14, color: kGrey),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // ── Item list ─────────────────────────
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                physics: const BouncingScrollPhysics(),
                itemCount: _items.length,
                separatorBuilder: (_, __) => const SizedBox(height: 14),
                itemBuilder: (_, i) => _buildCartItem(i),
              ),
            ),

            // ── Total + Checkout ──────────────────
            _buildCheckoutBar(),
          ],
        ),
      ),
    );
  }

  // ── Single cart item ────────────────────────
  Widget _buildCartItem(int i) {
    final item = _items[i];
    return Dismissible(
      key: ValueKey(item['name'] + i.toString()),
      direction: DismissDirection.endToStart,
      // peach delete background revealed on swipe
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 24),
        decoration: BoxDecoration(
          color: const Color(0xFFFFECE8),
          borderRadius: BorderRadius.circular(18),
        ),
        child: const Icon(
          Icons.delete_outline_rounded,
          color: Color(0xFFFF3B30),
          size: 28,
        ),
      ),
      onDismissed: (_) => setState(() => _items.removeAt(i)),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: const Color(0xFFF0F0F0), width: 1.5),
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 238, 237, 237),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            // ── Shoe image ──────────────────────
            Container(
              width: 82,
              height: 82,
              decoration: BoxDecoration(
                color: kLight,
                borderRadius: BorderRadius.circular(14),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: Image.asset(item['image'], fit: BoxFit.contain),
              ),
            ),

            const SizedBox(width: 14),

            // ── Name / price / qty ──────────────
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // name + bookmark
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        item['name'],
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: kDark,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => setState(
                          () => item['bookmarked'] = !item['bookmarked'],
                        ),
                        child: Icon(
                          item['bookmarked']
                              ? Icons.bookmark_rounded
                              : Icons.bookmark_border_rounded,
                          color: item['bookmarked'] ? kOrange : kGrey,
                          size: 21,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 4),

                  // price
                  Text(
                    '\$${item['price'].toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: kGrey,
                    ),
                  ),

                  const SizedBox(height: 12),

                  // qty controls  −  1  +
                  Row(
                    children: [
                      // minus button
                      QtyButton(
                        icon: Icons.remove,
                        filled: false,
                        onTap: () {
                          if (item['qty'] > 1) setState(() => item['qty']--);
                        },
                      ),

                      // quantity number
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          '${item['qty']}',
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: kDark,
                          ),
                        ),
                      ),

                      QtyButton(
                        icon: Icons.add,
                        filled: true,
                        onTap: () => setState(() => item['qty']++),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ── Total + checkout bar ────────────────────
  Widget _buildCheckoutBar() {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Color(0xFFF0F0F0))),
      ),
      child: Column(
        children: [
          // total row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Total',
                style: TextStyle(
                  fontSize: 16,
                  color: kGrey,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                '\$${_total.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                  color: kDark,
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // checkout button
          GestureDetector(
            onTap: () {},
            child: Container(
              width: double.infinity,
              height: 56,
              decoration: BoxDecoration(
                color: kDark,
                borderRadius: BorderRadius.circular(16),
              ),
              alignment: Alignment.center,
              child: const Text(
                'Checkout',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
