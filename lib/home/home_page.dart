import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/components/frame.dart';
import 'package:flutter_application_1/home/category.dart';
import 'package:flutter_application_1/components/textfleld_srch.dart';
import 'package:flutter_application_1/components/vegbag.dart';
import 'package:flutter_application_1/constants.dart/colors.dart';
import 'package:flutter_application_1/constants.dart/images.dart';
import 'package:flutter_application_1/home/favorite_screen.dart';
import 'package:flutter_application_1/location/location_access.dart';
import 'package:flutter_application_1/profile/notification_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  final List<String> imagePath = [
    AppImg.ellipse1,
    AppImg.fruits,
    AppImg.ellipse2,
    AppImg.rice,
    AppImg.milks,
    AppImg.juice,
    AppImg.meat,
  ];
  final List<String> text = [
    "Vegetables",
    "Fruits",
    "Beverages",
    "Rice",
    "Milks",
    "Juices",
    "Meat",
  ];
  final List<String> btntext = [
    "All",
    "Fruits",
    "Vegetables",
    "Egg & Meat",
    "Bakery",
  ];
  List<Map<String, String>> favoriteList = [];
  int isSelected = 1;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return false;
      },
      child: Scaffold(
        backgroundColor: AppColor.backgColor,
        appBar: AppBar(
          toolbarHeight: 140,
          automaticallyImplyLeading: false,
          title: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  child: Image.asset(
                    AppImg.store1,
                    height: 42,
                    width: 42,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 5),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "welcome to Grocery store",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColor.white,
                        height: 0.7,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(Icons.location_on_outlined, color: AppColor.white),
                        SizedBox(width: 4),
                        Text(
                          "HSR Layout",
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColor.white,
                               height: 0.7,
                          ),
                        ),
                        IconButton(
                          padding: EdgeInsets.zero,
                          constraints: BoxConstraints(),
                          visualDensity: VisualDensity.compact,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LocationAccess(),
                              ),
                            );
                          },
                          icon: Icon(
                            Icons.keyboard_arrow_down,
                            color: AppColor.white,
                            size: 30,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FavoriteScreen(favoriteList: []),
                      ),
                    );
                  },
                  iconSize: 18,
                  padding: EdgeInsets.zero,
                  constraints:  BoxConstraints( 
                    minWidth: 36,
                    minHeight: 36,
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      AppColor.white.withOpacity(0.4),
                    ),
                  ),
                  icon:  Icon(
                    Icons.favorite_border_rounded,
                    color: AppColor.white,
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => NotificationScreen()),
                  ),
                  iconSize: 18,
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(
                    minWidth: 36,
                    minHeight: 36,
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      AppColor.white.withOpacity(0.4),
                    ),
                  ),
                  icon: const Icon(
                    Icons.notifications_outlined,
                    color: AppColor.white,
                  ),
                ),
              ],
            ),
          ),
          bottom: PreferredSize(
            preferredSize:  Size.fromHeight(10),
            child: Padding(
              padding:  EdgeInsets.only(bottom: 20, left: 14, right: 14),
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
                  Icon(Icons.tune_sharp, color: Colors.white),
                ],
              ),
            ),
          ),
          backgroundColor: AppColor.backgColor,
        ),

        body: Container(
          decoration: BoxDecoration(
            color: AppColor.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: ListView(
            padding:EdgeInsets.symmetric(horizontal: 10),
            children: [
              SizedBox(height: 20),
              Frame(),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Shop By Categories",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Category()),
                      );
                    },
                    child: Text(
                      "View all",
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColor.backgColor,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
              SizedBox(
                height: 80,
                child: ListView.builder(
                  itemCount: text.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(imagePath[index]),
                          Text(text[index], style: TextStyle(fontSize: 12)),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Popular Product",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Text(
                    "View all",
                    style: TextStyle(fontSize: 14, color: AppColor.backgColor),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
                child: ListView.builder(
                  itemCount: 5,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Column(
                        children: [
                          TextButton(
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
                        ],
                      ),
                    );
                  },
                ),
              ),
              Vegbag(
                vegbag: [
                  {
                    'path': AppImg.orange,
                    'text': 'Orange',
                    'subtext': 'Fruit',
                    'kg': '45 Rs./1Kg',
                  },
                  {
                    'path': AppImg.pepper,
                    'text': 'Pepper',
                    'subtext': 'Vegetable',
                    'kg': '15 Rs./1Kg',
                  },
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
