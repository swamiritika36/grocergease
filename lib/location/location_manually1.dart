import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/primary_btn.dart';
import 'package:flutter_application_1/components/primary_outlinebtn.dart';
import 'package:flutter_application_1/components/text_field.dart';
import 'package:flutter_application_1/constants.dart/colors.dart';
import 'package:flutter_application_1/constants.dart/images.dart';
import 'package:flutter_application_1/home/shop_screen.dart';

class LocationManually1 extends StatefulWidget {
  const LocationManually1({super.key});

  @override
  State<LocationManually1> createState() => _LocationManually1State();
}

class _LocationManually1State extends State<LocationManually1> {
  final List<String> text = [
    "House/Flat number",
    "Floor number",
    "Apartment/Building name",
    "How to reach",
    "contact number",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: AppColor.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
            size: 18,
            color: AppColor.erroclr,
          ),
          onPressed: () {},
        ),
        title: Text(
          "Add Address Details",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      backgroundColor: AppColor.white,
      body: Container(
        margin: EdgeInsets.only(top: 40),
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(color: AppColor.white),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(AppImg.mapframe),
              SizedBox(height: 24),
              Text(
                "HSP Layout",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Text(
                "Bengaluru, Karnatka, India",
                style: TextStyle(color: AppColor.greyblr),
              ),
              SizedBox(height: 24),
              ListView.builder(
                itemCount: text.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(vertical: 5),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          text[index],
                          style: TextStyle(color: AppColor.greyblr),
                        ),
                        Textfield(),
                      ],
                    ),
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Address type",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                    SizedBox(height: 20),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
          
                      children: [
                        _btn("Home", true, true, false),
                        SizedBox(width: 10),
                        _btn("Office", false, false, true),
                        SizedBox(width: 10),
                        _btn("Other", false, false, true),
                      ],
                    ),
                    SizedBox(height: 15),
          
                    PrimaryBtn(
                      text: "Add Address & explore shop",
                      isLoading: false,
                      isWhiteText: true,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ShopScreen()),
                        );
                      },
                      bgclr: AppColor.backgColor,
                    ),
                    SizedBox(height: 20),
                    PrimaryOutlinebtn(
                      text: "Cancel",
                      onPressed: () {
                        Navigator.pop(context);
                      },
          
                      filledTextColor: AppColor.backgColor,
                      isFilled: true,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _btn(String text, bool bclr, bool isTextWhite, bool grey) {
  return Row(
    children: [
      TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          side: BorderSide(
            color: grey ? AppColor.greyblr : AppColor.backgColor,
          ),
          backgroundColor: bclr ? AppColor.backgColor : AppColor.white,
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isTextWhite ? AppColor.white : AppColor.greyblr,
          ),
        ),
      ),
    ],
  );
}
