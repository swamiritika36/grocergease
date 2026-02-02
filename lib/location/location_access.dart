import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/primary_btn.dart';
import 'package:flutter_application_1/components/primary_outlinebtn.dart';
import 'package:flutter_application_1/constants.dart/colors.dart';
import 'package:flutter_application_1/constants.dart/images.dart';
import 'package:flutter_application_1/location/location_access_1.dart';

import 'package:flutter_application_1/location/location_manually1.dart';



class LocationAccess extends StatefulWidget {
  const LocationAccess({super.key});

  @override
  State<LocationAccess> createState() => _LocationAccessState();
}

class _LocationAccessState extends State<LocationAccess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: Container(
        margin: EdgeInsets.only(top: 30),
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(AppImg.map),
            SizedBox(height: 30),
            Column(
              children: [
                Text(
                  "What's your location",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColor.black,
                    decoration: TextDecoration.none,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "We need to acsess your location to help in\nlocating service providers near you.",
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColor.bodyclrbtn,
                    decoration: TextDecoration.none,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            SizedBox(height: 20),
            PrimaryBtn(
              text: "Allow location access",
              isLoading: false,
              onPressed: () {Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LocationAccess1()),
                  );},
              bgclr: AppColor.backgColor,
            ),
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    blurRadius: 6,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: PrimaryOutlinebtn(
                text: "Enter location manually",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LocationManually1()),
                  );
                },
            
                filledTextColor: AppColor.backgColor,
                isFilled: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
