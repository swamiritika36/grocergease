import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/primary_btn.dart';
import 'package:flutter_application_1/constants.dart/colors.dart';
import 'package:flutter_application_1/constants.dart/images.dart';
import 'package:flutter_application_1/verification/verification_screen_2.dart';

class VerificationScreen1 extends StatefulWidget {
  const VerificationScreen1({super.key});

  @override
  State<VerificationScreen1> createState() => _VerificationScreen1State();
}

class _VerificationScreen1State extends State<VerificationScreen1> {
  TextEditingController phoneController = TextEditingController();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColor.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,size: 18,
            color: AppColor.erroclr,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 32),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 50),
              child: Column(
                children: [
                  Text(
                    "Enter your phone number",
                    style: TextStyle(
                      fontSize: 24,
                      color: AppColor.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8,),
                  Text(
                    "Please provide us with your phone number\nto start",
                    style: TextStyle(fontSize: 14, color: AppColor.black),
                  ),
                ],
              ),
            ),

            SizedBox(height: 28),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey, width: 1),
              ),
              child: Row(
                children: [
                  Image.asset(AppImg.india, width: 16, height: 14, scale: 1.8),
                  SizedBox(width: 4),
                  const Text(
                    "+91",
                    style: TextStyle(
                      color: AppColor.nofldclr,
                      fontSize: 17,
                    ),
                  ),

                  Container(
                    width: 1,
                    height: 40,
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    color:  AppColor.nofldclr,
                  ),

                  Expanded(
                    child: TextField(
                      controller: phoneController,
                      keyboardType: TextInputType.number,
                      style: TextStyle(color: Colors.black, fontSize: 17),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "24457580087",
                        hintStyle: TextStyle(color:  AppColor.black, ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            PrimaryBtn(
              text: 'Continue',
              isLoading: isLoading,
              onPressed: () {
                setState(() {
                  isLoading = true;
                });
                Future.delayed(const Duration(microseconds: 5), () {
                  setState(() {
                    isLoading = false;
                  });
                });
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        VerificationScreen2(phoneNumber: phoneController.text),
                  ),
                );
              },
              bgclr: AppColor.backgColor,
            ),
            SizedBox(height: 58),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account? ",
                  style: TextStyle(color: AppColor.greyblr, fontSize: 14),
                ),
                Text(
                  "Sign up",
                  style: TextStyle(
                    color: AppColor.backgColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
