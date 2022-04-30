import 'package:flutter/material.dart';
import '../../shared/theme.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField(
      {Key? key,
      required this.title,
      required this.controller,
      this.margin = EdgeInsets.zero,
      this.hint = "",
      this.isObscureText = false})
      : super(key: key);

  final EdgeInsets margin;

  final String title;

  final String hint;

  final bool isObscureText;

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          title,
        ),
        const SizedBox(height: 6),
        TextFormField(
          controller: controller,
          cursorColor: kBlackColor,
          obscureText: isObscureText,
          decoration: InputDecoration(
              hintText: hint,
              border: OutlineInputBorder(borderRadius: borderDefault),
              focusedBorder: OutlineInputBorder(
                borderRadius: borderDefault,
                borderSide: BorderSide(color: kPrimaryColor),
              )),
        )
      ]),
    );
  }
}
