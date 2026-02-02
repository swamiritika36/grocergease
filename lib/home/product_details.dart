import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/primary_btn.dart';
import 'package:flutter_application_1/constants.dart/colors.dart';

import 'package:flutter_application_1/home/cart.dart';

class ProductDetails extends StatefulWidget {
  final Map<String, String> vegItem;

  const ProductDetails({super.key, required this.vegItem,});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_outlined, size: 18),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite_border_rounded,color: AppColor.greyblr,),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 10),
              Text(
                widget.vegItem['text']!,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(widget.vegItem['subtext']!,style: TextStyle(color: AppColor.greyblr),),
              SizedBox(height: 8),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.star, color: Colors.amber),
                  Icon(Icons.star, color: Colors.amber),
                  Icon(Icons.star, color: Colors.amber),
                  Icon(Icons.star, color: Colors.amber),
                  Icon(Icons.star, color: Colors.grey),
                  Text(".(4.8)"),
                ],
              ),

              SizedBox(height: 10),

              Image.asset(
                widget.vegItem['path']!,
                width: 270,
                height: 201,
                fit: BoxFit.contain,
              ),

              SizedBox(height: 15),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton(
                    heroTag: null,
                    mini: true,
                    backgroundColor: Colors.white,
                    onPressed: () {
                      if (quantity > 1) {
                        setState(() {
                          quantity--;
                        });
                      }
                    },
                    child: const Icon(Icons.remove, color: Colors.green),
                  ),
                  const SizedBox(width: 15),
                  Text(
                    quantity.toString(),
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 15),
                  FloatingActionButton(
                    heroTag: null,
                    mini: true,
                    backgroundColor: Colors.green,
                    onPressed: () {
                      setState(() {
                        quantity++;
                      });
                    },
                    child: const Icon(Icons.add, color: Colors.white),
                  ),
                ],
              ),

              SizedBox(height: 20),

              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Description",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),

              Text.rich(
                TextSpan(
                  text:
                      "The orange is the fruit of various citrus species in the family Rutaceae ); it primarily refers to Citrus × sinensis, which is also called sweet orange, ... ",
                  style: TextStyle(color: Colors.black),
                  children: [
                    TextSpan(
                      text: "Read more",
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                      recognizer: TapGestureRecognizer()..onTap = () {},
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      Text("Total Price",style: TextStyle(color: AppColor.greyblr),),
                        Text(
                          widget.vegItem['kg']!,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),

                  Expanded(
                    child: PrimaryBtn(
                      onPressed: () {},
                      text: "Buy Now",
                      isLoading: false,
                      bgclr: AppColor.backgColor,
                    ),
                  ),

                  SizedBox(width: 8),

                  Expanded(
                    child: PrimaryBtn(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Cart()),
                        );
                      },
                      text: "🛒 Add to Cart",
                      bgclr: AppColor.backgColor,
                      isLoading: false,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
