import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants.dart/colors.dart';

class TextfleldSrch extends StatelessWidget {
  final String text;

  final dynamic controller;

  final dynamic onChanged;
  const TextfleldSrch({
    super.key,
    required this.text,
    required this.controller,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 36,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: TextField(
        controller: controller,
        onChanged: onChanged,

        decoration: InputDecoration(
          hintText: text,
        prefixIconConstraints: BoxConstraints(maxWidth: 30),
          hintStyle: TextStyle(color: AppColor.bodyclrbtn),
          prefixIcon: Padding(
            padding: EdgeInsets.only(left: 10, ),
            child: Icon(Icons.search, size: 20, color: AppColor.greyblr),
          ),

          suffixIcon: Icon(Icons.mic, color: AppColor.bodyclrbtn),
          contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          fillColor: AppColor.srchbdr,
          filled: true,
        ),
      ),
    );
  }
}
