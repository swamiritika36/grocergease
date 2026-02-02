import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/primary_btn.dart';
import 'package:flutter_application_1/components/primary_outlinebtn.dart';
import 'package:flutter_application_1/constants.dart/colors.dart';
import 'package:flutter_application_1/constants.dart/images.dart';
import 'package:flutter_application_1/auth/loginsignup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, required int index});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: AppColor.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Image.asset(AppImg.greengirl, height: 334, fit: BoxFit.cover),
        toolbarHeight: 340,
        centerTitle: true,
      ),

      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.only(top: 10),
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: AppColor.backgColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 18,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Grocery Shopping",
                        style: TextStyle(
                          fontSize: 48,
                          color: AppColor.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Find Your Fresh and Tasty Grocery with\nbest sales.",
                        style: TextStyle(fontSize: 14, color: AppColor.white),
                      ),
                      SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: PrimaryOutlinebtn(
                              text: "Log In",
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        LoginsignupScreen(index: 0),
                                  ),
                                );
                              },
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: PrimaryBtn(
                              text: 'Sign Up',
                              isLoading: false,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        LoginsignupScreen(index: 1),
                                  ),
                                );
                              },
                              bgclr: AppColor.white,
                              isWhiteText: false,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "OR",
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColor.white,
                            ),
                          ),
                          SizedBox(width: 4),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Shopping as a Guest",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: AppColor.white,
                                ),
                              ),
                              SizedBox(height: 1),
                              Container(
                                height: 0.5,
                                width: 133,
                                color: AppColor.white,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
