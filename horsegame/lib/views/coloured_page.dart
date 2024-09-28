import 'package:flutter/material.dart';

class ColouredPage extends StatelessWidget {
  final Color color;
  final bool hasHorse;
  final VoidCallback onHorseTap;
  final double horseX; // X position for the horse
  final double horseY; // Y position for the horse

  const ColouredPage({
    super.key,
    required this.color,
    required this.hasHorse,
    required this.onHorseTap,
    this.horseX = 0.5,
    this.horseY = 0.5,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: color,
        ),
        if (hasHorse)
          Positioned(
            left: horseX,
            top: horseY,
            child: GestureDetector(
              onTap: onHorseTap,
              child: Image.asset('assets/horse.jpg', width: 100),
            ),
          ),
      ],
    );
  }
}
