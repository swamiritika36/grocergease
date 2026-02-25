import 'package:flutter/material.dart';
import 'package:flutter_application_1/steps/checkout_screen.dart';
import 'package:flutter_application_1/components/primary_btn.dart';
import 'package:flutter_application_1/constants.dart/colors.dart';
import 'package:flutter_application_1/constants.dart/images.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        backgroundColor: AppColor.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
            
            size: 18,
            color: AppColor.erroclr,
          ),
          onPressed: () { Navigator.pop(context);},
        ),
        title: const Text("Cart", style: TextStyle(color: Colors.black)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(6),
              children: [
                product(image: AppImg.orange, title: "Orange"),
                product(image: AppImg.strawberry, title: "Strawberry"),
                product(image: AppImg.pepper, title: "Pepper"),
              ],
            ),
          ),
          Divider(height: 1,),
          total(() {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CheckoutScreen()),
            );
          }),
        ],
      ),
    );
  }
}

Widget product({required String image, required String title}) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 6, horizontal: 8),
    padding: EdgeInsets.all(12),
    height: 110,
    decoration: BoxDecoration(
      color: AppColor.white,
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: AppColor.backgColor, width: 1),
    ),
    child: Row(
      children: [
        Image.asset(image, width: 82, height: 72, fit: BoxFit.cover),
        SizedBox(width: 12),

        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
               SizedBox(height: 4),
              Text(
                "\$12 /kg",
                style: TextStyle(
                  color: AppColor.grey,
                  fontSize: 10,
                  decoration: TextDecoration.lineThrough,
                ),
              ),
              SizedBox(height: 4),
              Text(
                "15.55 Rs./kg",
                style: TextStyle(
                  color: AppColor.backgColor,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),

        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            _btn(Icons.clear, AppColor.white, AppColor.black, true, false),
            const Spacer(),
            Row(
              children: [
                _btn(
                  Icons.remove,
                  AppColor.white,
                  AppColor.backgColor,
                  true,
                  true,
                ),
                SizedBox(width: 8),
                Text("2", style: TextStyle(fontSize: 18)),
                SizedBox(width: 8),
                _btn(
                  Icons.add,
                  AppColor.backgColor,
                  AppColor.white,
                  false,
                  true,
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  );
}

Widget total(VoidCallback onPressed) {
  return Container(
    padding: const EdgeInsets.all(16),
    decoration: const BoxDecoration(
      color: AppColor.white,
      
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _rowItem("Subtotal", "60 Rs."),
        _rowItem("Discount", "15%"),
        _rowItem("Tax", "0 Rs."),
        SizedBox(height: 12),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Total",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Text(
              "45 Rs.",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ],
        ),

        SizedBox(height: 16),

        PrimaryBtn(
          onPressed: onPressed,

          text: "Checkout",
          isLoading: false,
          bgclr: AppColor.backgColor,
        ),
      ],
    ),
  );
}

Widget _rowItem(String label, String value) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 4),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: TextStyle(color: AppColor.grey)),
        Text(value, style: TextStyle(color: AppColor.grey)),
      ],
    ),
  );
}

Widget _btn(IconData icon, Color bg, Color iconColor, bool border, bool color) {
  return InkWell(
    onTap: () {},
    child: Container(
      height: 32,
      width: 32,
      decoration: BoxDecoration(
        color: bg,
        shape: BoxShape.circle,
        border: border
            ? Border.all(color: color ? AppColor.backgColor : AppColor.black)
            : null,
      ),
      child: Icon(icon, size: 16, color: iconColor),
    ),
  );
}
