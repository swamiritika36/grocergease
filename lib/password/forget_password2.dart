import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/primary_btn.dart';
import 'package:flutter_application_1/components/text_field.dart';
import 'package:flutter_application_1/constants.dart/colors.dart';

import 'package:flutter_application_1/password/congrats.dart';

class ForgetPassword2 extends StatefulWidget {
  const ForgetPassword2({super.key});

  @override
  State<ForgetPassword2> createState() => _ForgetPassword2State();
}

class _ForgetPassword2State extends State<ForgetPassword2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(right: 40),
                child: IconButton(
                  icon: const Icon(Icons.arrow_back_ios_new_outlined),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Create new Password",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Your new password must be unique from\nthose previously used",
                      style: TextStyle(fontSize: 14),
                    ),
                    SizedBox(height: 28),
                    Text(
                      "New Password",
                      style: TextStyle(color: AppColor.bodyclrbtn),
                    ),
                    SizedBox(height: 4),
                    Textfield(
                      showImage: true,
                      keyboardType: TextInputType.number,
                    ),

                    SizedBox(height: 28),

                    Text(
                      "Confirm Password",
                      style: TextStyle(color: AppColor.bodyclrbtn),
                    ),
                    SizedBox(height: 4),
                    Textfield(
                      showImage: true,
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(height: 32),
                    PrimaryBtn(
                      text: "Reset Password",
                      isLoading: false,
                      bgclr: AppColor.backgColor,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Congrats()),
                        );
                      },
                      textColor: AppColor.white,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
