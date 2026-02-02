import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/primary_btn.dart';
import 'package:flutter_application_1/components/text_field.dart';
import 'package:flutter_application_1/constants.dart/colors.dart';
import 'dart:async';
import 'package:flutter_application_1/constants.dart/images.dart';
import 'package:flutter_application_1/password/forget_password2.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  bool isOtpScreen = false;
  String otp = "";
  bool get isOtpComplete => otp.length == 4;
  int secondsRemaining = 30;
  bool canResend = false;
  Timer? timer;

  @override
  void initState() {
    super.initState();
  }

  void startTimer() {
    timer?.cancel();
    secondsRemaining = 30;
    canResend = false;

    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (secondsRemaining == 0) {
        setState(() {
          canResend = true;
        });
        t.cancel();
      } else {
        setState(() {
          secondsRemaining--;
        });
      }
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back_ios_new_outlined, size: 20),
                onPressed: () {
                  if (isOtpScreen) {
                    setState(() {
                      isOtpScreen = false;
                    });
                  } else {
                    Navigator.pop(context);
                  }
                },
              ),

              Padding(
                padding: const EdgeInsets.only(top: 60),
                child: Center(
                  child: Image.asset(
                    isOtpScreen ? AppImg.enter : AppImg.greenmen,
                    height: 220,
                  ),
                ),
              ),

              SizedBox(height: 13),

              Text(
                isOtpScreen ? "OTP\nverification" : "Forgot\nPassword",
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  height: 1.1,
                ),
              ),

              SizedBox(height: 10),

              Text(
                isOtpScreen
                    ? "Enter the verification code we just sent on\nyour email address."
                    : "Don’t worry it occurs Please enter the email\naddress linked with your account.",
                style: TextStyle(fontSize: 16, color: Color(0xff757575)),
              ),

              SizedBox(height: 20),

              if (!isOtpScreen)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Email",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff757575),
                      ),
                    ),
                    SizedBox(height: 8),
                    Textfield(
                      keyboardType: TextInputType.emailAddress,
                      showImage: false,
                    ),
                  ],
                ),

              if (isOtpScreen)
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      child: PinCodeTextField(
                        length: 4,
                        appContext: context,
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          setState(() {
                            otp = value;
                          });
                        },

                        pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(10),
                          fieldHeight: 60,
                          fieldWidth: 50,
                          activeColor: Colors.green,
                          selectedColor: Colors.green,
                          inactiveColor: Colors.grey.shade400,
                        ),
                      ),
                    ),
                    SizedBox(height: 4),

                    Center(
                      child: canResend
                          ? TextButton(
                              onPressed: startTimer,
                              child: const Text(
                                "Resend Code",
                                style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 16,
                                ),
                              ),
                            )
                          : RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                    text:"Resend code in  " ,
                                    style: TextStyle(
                                      fontSize: 16,
                                      
                                      color: Colors.black,
                                    ),
                                    
                                    children: [
                                      TextSpan(
                                        text: "$secondsRemaining s",
                                        style: TextStyle(
                                          color: AppColor.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                        ),
                          
                    ),
                  ],
                ),

              SizedBox(height: 13),

              PrimaryBtn(
                text: isOtpScreen ? "Verify" : "Send Code",
                bgclr: const Color(0xFF0B6A3C),
                isLoading: false,
                onPressed: (isOtpScreen && !isOtpComplete)
                    ? null
                    : () {
                        if (!isOtpScreen) {
                          setState(() {
                            isOtpScreen = true;
                          });
                          startTimer();
                        } else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ForgetPassword2(),
                            ),
                          );
                        }
                      },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
