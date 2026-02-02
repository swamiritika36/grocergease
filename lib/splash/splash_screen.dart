import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants.dart/colors.dart';
import 'package:flutter_application_1/constants.dart/images.dart';
import 'package:flutter_application_1/auth/language_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
        Future.delayed(Duration(seconds: 3),(){
      // ignore: use_build_context_synchronously
      Navigator.of( context).pushReplacement(MaterialPageRoute(builder: (context) => LanguageScreen(),));
    });
    return Scaffold(
      backgroundColor:AppColor.backgColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
               AppImg.logo,
                height: 84,
                width: 296,
               fit: BoxFit.cover,
              ),

            ],
          ),
          
        ),
        
      ),

    );
  }
}

