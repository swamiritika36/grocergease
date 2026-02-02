import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/primary_btn.dart';
import 'package:flutter_application_1/components/text_field.dart';
import 'package:flutter_application_1/constants.dart/colors.dart';
import 'package:flutter_application_1/constants.dart/images.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    resizeToAvoidBottomInset: false,

      backgroundColor: AppColor.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
            size: 18,
            color: AppColor.erroclr,
          ),
          onPressed: () { Navigator.pop(context);},
        ),
        title: const Text("Edit Profile"),
        centerTitle: true,
        backgroundColor: AppColor.white,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: 110,
                          height: 110,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: AppColor.backgColor,
                              width: 1,
                            ),
                            image: const DecorationImage(
                              image: AssetImage(AppImg.profile),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 4,
                          right: 4,
                          child: CircleAvatar(
                            radius: 16,
                            backgroundColor: Colors.white,
                            child: const Icon(
                              Icons.edit,
                              size: 16,
                              color: AppColor.backgColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      "Jelly",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      width: 200,
                      height: 44,
                      decoration: BoxDecoration(
                                    color: Color(0xffCEE0D6),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [Text("Jelly@gmail.com",style: TextStyle(color: AppColor.backgColor),)],
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 10),
              Text('Name',style:TextStyle(color:AppColor.greyblr)),

              Textfield(
                showImage: false,
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 10),
              Text('Phone Number',style:TextStyle(color:AppColor.greyblr)),

              Textfield(
                showImage: false,
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 10),
              Text('Email Address',style:TextStyle(color:AppColor.greyblr)),
              Textfield(showImage: false, keyboardType: TextInputType.name),
          

              SizedBox(height: 10),
              Text('Date of Birth',style:TextStyle(color:AppColor.greyblr)),

              Textfield(
                showImage: false,
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 10),
              PrimaryBtn(
                text: "Save Changes",
                onPressed: () {
                  
                },
                isLoading: false,
                bgclr: AppColor.backgColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}