import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants.dart/colors.dart';
import 'package:flutter_application_1/constants.dart/images.dart';

enum OrderStatus { accepted, cooking, picking, delivered }

class TrackOrder extends StatefulWidget {
  const TrackOrder({super.key});

  @override
  State<TrackOrder> createState() => _TrackOrderState();
}

class _TrackOrderState extends State<TrackOrder> {
  OrderStatus currentStatus = OrderStatus.accepted;

  String get statusTitle {
    switch (currentStatus) {
      case OrderStatus.accepted:
        return "Order is preparing";
      case OrderStatus.cooking:
        return "Picking up your Order";
      case OrderStatus.picking:
        return "Heading your way";
      case OrderStatus.delivered:
        return "Delivered";
    }
  }

  List<OrderStep> get steps => [
    OrderStep("Accepted", currentStatus.index >= OrderStatus.accepted.index),
    OrderStep("Cooking", currentStatus.index >= OrderStatus.cooking.index),
    OrderStep("Picking", currentStatus.index >= OrderStatus.picking.index),
    OrderStep("Delivered", currentStatus.index >= OrderStatus.delivered.index),
  ];

  void nextStep() {
    if (currentStatus != OrderStatus.delivered) {
      setState(() {
        currentStatus = OrderStatus.values[currentStatus.index + 1];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Track My Order",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [IconButton(onPressed: nextStep, icon: Icon(Icons.forward))],
      ),

      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppImg.mapsiclemap),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  statusTitle,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 8),

                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: const Text(
                    "Arriving at :",
                    style: TextStyle(fontSize: 12),
                  ),
                  title: const Text(
                    "07 : 45 PM",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                  trailing: const Text("OTP : 7548"),
                ),

                GridView.builder(
                  shrinkWrap: true,
                  itemCount: steps.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    childAspectRatio: 0.9,
                  ),
                  itemBuilder: (context, index) {
                    final isActive = currentStatus.index == index;
                    final step = steps[index];

                    return Column(
                      children: [
                        CircleAvatar(
                          radius: 22,
                          backgroundColor: step.completed
                              ? Colors.green
                              : Colors.grey,
                          child: step.completed
                              ? Icon(Icons.check, color: Colors.white)
                              : isActive
                              ? SizedBox(
                                  height: 18,
                                  width: 18,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    color: Colors.white,
                                  ),
                                )
                              : const SizedBox(),
                        ),
                        SizedBox(height: 8),
                        Text(
                          step.title,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: step.completed ? Colors.green : Colors.grey,
                          ),
                        ),
                      ],
                    );
                  },
                ),

                if (currentStatus != OrderStatus.delivered)
                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.green),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 25,
                              child: Image.asset(AppImg.david),
                            ),
                            SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "David",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 4),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "★★★★★",
                                      style: TextStyle(color: Colors.amber),
                                    ),
                                    Text(
                                      " 4.5 Rating",
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        infoRow("Distance", "10 Km"),
                        infoRow("Estimated Time", "15 minute"),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: "Message...",
                                  filled: true,
                                  suffixIcon: Icon(Icons.send),
                                  fillColor: Colors.grey.shade100,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            CircleAvatar(
                              backgroundColor: Colors.green,
                              child: IconButton(
                                icon: const Icon(
                                  Icons.call,
                                  color: Colors.white,
                                ),
                                onPressed: () {},
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                if (currentStatus == OrderStatus.delivered) ...[
                  SizedBox(height: 8),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green.shade800,
                      minimumSize: Size(double.infinity, 48),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      "Rate & Tip",
                      style: TextStyle(color: AppColor.white),
                    ),
                  ),
                  SizedBox(height: 12),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      minimumSize: Size(double.infinity, 48),
                      side: BorderSide(color: Colors.green.shade800),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      "Close",
                      style: TextStyle(color: AppColor.black),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  static Widget infoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(color: AppColor.black)),
          Text(value, style: TextStyle(color: AppColor.greyblr)),
        ],
      ),
    );
  }
}

class OrderStep {
  final String title;
  final bool completed;
  OrderStep(this.title, this.completed);
}
