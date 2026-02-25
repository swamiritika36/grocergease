import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants.dart/colors.dart';
import 'package:flutter_application_1/constants.dart/images.dart';

class Textfield extends StatelessWidget {
  final bool showImage;
final TextEditingController? controller;
  final dynamic keyboardType;
  const Textfield({super.key, this.showImage = false, this.controller, this.keyboardType});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        suffixIcon: showImage
            ? GestureDetector(onTap: () {}, child: Image.asset(AppImg.eyes))
            : null,

        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.txtfieldbr),
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
