import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/bottamnevbar.dart';
import 'package:flutter_application_1/components/primary_btn.dart';
import 'package:flutter_application_1/constants.dart/colors.dart';
import 'package:flutter_application_1/constants.dart/images.dart';

class Created extends StatefulWidget {
  const Created({super.key});

  @override
  State<Created> createState() => _CreatedState();
}

class _CreatedState extends State<Created> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: AppColor.white),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 170),
        child: Column(
          children: [
            Image.asset(AppImg.celebretion),
            SizedBox(height: 30),
            Column(
              children: [
                Text(
                  "Account created",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColor.black,
                    decoration: TextDecoration.none,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 8),
                Text(
                  "Your account have successfully been created.Click continue to explore app",
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColor.greyblr,
                    decoration: TextDecoration.none,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            SizedBox(height: 30),
            PrimaryBtn(
              text: "Continue",
              isLoading: false,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Bottamnevbar()),
                );
              },
              bgclr: AppColor.backgColor,
            ),
          ],
        ),
      ),
    );
  }
}
