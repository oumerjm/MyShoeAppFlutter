import 'package:flutter/material.dart';
import 'package:shoe_app_flutter/constants.dart';

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
      'image': 'assets/images/NikeImages(1).png',
    },
    {
      'name': 'Nike Wmns',
      'price': 290.00,
      'qty': 1,
      'bookmarked': false,
      'image': 'assets/images/NikeImages(2).png',
    },
    {
      'name': 'Nike Flyknit 3',
      'price': 290.00,
      'qty': 1,
      'bookmarked': true,
      'image': 'assets/images/NikeImages(3).png',
    },
  ];
  int imageNumber = 1;
  double get _total =>
      _items.fold(0.0, (sum, item) => sum + item['price'] * item['qty']);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
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
                Text(
                  "SEE BOOKMARK LIST",
                  style: TextStyle(
                    // fontStyle: FontStyle.underline
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "My Bag",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 30,
                    color: kDark,
                  ),
                ),
                Text("3 Items", style: TextStyle(color: kGrey)),
              ],
            ),
            Container(
              child: Row(
                children: [
                  Image.asset(
                    'images/NikeImage$imageNumber.png',
                    fit: BoxFit.contain,
                  ),
                  Column(
                    children: [
                      Text("Nike Air Max", style: TextStyle(
                        fontWeight: FontWeight.w700
                      ),
                      ),
                      Row(
                        children: [
                          Text("\$290.00"),
                          Icon(Icons.bookmark_border_rounded, color: Colors.deepOrangeAccent,)
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.add, color: kGrey,),
                          Text("1"),
                          Icon(Icons.add, color: kGrey,),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
