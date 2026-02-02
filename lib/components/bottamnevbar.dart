import 'package:flutter/material.dart';
import 'package:flutter_application_1/home/cart.dart';
import 'package:flutter_application_1/constants.dart/colors.dart';
import 'package:flutter_application_1/constants.dart/images.dart';
import 'package:flutter_application_1/home/explore.dart';
import 'package:flutter_application_1/home/home_page.dart';
import 'package:flutter_application_1/home/orders.dart';
import 'package:flutter_application_1/profile/profile_screen.dart';

class Bottamnevbar extends StatefulWidget {
  const Bottamnevbar({super.key});

  @override
  State<Bottamnevbar> createState() => _BottamnevbarState();
}

class _BottamnevbarState extends State<Bottamnevbar> {
  int selectedIndex = 0;

  final List<Widget> _screens = [
    HomePage(),
    Cart(),
    Explore(),
    Orders(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[selectedIndex],

      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.4),
              blurRadius: 10,
              offset: Offset(0, -2),
            ),
          ],
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: true,
          selectedItemColor: AppColor.backgColor,
          unselectedItemColor: Colors.grey,
          currentIndex: selectedIndex,
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              backgroundColor: Colors.white,
              icon: selectedIndex == 0
                  ? Image.asset(AppImg.greenhome)
                  : Image.asset(AppImg.nonehome),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: selectedIndex == 1
                  ? Image.asset(AppImg.greencart)
                  : Image.asset(AppImg.cart),
              label: "Cart",
            ),
            BottomNavigationBarItem(
              icon: selectedIndex == 2
                  ? Image.asset(AppImg.greenexplore)
                  : Image.asset(AppImg.explore),

              label: "Explore",
            ),
            BottomNavigationBarItem(
              icon: selectedIndex == 3
                  ? Image.asset(AppImg.greenorder)
                  : Image.asset(AppImg.order),

              label: "Orders",
            ),
            BottomNavigationBarItem(
              icon: selectedIndex == 4
                  ? Icon(Icons.person,color: AppColor.backgColor,)
                  :Icon(Icons.person,) ,

              label: "Profile",
            ),
          ],
        ),
      ),
    );
  }
}
