import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/auth/loginsignup_screen.dart';


import 'package:flutter_application_1/constants.dart/colors.dart';
import 'package:flutter_application_1/constants.dart/images.dart';
import 'package:flutter_application_1/profile/edit_profile.dart';
import 'package:flutter_application_1/profile/notification_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();

  
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) =>  LoginsignupScreen(index:1,)),
      (route) => false,
     
    );
  }

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
        title: const Text(
          "Profile",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: AppColor.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(AppImg.profile),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Jenny',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 6),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.green.shade100,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Text(
                            'Jenny@gmail.com',
                            style: TextStyle(color: Colors.green),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),

            sectionTitle('Account'),
            settingsCard([
              settingsTile(Icons.person_outline, 'Edit profile', () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EditProfile()),
                );
              }),
              settingsTile(Icons.security, 'Security', () {}),
              settingsTile(Icons.notifications_none, 'Notifications', () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NotificationScreen()),
                );
              }),
              settingsTile(Icons.lock_outline, 'Privacy', () {}),
            ]),

            sectionTitle('Support & About'),
            settingsCard([
              settingsTile(Icons.credit_card, 'My Subscription', () {}),
              settingsTile(Icons.help_outline, 'Help & Support', () {}),
              settingsTile(Icons.info_outline, 'Terms & Policies', () {}),
            ]),

            sectionTitle('Cache & Cellular'),
            settingsCard([
              settingsTile(Icons.delete_outline, 'Free up space', () {}),
              settingsTile(Icons.data_usage, 'Data Saver', () {}),
            ]),

            sectionTitle('Other'),
            settingsCard([
              settingsTile(Icons.flag_outlined, 'Report a problem', () {}),
              settingsTile(Icons.group_add_outlined, 'Add account', () {}),
              settingsTile(Icons.logout, 'Log out', () { logout(context); }
    
  ),
            ]),
          ],
        ),
      ),
    );
  }

  Widget sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Text(
        title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
    );
  }

  Widget settingsCard(List<Widget> children) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(children: children),
    );
  }

  Widget settingsTile(IconData icon, String title, VoidCallback? onTap) {
    return Column(
      children: [
        ListTile(
          leading: Icon(icon),
          title: Text(title),
          trailing: const Icon(Icons.chevron_right),
          onTap: onTap,
        ),
      ],
    );
  }
}

Widget topTabs({required int selectedIndex, required Function(int) onChanged}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: Container(
      height: 48,
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          _tab("Latest", 0, selectedIndex, onChanged),
          _tab("View All", 1, selectedIndex, onChanged),
        ],
      ),
    ),
  );
}

Widget _tab(
  String text,
  int index,
  int selectedIndex,
  Function(int) onChanged,
) {
  return Expanded(
    child: GestureDetector(
      onTap: () => onChanged(index),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: selectedIndex == index
              ? AppColor.backgColor
              : Colors.grey.shade300,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: selectedIndex == index ? Colors.white : Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    ),
  );
}
