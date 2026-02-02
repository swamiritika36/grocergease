import 'package:flutter/material.dart';
import 'package:flutter_application_1/auth/loginsignup_screen.dart';
import 'package:flutter_application_1/components/primary_btn.dart';
import 'package:flutter_application_1/constants.dart/colors.dart';
import 'package:flutter_application_1/constants.dart/images.dart';

class Congrats extends StatelessWidget {
  const Congrats({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 170),
        decoration: BoxDecoration(color: AppColor.backgColor),
      
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(AppImg.done),
            SizedBox(height: 24),
            Text(
              "Congrats!",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColor.white,
                decoration: TextDecoration.none,
              ),
            ),
            SizedBox(height: 8),
            Text(
              "Your password changed Successfully ",
              style: TextStyle(
                fontSize: 14,
                color: AppColor.white,
                decoration: TextDecoration.none,
              ),
            ),
            SizedBox(height: 32),
            PrimaryBtn(
              text: "Back to Log In",
              isLoading: false,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => LoginsignupScreen(index: 0)));
              },
              bgclr: AppColor.white,
              isWhiteText: false,
            ),
          ],
        ),
      ),
    );
  }
}
