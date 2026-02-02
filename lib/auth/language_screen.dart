import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/primary_btn.dart';
import 'package:flutter_application_1/components/textfleld_srch.dart';
import 'package:flutter_application_1/constants.dart/colors.dart';
import 'package:flutter_application_1/constants.dart/images.dart';
import 'package:flutter_application_1/splash/onboarding_screen_1.dart';
import 'package:flutter_application_1/splash/splash_screen_2.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreen();
}

class _LanguageScreen extends State<LanguageScreen> {
  bool isLoading = false;
  int selectedIndex = -1;

  final List<String> languages = [
    "India",
    "Bangladesh",
    "Turkey",
    "Korean",
    "Japan",
    "Pakistan",
  ];
  final List<String> imagePaths = [
    AppImg.india,
    AppImg.bangladesh,
    AppImg.turkey,
    AppImg.korean,
    AppImg.japan,
    AppImg.pak,
  ];
  List<Map<String, String>> richTextList = [
    {"main": "United States ", "highlight": "(US)"},
    {"main": "UK ", "highlight": "(English)"},
  ];

  List<String> richImagePaths = [AppImg.united, AppImg.uk];
  int get totalItems => richTextList.length + languages.length;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(backgroundColor: AppColor.white, toolbarHeight: 10),
      backgroundColor: AppColor.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios_new_outlined,
                      size: 20,
                      color: AppColor.erroclr,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OnboardingScreen1(),
                        ),
                      );
                    },
                  ),
                  SizedBox(width: 70),
                  Text(
                    "Language",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 32),
              TextfleldSrch(text: "Search", controller: null, onChanged: null),
              SizedBox(height: 32),

              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 1.80,
                ),
                itemCount: totalItems,
                itemBuilder: (context, index) {
                  final bool isRichText = index < richTextList.length;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColor.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: selectedIndex == index
                              ? AppColor.backgColor
                              : const Color.fromARGB(255, 214, 214, 214),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            isRichText
                                ? richImagePaths[index]
                                : imagePaths[index - richTextList.length],
                            height: 29,
                            width: 34,
                          ),
                          SizedBox(height: 8),
                          isRichText
                              ? RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                    text: richTextList[index]["main"],
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: richTextList[index]["highlight"],
                                        style: TextStyle(
                                          color: AppColor.black,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              : Text(
                                  languages[index - richTextList.length],
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                        ],
                      ),
                    ),
                  );
                },
              ),

              SizedBox(height: 30),

              PrimaryBtn(
                text: 'Done',
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
                    MaterialPageRoute(builder: (context) => SplashScreen2()),
                  );
                },
                bgclr: AppColor.backgColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
