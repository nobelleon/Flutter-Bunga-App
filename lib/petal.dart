import 'package:flutter/material.dart';
import 'dart:math' as math;

class Petal extends StatelessWidget {
  final double angle;
  final Color? color1;
  final Color? color2;

  const Petal({super.key, required this.angle, this.color1, this.color2});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Positioned(
      top: 50 * math.cos(angle),
      right: 50 * math.sin(angle),
      child: Transform.translate(
        offset: Offset(-size.width / 2.5, size.height / 2.5),
        child: Transform.rotate(
          angle: angle,
          child: ClipPath(
            clipper: PetalClipper(),
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  gradient: RadialGradient(colors: [color1!, color2!])),
            ),
          ),
        ),
      ),
    );
  }
}

class PetalClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final centerX = size.width / 2;
    final centerY = size.height / 2;

    double controlX = 50;
    double controlY = 50;
    Path path = Path();
    path.moveTo(centerX, centerY - controlY);
    path.relativeQuadraticBezierTo(controlX, controlY, 0, controlY * 2);
    path.relativeQuadraticBezierTo(-controlX, -controlY, 0, -controlY * 2);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

const bgColor = Color(0xFF531A93);

const color1 = Color(0xFF35C4E4);
const color2 = Color(0xFF57ECAF);

const color3 = Color(0xFFEE2081);
const color4 = Colors.orange;
