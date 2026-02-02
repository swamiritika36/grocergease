import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/textfleld_srch.dart';
import 'package:flutter_application_1/constants.dart/colors.dart';
import 'package:flutter_application_1/constants.dart/images.dart';

class Explore extends StatefulWidget {
  const Explore({super.key});

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
            size: 18,
            color: AppColor.erroclr,
          ),
          onPressed: () { Navigator.pop(context);},
        ),
        title: const Text("Search"),
        centerTitle: true,
      ),
      body: SizedBox(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(mainAxisSize: MainAxisSize.min,
            children: [
              TextfleldSrch(text: "Search", controller: null, onChanged: null),
              SizedBox(height: 20),
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
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Recent searches",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Text(
                    "Clear all",
                    style: TextStyle(fontSize: 14, color: AppColor.backgColor),
                  ),
                ],
              ),
              ListTile(contentPadding: EdgeInsets.zero,dense: true,
                leading: Image.asset(AppImg.bold),visualDensity: VisualDensity.compact,
                title: Text("Vegetable",style: TextStyle(fontSize: 14),),
                trailing: Icon(Icons.clear),
              ),
              ListTile(contentPadding: EdgeInsets.zero,dense: true,
                leading: Image.asset(AppImg.bold),visualDensity: VisualDensity.compact,
                title: Text("Grocery store",style: TextStyle(fontSize: 14),),
                trailing: Icon(Icons.clear),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
