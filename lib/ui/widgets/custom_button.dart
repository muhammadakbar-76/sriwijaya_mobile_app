import 'package:flutter/material.dart';
import '../../shared/theme.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.textButton,
    this.width = double.infinity,
    required this.eventFunc,
    this.margin = EdgeInsets.zero,
    this.disable = false,
  }) : super(key: key);

  final String textButton;

  final double width;

  final Function() eventFunc;

  final EdgeInsets margin;

  final bool disable;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      height: 55,
      width: width,
      child: TextButton(
        onPressed: disable ? () {} : eventFunc,
        child: Text(textButton,
            style: whiteTextStyle.copyWith(fontSize: 18, fontWeight: medium)),
        style: TextButton.styleFrom(
          backgroundColor: disable ? kGreyColor : kPrimaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: borderDefault,
          ),
        ),
      ),
    );
  }
}
