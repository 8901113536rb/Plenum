import 'package:flutter/material.dart';

class CustomBottomRadiusClipper extends CustomClipper<Path> {
  final double radius;

  CustomBottomRadiusClipper({this.radius = 20});

  @override
  Path getClip(Size size) {
    Path path = Path();

    // Start at the top-left corner
    path.lineTo(0, 0); // Move to the top-left corner

    // Draw straight line to the top-right corner
    path.lineTo(size.width, 0); // Draw to the top-right corner

    // Now move to the bottom-right corner, making a rounded corner
    path.lineTo(size.width, size.height - radius); // Line to just before the curve
    path.quadraticBezierTo(
      size.width, size.height, // Control point for the curve
      size.width - radius, size.height, // End point of the curve (rounded corner)
    );

    // Now move to the bottom-left corner, making a rounded corner
    path.lineTo(radius, size.height); // Line to just before the curve
    path.quadraticBezierTo(
      0, size.height, // Control point for the curve
      0, size.height - radius, // End point of the curve (rounded corner)
    );

    // Close the path by drawing a line back to the top-left corner
    path.lineTo(0, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class CustomBottomRadius extends StatelessWidget {
  final Widget child;
  final double radius;

  CustomBottomRadius({required this.child, this.radius = 20});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CustomBottomRadiusClipper(radius: radius), // Apply the custom clipper
      child: child, // Pass the child widget (e.g., Container)
    );
  }
}
