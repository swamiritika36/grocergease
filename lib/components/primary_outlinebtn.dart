import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants.dart/colors.dart';

class PrimaryOutlinebtn extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final bool isFilled;
  
  final Color? textColor;
  final Color? filledTextColor;

  const PrimaryOutlinebtn({
    super.key,
    required this.text,
    this.onPressed,
    this.isFilled = false,
    
    this.textColor,
    this.filledTextColor,
  });

  @override
  Widget build(BuildContext context) {
    final Color finalTextColor = isFilled
        ? (filledTextColor ?? AppColor.backgColor)
        : (textColor ?? AppColor.white);

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 10),
    
        decoration: BoxDecoration(
          color: isFilled ? AppColor.white : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isFilled ? AppColor.backgColor : AppColor.white,
            width: 1,
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: finalTextColor,
            ),
          ),
        ),
      ),
    );
  }
}
