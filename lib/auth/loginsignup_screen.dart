import 'package:flutter/material.dart';
import 'package:flutter_application_1/auth/created.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  bool isLoading = false;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();

  int selectedIndex = 0;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  final List<Map<String, dynamic>> logindata = [
    {
      'text': "Hii, Welcome Back!",
      'subtext': "Please Provide Us with your\nLogin details",
      'title': 'Log In Now',
      'button': 'Login',
      'action': 'Sign Up',
      'showForgot': true,
    },
    {
      'text': "Create an account ",
      'subtext': "Please Provide Us with your\nSign Up details",
      'title': 'Sign Up Now',
      'button': 'Register',
      'action': 'Log In',
      'showForgot': false,
    },
  ];

  @override
  void initState() {
    selectedIndex = widget.index;
    super.initState();
  }

  Future<void> loginUser() async {
    try {
      setState(() => isLoading = true);

      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      User? user = userCredential.user;

      await user!.reload();
      user = _auth.currentUser;

      if (!user!.emailVerified) {
        showMessage("Please verify your email first!");
        await _auth.signOut();
        return;
      }

      if (!mounted) return;

      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => const HomePage()),
        (route) => false,
      );
    } on FirebaseAuthException catch (e) {
      showMessage(e.message ?? "Login Failed");
      print("Login Error: ${e.code}");
    } finally {
      if (mounted) setState(() => isLoading = false);
    }
  }

  Future<void> signupUser() async {
    try {
      setState(() => isLoading = true);

      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(
            email: emailController.text.trim(),
            password: passwordController.text.trim(),
          );

      await userCredential.user!.updateDisplayName(nameController.text.trim());

      await userCredential.user!.sendEmailVerification();

      showMessage("Verification email sent. Please check your email.");

      await _auth.signOut();

      if (!mounted) return;

      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const Created()),
      );
    } on FirebaseAuthException catch (e) {
      showMessage(e.message ?? "Signup Failed");
      print("Signup Error: ${e.code}");
    } finally {
      if (mounted) setState(() => isLoading = false);
    }
  }

  void showMessage(String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    super.dispose();
  }

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
                      Text(
                        'Full Name',
                        style: TextStyle(color: AppColor.lightgrey),
                      ),
                      Textfield(
                        controller: nameController,
                        showImage: false,
                        keyboardType: TextInputType.name,
                      ),
                    ],
                    SizedBox(height: 10),
                    Text('Email', style: TextStyle(color: AppColor.lightgrey)),
                    Textfield(
                      controller: emailController,
                      showImage: false,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Password',
                      style: TextStyle(color: AppColor.lightgrey),
                    ),
                    Textfield(
                      controller: passwordController,
                      showImage: true,
                      keyboardType: TextInputType.visiblePassword,
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
                      isLoading: isLoading,
                      onPressed: selectedIndex == 0 ? loginUser : signupUser,

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
