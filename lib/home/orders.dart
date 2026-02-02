import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/textfleld_srch.dart';
import 'package:flutter_application_1/constants.dart/colors.dart';
import 'package:flutter_application_1/constants.dart/images.dart';

import 'cart.dart';

class Orders extends StatefulWidget {
  const Orders({super.key});

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  final List<String> btntext = ["All", "On delivery", "Completed", "Cancle"];
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
          onPressed: () { Navigator.pop(context);},
        ),
        title: Text(
          "Your Orders",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: AppColor.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: [
            TextfleldSrch(text: "Search", controller: null, onChanged: null),

            SizedBox(height: 24),

            SizedBox(
              height: 40,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: btntext.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
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

            SizedBox(height: 20),

            Text(
              "Order ID #0012345",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("On delivery", style: TextStyle(color: Colors.amber)),
                Text(
                  "Track Location",
                  style: TextStyle(color: AppColor.backgColor),
                ),
              ],
            ),
            SizedBox(height: 10),

            product(image: AppImg.orange, title: "Orange"),
            product(image: AppImg.strawberry, title: "Strawberry"),

            SizedBox(height: 20),

            Text(
              "Order ID #0012345",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Done", style: TextStyle(color: AppColor.backgColor)),
                Text(
                  "View Details",
                  style: TextStyle(color: AppColor.backgColor),
                ),
              ],
            ),
            SizedBox(height: 10),

            product(image: AppImg.orange, title: "Orange"),
            product(image: AppImg.strawberry, title: "Strawberry"),
          ],
        ),
      ),
    );
  }
}
