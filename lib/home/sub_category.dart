import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/frame.dart';
import 'package:flutter_application_1/components/textfleld_srch.dart';
import 'package:flutter_application_1/components/vegbag.dart';
import 'package:flutter_application_1/constants.dart/colors.dart';
import 'package:flutter_application_1/constants.dart/images.dart';

class SubCategory extends StatefulWidget {
  const SubCategory({super.key});

  @override
  State<SubCategory> createState() => _SubCategoryState();
}

class _SubCategoryState extends State<SubCategory> {
  bool isSelecte = false;
  final List<String> btntext = [
    "Popular",
    "Free delivery",
    "Discount",
    "Popular",
  ];
  int isSelected = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
            size: 18,
            color: AppColor.erroclr,
          ),
          onPressed: () {},
        ),
        title: Text(
          "Vegetables",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: Padding(
            padding: const EdgeInsets.only(left: 14, right: 14),
            child: Row(
              children: [
                Expanded(
                  child: TextfleldSrch(
                    text: "Search",
                    controller: null,
                    onChanged: null,
                  ),
                ),
                 SizedBox(width: 8),
                Icon(Icons.tune_sharp, color: AppColor.greyblr),
              ],
            ),
          ),
        ),
        backgroundColor: AppColor.white,
      ),
      body: ListView(
        padding:  EdgeInsets.symmetric(horizontal: 10),
        children: [
          SizedBox(height: 20),
        Frame(),
          SizedBox(height: 16),
          Row(
            children: [
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  padding:  EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  minimumSize: Size(0, 32),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  backgroundColor: isSelecte
                      ? AppColor.backgColor
                      : AppColor.white,
                  foregroundColor: isSelecte
                      ? AppColor.white
                      : AppColor.greyblr,
                  side: BorderSide(color: AppColor.srchbdr),
                ),
                onPressed: () {
                  setState(() {
                    isSelecte = !isSelecte;
                  });
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Sort BY"),
                    Icon(
                      Icons.keyboard_arrow_down,
                      color: isSelecte ? AppColor.white : AppColor.greyblr,
                      size: 30,
                    ),
                  ],
                ),
              ),

              Expanded(
                child: SizedBox(
                  height: 40,
                  child: ListView.builder(
                    itemCount: 4,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: isSelected == index
                                ? AppColor.backgColor
                                : AppColor.white,
                            foregroundColor: isSelected == index
                                ? AppColor.white
                                : AppColor.greyblr,
                            side: BorderSide(color: AppColor.srchbdr),
                          ),
                          onPressed: () {
                            setState(() {
                              isSelected = index;
                            });
                          },
                          child: Text(
                            btntext[index],
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Vegbag(
            vegbag: [
              {
                'path': AppImg.pepper,
                'text': 'Pepper',
                'subtext': 'Vegetable',
                'kg': '15 Rs./1Kg',
              },
              {
                'path': AppImg.cauliflower,
                'text': 'Cauliflower',
                'subtext': 'Vegetable',
                'kg': '15 Rs./1Kg',
              },
            ],
          ),
          SizedBox(height: 16),
          Vegbag(
            vegbag: [
              {
                'path': AppImg.redpepper,
                'text': 'Red Peppers ',
                'subtext': 'Vegetable',
                'kg': '15 Rs./1Kg',
              },
              {
                'path': AppImg.tomatoes,
                'text': 'Tomatoes',
                'subtext': 'Vegetable',
                'kg': '15 Rs./1Kg',
              },
            ],
          ),
        ],
      ),
    );
  }
}
