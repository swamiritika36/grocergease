// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/components/primary_btn.dart';
// import 'package:flutter_application_1/constants.dart/colors.dart';
// import 'package:flutter_application_1/constants.dart/images.dart';
// import 'package:flutter_application_1/auth/login_screen.dart';

// import 'package:pin_code_fields/pin_code_fields.dart';

// class VerificationScreen2 extends StatefulWidget {
//   const VerificationScreen2({super.key, required this.phoneNumber});
// final String phoneNumber;
//   @override
//   State<VerificationScreen2> createState() => _VerificationScreen2State();
// }
// class _VerificationScreen2State extends State<VerificationScreen2> {
//   bool isLoading = false;
//   String otp = "";
//   bool get isOtpComplete => otp.length == 4;
//   int _secondsRemaining = 30;
//   Timer? _timer;
//   bool _canResend = false;
//   @override
//   void initState() {
//     super.initState();
//     _startTimer();
//   }

//   void _startTimer() {
//     _secondsRemaining = 30;
//     _canResend = false;
//     _timer?.cancel();
//     _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
//       timer = _timer!;
//       if (_secondsRemaining == 0) {
//           _canResend = true;
//           timer.cancel();
//       } else {
//           _secondsRemaining--;
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColor.backgColor,
//       resizeToAvoidBottomInset: false,
//       appBar: AppBar(
//         backgroundColor: AppColor.backgColor,
//         elevation: 0,
//         automaticallyImplyLeading: false,
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back_ios_new_outlined, color: AppColor.white),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),

//         title: Padding(
//           padding: const EdgeInsets.only(top: 40),
//           child: Column(
//             children: [
//               Text(
//                 "Enter OTP",
//                 style: TextStyle(
//                   fontSize: 28,
//                   color: AppColor.white,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               Text(
//                 "Please enter the 4 digit we\nsent to ${widget.phoneNumber}",
//                 textAlign: TextAlign.center,
//                 style: TextStyle(color: AppColor.white, fontSize: 16),
//               ),
//             ],
//           ),
//         ),
//         toolbarHeight: 130,
//       ),

//       body: SafeArea(
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(bottom: 20),
//               child: Column(children: [
//                 ]
//               ),
//             ),

//             Expanded(
//               child: Container(
//                 width: double.infinity,
//                 decoration: const BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(30),
//                     topRight: Radius.circular(30),
//                   ),
//                 ),
//                 child: Column(
//                   children: [
//                     const SizedBox(height: 20),

//                     SizedBox(
//                       width: 250,
//                       child: Image.asset(
//                         AppImg.phnpassword,
//                         height: 129,
//                         width: 135.66,
//                         fit: BoxFit.contain,
//                       ),
//                     ),

//                     const SizedBox(height: 20),

//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 40),
//                       child: PinCodeTextField(
//                         length: 4,
//                         appContext: context,
//                         keyboardType: TextInputType.number,
//                         onChanged: (value) {
//                           setState(() {
//                             otp = value;
//                           });
//                         },
//                         onCompleted: (value) {
//                           setState(() {
//                             otp = value;
//                           });
//                         },

//                         pinTheme: PinTheme(
//                           shape: PinCodeFieldShape.box,
//                           borderRadius: BorderRadius.circular(10),
//                           fieldHeight: 60,
//                           fieldWidth: 50,
//                           activeColor: Colors.green,
//                           selectedColor: Colors.green,
//                           inactiveColor: Colors.grey.shade400,
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 10),
//                     _canResend
//                         ? TextButton(
//                             onPressed: () {
//                               _startTimer();
//                             },
//                             child: const Text(
//                               "Resend Code",
//                               style: TextStyle(
//                                 color: Colors.green,
//                                 fontSize: 16,
//                               ),
//                             ),
//                           )
//                         : RichText(
//                                   textAlign: TextAlign.center,
//                                   text: TextSpan(
//                                     text:"Resend code in  " ,
//                                     style: TextStyle(
//                                       fontSize: 16,
                                      
//                                       color: Colors.black,
//                                     ),
                                    
//                                     children: [
//                                       TextSpan(
//                                         text: "$_secondsRemaining s",
//                                         style: TextStyle(
//                                           color: AppColor.black,
//                                           fontWeight: FontWeight.bold,
//                                           fontSize: 16,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                         ),
                          

//                      SizedBox(height: 25),

//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 25),
//                       child: PrimaryBtn(
//                         onPressed: isOtpComplete
//                             ? () {
//                                 Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                     builder: (context) =>LoginScreen(index:0),
//                                   ),
//                                 );
//                               }
//                             : null,
//                         text: "Next",
//                         isLoading: false,
//                         bgclr: isOtpComplete
//                             ? Color(0xff0B5E34)
//                             : Color(0xff757575),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
