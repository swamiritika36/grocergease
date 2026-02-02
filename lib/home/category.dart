import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/textfleld_srch.dart';
import 'package:flutter_application_1/constants.dart/colors.dart';
import 'package:flutter_application_1/constants.dart/images.dart';
import 'package:flutter_application_1/home/sub_category.dart';

class Category extends StatefulWidget {
  const Category({super.key});

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  bool isLoading = false;
  int selectedIndex = -1;

  final List<String> text = [
    "Vegetables",
    "Fruits",
    "Beverages",
    "Rice",
    "Juices",
    "Meat",
    "Milk",
    "Pluses and\nFlour",
    "Cleaning essential",
    "hygiene",
    "Oil and\nMasala",
    "Bakery",
    "Hot\nBeverages",
    "Instant food",
    "Bakery",
    "Hot\nBeverages",
    "Instant food",
    "Bakery",
  ];
  final List<String> imagePaths = [
    AppImg.ellipse1,
    AppImg.fruits,
    AppImg.ellipse2,
    AppImg.rice,
    AppImg.juice,
    AppImg.meat,
    AppImg.milks,
    AppImg.flour,
    AppImg.cleaning,
    AppImg.hygiene,
    AppImg.oil,
    AppImg.bakery,
    AppImg.hotbeverages,
    AppImg.instantfood,
    AppImg.bakery,
    AppImg.hotbeverages,
    AppImg.instantfood,
    AppImg.bakery,
  ];

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
          "Shop By Categories",
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
                const SizedBox(width: 8),
                const Icon(Icons.tune_sharp, color: AppColor.greyblr),
              ],
            ),
          ),
        ),
        backgroundColor: AppColor.white,
      ),
      body: GridView.builder(padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 1,
        ),
        itemCount: text.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: ( ) {
              Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SubCategory(),
                            ),
              );
              setState(() {
                selectedIndex = index;
              });
            },
            child: Container(
              decoration: BoxDecoration(
                color: AppColor.white,
                boxShadow: List.empty(growable: true),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: selectedIndex == index
                      ? AppColor.backgColor
                      : AppColor.srchbdr,
                  width: 1,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    imagePaths[index],
                    height: 48,
                    width: 48,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(height: 8),

                  Text(
                    text[index],
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
