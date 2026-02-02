import 'package:flutter/material.dart';
import 'package:flutter_application_1/auth/created.dart';

import 'package:flutter_application_1/components/primary_btn.dart';
import 'package:flutter_application_1/components/socil_icon.dart';
import 'package:flutter_application_1/components/text_field.dart';
import 'package:flutter_application_1/constants.dart/colors.dart';
import 'package:flutter_application_1/constants.dart/images.dart';
import 'package:flutter_application_1/home/home_page.dart';
import 'package:flutter_application_1/password/forget_password.dart';

class LoginsignupScreen extends StatefulWidget {
  const LoginsignupScreen({super.key, required this.index});
  final int index;
  @override
  State<LoginsignupScreen> createState() => _LoginsignupScreenState();
}

class _LoginsignupScreenState extends State<LoginsignupScreen> {
  int selectedIndex = 0;

  @override
  void initState() {
    selectedIndex = widget.index;
    super.initState();
  }

  final List<Map<String, dynamic>> logindata = [
    {
      'text': "Hii, Welcome Back!",
      'subtext': "Please Provide Us with your\nLogin details",
      'title': 'Log In Now',
      'button': 'Next',
      'action': 'Sign Up',
      'showForgot': true,
    },
    {
      'text': "Create an account ",
      'subtext': "Please Provide Us with your\nSign Up details",
      'title': 'Sign Up Now',
      'button': 'Next',
      'action': 'Log In',
      'showForgot': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final data = logindata[selectedIndex];
    return Scaffold(
      backgroundColor: AppColor.backgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    padding: EdgeInsets.only(bottom: 50),
                    icon: Icon(
                      Icons.arrow_back_ios_new_outlined,
                      color: Colors.white,
                      size: 20,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Container(
                    height: 90,
                    margin: EdgeInsets.symmetric(vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data['text'],
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          data["subtext"],
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white.withOpacity(0.9),
                            height: 1.4,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: Text(
                        data['title'],
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    if (selectedIndex == 1) ...[
                      Text('Full Name', style: TextStyle(color: AppColor.lightgrey)),
                      Textfield(
                        showImage: false,
                        keyboardType: TextInputType.name,
                      ),
                    ],
                    SizedBox(height: 10),
                    Text('Email', style: TextStyle(color: AppColor.lightgrey)),
                    Textfield(
                      showImage: false,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(height: 10),
                    Text('Password', style: TextStyle(color: AppColor.lightgrey)),
                    Textfield(
                      showImage: true,
                      keyboardType: TextInputType.number,
                    ),
                    if (data['showForgot'])
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            minimumSize: Size(50, 30),
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            alignment: Alignment.centerLeft,
                          ),
                          onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => ForgetPassword()),
                          ),
                          child: Text(
                            'Forgot Password?',
                            style: TextStyle(color: AppColor.backgColor),
                          ),
                        ),
                      ),
                    SizedBox(height: 20),
                    PrimaryBtn(
                      text: data['button'],
                      isLoading: false,
                      onPressed: selectedIndex == 0
                          ? () {
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomePage(),
                                ),
                                (route) => false,
                              );
                            }
                          : () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Created(),
                                ),
                              );
                            },
                      bgclr: AppColor.backgColor,
                      isWhiteText: true,
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: Text(
                        'Or login with',
                        style: TextStyle(color: AppColor.lightgrey),
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        SocilIcon(path: AppImg.google),
                        SocilIcon(path: AppImg.facebook),
                        SocilIcon(path: AppImg.apple),
                      ],
                    ),
                    SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account ? ",
                          style: const TextStyle(color: AppColor.grey),
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            minimumSize: Size(50, 30),
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            alignment: Alignment.centerLeft,
                          ),
                          onPressed: () {
                            setState(() {
                              selectedIndex = selectedIndex == 0 ? 1 : 0;
                            });
                          },

                          child: Text(
                            data['action'],
                            style: TextStyle(
                              color: AppColor.backgColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 50),
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
