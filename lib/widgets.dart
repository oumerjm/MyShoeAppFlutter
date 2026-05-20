import 'package:flutter/material.dart';
import 'package:shoe_app_flutter/constants.dart';


class CircleBackButton extends StatelessWidget {
  final VoidCallback onTap;
  const CircleBackButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: const Icon(
        Icons.arrow_back_ios_new_rounded,
        color: kDark,
        size: 20,
      ),
    );
  }
}


class CartBadge extends StatelessWidget {
  final int count;
  final VoidCallback onTap;
  const CartBadge({super.key, required this.count, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: kDark,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.shopping_bag_outlined,
              color: Colors.white,
              size: 20,
            ),
          ),
          Positioned(
            top: -6,
            right: -6,
            child: Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                color: kOrange,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 2),
              ),
              alignment: Alignment.center,
              child: Text(
                '$count',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Quantity button ──────────────────────────
class QtyButton extends StatelessWidget {
  final IconData icon;
  final bool filled;
  final VoidCallback onTap;
  const QtyButton({
    super.key,
    required this.icon,
    required this.filled,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: filled ? kOrange : Colors.white,
          border: Border.all(
            color: filled ? kOrange : const Color(0xFFDDDDDD),
            width: 1.5,
          ),
        ),
        child: Icon(
          icon,
          size: 16,
          color: filled ? Colors.white : kDark,
        ),
      ),
    );
  }
}