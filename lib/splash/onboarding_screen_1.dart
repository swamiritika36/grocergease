
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/primary_btn.dart';
import 'package:flutter_application_1/components/primary_outlinebtn.dart';
import 'package:flutter_application_1/constants.dart/colors.dart';
import 'package:flutter_application_1/constants.dart/images.dart';
import 'package:flutter_application_1/verification/verification_screen_1.dart';
class OnboardingScreen1 extends StatefulWidget {
  const OnboardingScreen1({super.key});

  @override
  State<OnboardingScreen1> createState() => _OnboardingScreen1State();
}

class _OnboardingScreen1State extends State<OnboardingScreen1> {
  bool isLoading = false;
  
  int currentIndex = 0;

  List<String> images = [
    AppImg.onbarding1,
     AppImg.onbarding2,
      AppImg.onbarding3,
  ];

  List<String> titles = [
    "Track Your Order",
    "Flexible Scheduling",
    "Save\nFavorites",
  ];

  List<String> subtitles = [
    "See live updates on your order from store to door.",
    "Easy grocery shopping and fresh finds at\nyour fingertips.",
    "Create and save shopping lists for faster\nordering.",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(images[currentIndex]),
            fit: BoxFit.cover,
        
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ClipRRect(
              borderRadius: BorderRadiusGeometry.all(Radius.circular(2)),
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 10,
                  sigmaY: 10,
                ), 

                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8,vertical: 10),
                  decoration: BoxDecoration(
                    color: AppColor.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Text(
                        titles[currentIndex],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 48,
                          color: AppColor.white,
                          fontWeight: FontWeight.bold,
                          height: 1,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        subtitles[currentIndex],
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14, color: AppColor.white,),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(3, (dotIndex) {
                          return Container(
                            margin: EdgeInsets.symmetric(horizontal: 2),
                            width: 30,
                            height: 4,
                            decoration: BoxDecoration(
                              color: currentIndex == dotIndex
                                  ? AppColor.white
                                  : Colors.white38,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          );
                        }),
                      ),
                      SizedBox(height: 20),
                      PrimaryBtn(
                        text: 'Next',
                        isLoading: isLoading,
                        onPressed: () {
                          if (currentIndex < images.length - 1) {
                            setState(() => currentIndex++);
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => VerificationScreen1()),
                            );
                          }
                        },
                        bgclr: AppColor.backgColor,
                      ),
                      SizedBox(height: 10),
                      PrimaryOutlinebtn( text: "Skip",
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => widget),
                          );
                        },
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
