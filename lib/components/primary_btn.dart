import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants.dart/colors.dart';

class PrimaryBtn extends StatelessWidget {
  final String text;
  final Color? bgclr;
  final Icon? icons;
  final bool isLoading;

  final VoidCallback? onPressed;
  final bool isWhiteText;
  final Color? textColor;

  const PrimaryBtn({
    super.key,
    required this.text,
    this.bgclr,
    this.icons,
    this.onPressed,
    this.isWhiteText = true,
    required this.isLoading,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 1,
            offset: Offset(0, 3),
          ),
        ],

        borderRadius: BorderRadius.circular(10),
      ),

      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 14),
          backgroundColor: bgclr,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: onPressed,
        child: isLoading
            ? CircularProgressIndicator(strokeWidth: 2, color: Colors.white)
            : Text(
                text,
                style: TextStyle(
                  fontSize: 14,
                  color: isWhiteText
                      ? Colors.white
                      : (textColor ?? AppColor.backgColor),
                ),
              ),
      ),
    );
  }
}
