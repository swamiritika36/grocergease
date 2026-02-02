import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants.dart/colors.dart';
import 'package:flutter_application_1/profile/profile_screen.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var appBar = AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
            size: 18,
            color: AppColor.erroclr,
          ),
          onPressed: () { Navigator.pop(context);},
        ),
        title: Text("Notification"),
        centerTitle: true,
        actionsPadding: EdgeInsets.only(right: 20),
        actions: [Icon(Icons.tune, color: AppColor.greyblr)],
        backgroundColor: AppColor.white,
      );
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar,
      body: Column(
        children: [
          SizedBox(height: 16),

          topTabs(
            selectedIndex: selectedIndex,
            onChanged: (i) {
              setState(() => selectedIndex = i);
            },
          ),

          SizedBox(height: 24),
          Expanded(
            child: ListView(
              children: [
                section(
                  title: "Today",
                  items: [
                    notificationItem(time: "5min ago"),
                    notificationItem(time: "10min ago"),
                  ],
                ),
                section(
                  title: "This week",
                  items: [
                    notificationItem(time: "1d ago"),
                    notificationItem(time: "6d ago"),
                  ],
                ),
                 section(
                  title: "Last Month",
                  items: [
                    notificationItem(time: "3w ago"),
                    notificationItem(time: "4w ago"),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget section({required String title, required List<Widget> items}) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.grey.shade600,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),
          ...items.map((e) => Column(children: [e, const Divider(height: 24)])),
        ],
      ),
    );
  }

  Widget notificationItem({required String time}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 44,
          height: 44,
          decoration: const BoxDecoration(
            color: Color(0xffCEE0D6),
            shape: BoxShape.circle,
          ),
          child: Icon(Icons.notifications, color: AppColor.backgColor),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            "Lorem ipsum dolor sit amet dolor fi consectetur.",
            style: TextStyle(color: AppColor.greyblr, fontSize: 15),
          ),
        ),
        const SizedBox(width: 8),
        Text(time, style: TextStyle(color: Colors.grey.shade500, fontSize: 12)),
      ],
    );
  }
}
