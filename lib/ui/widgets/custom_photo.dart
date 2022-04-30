import 'package:flutter/material.dart';
import '../../shared/theme.dart';

class CustomPhoto extends StatelessWidget {
  const CustomPhoto({
    Key? key,
    required this.height,
    required this.width,
    required this.imageUrl,
    this.margin = EdgeInsets.zero,
    this.fit = BoxFit.cover,
  }) : super(key: key);

  final double height;

  final double width;

  final EdgeInsets margin;

  final String imageUrl;

  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: borderDefault,
        image: DecorationImage(
          fit: fit,
          image: AssetImage(imageUrl),
        ),
      ),
    );
  }
}
