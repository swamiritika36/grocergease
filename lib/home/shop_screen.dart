import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/bottamnevbar.dart';
import 'package:flutter_application_1/components/textfleld_srch.dart';
import 'package:flutter_application_1/constants.dart/colors.dart';
import 'package:flutter_application_1/constants.dart/images.dart';


class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  final List<String> imageOne = [AppImg.store1, AppImg.store2, AppImg.store3];
  final List<String> imagePath = [AppImg.store4, AppImg.store5];
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
          "Choose Shop & Mart",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      backgroundColor: AppColor.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextfleldSrch(text: "Search", controller: null, onChanged: null),
              SizedBox(height: 32),
              Text(
                "Nearby Shops & Mart",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Container(
                height: 180,
                margin: EdgeInsets.only(top: 16, bottom: 16),

                child: ListView.builder(
                  itemCount: 3,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,

                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Bottamnevbar()),
                          );
                        },
                        child: _text(imageOne[index]),
                      ),
                    );
                  },
                ),
              ),
              Text(
                "Shops & Mart to explore",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Container(
                height: 180,
                margin: EdgeInsets.only(top: 16, bottom: 16),
                child: ListView.builder(
                  itemCount: 2,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,

                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4),
                      child: _text(imagePath[index]),
                    );
                  },
                ),
              ),

              Container(
                height: 180,
                margin: EdgeInsets.only(top: 16),
                child: ListView.builder(
                  itemCount: 2,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,

                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4),
                      child: _text(imagePath[index]),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _text(String usePrimaryPath) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          child: Image.asset(usePrimaryPath),
        ),

        Text("Grocery store", style: TextStyle(fontWeight: FontWeight.w600)),
        SizedBox(height: 4),
        Row(
          children: [
            Icon(Icons.star, size: 14, color: Colors.yellow),
            SizedBox(width: 4),
            Text("4.8", style: TextStyle(color: Colors.grey)),
            SizedBox(width: 6),
            Text(
              "(270 Reviews)",
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ],
        ),
        SizedBox(height: 4),
        Text(
          "1km | 28mins",
          style: TextStyle(color: AppColor.greyblr, fontSize: 12),
        ),
      ],
    );
  }
}
