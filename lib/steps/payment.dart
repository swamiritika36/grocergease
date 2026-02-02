import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/primary_btn.dart';
import 'package:flutter_application_1/constants.dart/colors.dart';
import 'package:flutter_application_1/constants.dart/images.dart';
import 'package:flutter_application_1/steps/coupons.dart';

class Payment extends StatefulWidget {
  const Payment({super.key});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  final List<String> text = [
    "10 Rs.",
    "20 Rs.",
    "30 Rs.",
    "40 Rs.",
    "Customs",
   
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
          onPressed: () { Navigator.pop(context);},
        ),
        title: const Text("Payment"),
        centerTitle: true,
        backgroundColor: AppColor.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Bill Details",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              _rowItem("MRP Total", "60 Rs."),
              _rowItem("Discount", "15%"),
              _rowItem("Delivery Partner Fee", "0 Rs."),
              _rowItem("Tax", "0 Rs."),
              SizedBox(height: 10),
        
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
              SizedBox(height: 10),
              Row(
                children: [
                  Text(
                    "Read Cancellation Policy",
                    style: TextStyle(color: AppColor.backgColor),
                  ),
                  SizedBox(width: 4),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.keyboard_arrow_down,
                      color: AppColor.backgColor,
                      size: 30,
                    ),
                  ),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                  color: AppColor.white,
        
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColor.backgColor, width: 1),
                ),
                child: ListTile(
                  title: Text(
                    "Apply Coupon",
                    style: TextStyle(color: AppColor.backgColor),
                  ),
                  subtitle: Text(
                    "Save More with Coupons",
                    style: TextStyle(color: AppColor.greyblr),
                  ),
        
                  trailing: Icon(
                    Icons.chevron_right,
                    color: AppColor.backgColor,
                    size: 30,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Select Payment Method",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                "Google Pay",
                style: TextStyle(
                  color: AppColor.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: AppColor.white,
        
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColor.backgColor, width: 1),
                ),
                child: ListTile(
                  leading: Image.asset(AppImg.pay),
                  title: Text(
                    "Google Pay",
                    style: TextStyle(
                      color: AppColor.greyblr,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    "24457580087",
                    style: TextStyle(color: AppColor.greyblr),
                  ),
        
                  trailing: Image.asset(AppImg.greendot),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Credit and Debit Cards"),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.keyboard_arrow_down,
                      color: AppColor.backgColor,
                      size: 30,
                    ),
                  ),
                ],
              ),
              Text(
                "+ Add New Card",
                style: TextStyle(color: AppColor.backgColor),
              ),
              _rowBlack("Net Banking"),
              _rowBlack("UPI"),
              _rowBlack("Wallet"),
              _rowBlack("Cash on Delivery"),
              _rowBlack("Pay Later"),
              _rowBlack("Add Tip"),
        SizedBox(
              height:40,
              child: ListView.builder(
                itemCount: text.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 6,vertical: 8),
                    child:Container(padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: AppColor.white,
                  borderRadius: BorderRadius.circular(2),
                  border: Border.all(color: AppColor.greyblr,),
                ),child: 
                     Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                    
                   Text(text[index], style: TextStyle(fontSize: 14,color: AppColor.greyblr)),
                      ],
                    ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 10,),
            PrimaryBtn(
              text: " Pay",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Coupons()),
                );
              },
              isLoading: false,
              bgclr: AppColor.backgColor,
            ),
            SizedBox(height: 10,),
            ],
          ),
        ),
      ),
    );
  }

  Widget _rowItem(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(color: AppColor.greyblr)),
          Text(value, style: TextStyle(color: AppColor.greyblr)),
        ],
      ),
    );
  }

  Widget _rowBlack(String label) {
    return Padding(
      padding: const EdgeInsets.only(right: 9,top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: AppColor.black,fontWeight: FontWeight.bold)),
          Icon(Icons.keyboard_arrow_down, color: AppColor.backgColor, size: 30),
        ],
      ),
    );
  }
}
