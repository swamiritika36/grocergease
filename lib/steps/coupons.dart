import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/primary_btn.dart';
import 'package:flutter_application_1/constants.dart/colors.dart';
import 'package:flutter_application_1/constants.dart/images.dart';
import 'package:flutter_application_1/steps/track_order.dart';

class Coupons extends StatefulWidget {
  const Coupons({super.key});

  @override
  State<Coupons> createState() => _CouponsState();
}

class _CouponsState extends State<Coupons> {
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
          "Coupons",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColor.black,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColor.white,
      ),

      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Type Coupon Code",
                          hintStyle: TextStyle(color: AppColor.greyblr),
                          filled: true,
                          fillColor: AppColor.srchbdr,

                          contentPadding: EdgeInsets.symmetric(horizontal: 16),

                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                            ),
                            borderSide: BorderSide(color: AppColor.srchbdr),
                          ),

                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                            ),
                            borderSide: BorderSide(
                              color: AppColor.srchbdr,
                              width: 0.5,
                            ),
                          ),
                        ),
                      ),
                    ),

                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 26),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.horizontal(
                          right: Radius.circular(12),
                        ),
                      ),
                      child: Center(
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => OrderPlaced(),
                              ),
                            );
                          },
                          child: Text(
                            "Apply",
                            style: TextStyle(color: AppColor.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Text(
                    "Available Coupon",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),

                CouponTile(
                  logo: AppImg.triangle,
                  code: "AXIOSBNK 40",
                  discount: "40% OFF up to 265",
                ),
                CouponTile(
                  logo: AppImg.hDFCBNK,
                  code: "HDFCBNK30",
                  discount: "30% OFF up to 265",
                ),
                CouponTile(
                  logo: AppImg.hDFCBNK,
                  code: "HDFCBNK30",
                  discount: "30% OFF up to 265",
                ),
                CouponTile(
                  logo: AppImg.hDFCBNK,
                  code: "HDFCBNK30",
                  discount: "30% OFF up to 265",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CouponTile extends StatelessWidget {
  final dynamic logo;
  final String code;
  final String discount;

  const CouponTile({
    super.key,
    required this.logo,
    required this.code,
    required this.discount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColor.srchbdr)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              border: Border.all(color: AppColor.srchbdr),

              borderRadius: BorderRadius.circular(2),
            ),
            child: Image.asset(logo),
          ),
          SizedBox(width: 16),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColor.srchbdr),
                    borderRadius: BorderRadius.circular(2),
                  ),
                  child: Text(
                    code,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColor.greyblr,
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  discount,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 6),
                Row(
                  children: [
                    Text(
                      "View details",
                      style: TextStyle(color: AppColor.greyblr, fontSize: 13),
                    ),
                    Icon(
                      Icons.keyboard_arrow_down,
                      size: 25,
                      color: AppColor.greyblr,
                    ),
                  ],
                ),
              ],
            ),
          ),

          Padding(
            padding: EdgeInsets.only(top: 20),
            child: TextButton(
              onPressed: () {},
              child: Text(
                "Apply",
                style: TextStyle(
                  color: AppColor.backgColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class OrderPlaced extends StatelessWidget {
  const OrderPlaced({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: 50),
                child: Center(child: Image.asset(AppImg.partyingface)),
              ),

              SizedBox(height: 50),
              Text(
                "Order placed",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                "Order ID: 15846358",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),

              Divider(height: 32),
              Text(
                "Delivery Address",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 6),
              Text("House 10, Road 3 Bengaluru, Karnataka"),

              Divider(height: 32),
              Text(
                "Order summary",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),

              orderItem("Tomato"),
              orderItem("Stawberrry"),
              orderItem("Pepper"),

              SizedBox(height: 30),
              PrimaryBtn(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TrackOrder()),
                  );
                },
                text: "Trace order",
                isLoading: false,
                bgclr: AppColor.backgColor,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget orderItem(String name) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text(name), Text("1 Kilogram")],
      ),
    );
  }
}
