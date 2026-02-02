import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/primary_btn.dart';
import 'package:flutter_application_1/constants.dart/colors.dart';
import 'package:flutter_application_1/steps/payment.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  bool isStandard = true;

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
        title: Text("Checkout"),
        centerTitle: true,
        backgroundColor: AppColor.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children:[
            Text(
              "Your Details",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
        
            ListTile(
              leading: Icon(Icons.location_on_outlined),
              title: Text("HSR Layout"),
              subtitle: Text("Bengaluru, Karnatka, India"),
              trailing: Text("Edit", style: TextStyle(color: Colors.green)),
            ),
        
            _divider(),
            ListTile(
              leading: Icon(Icons.call_outlined),
              title: Text("24457580087"),
              subtitle: Text("Bengaluru, Karnatka, India"),
              trailing: Text("Edit", style: TextStyle(color: Colors.green)),
            ),
            _divider(),
            ListTile(
              leading: Icon(Icons.email_outlined),
              title: Text("cheguevaran@gmail.com"),
              subtitle: Text("Bengaluru, Karnatka, India"),
              trailing: Text("Edit", style: TextStyle(color: Colors.green)),
            ),
            _divider(),
        
            Text(
              "Delivery Time",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: _scheduleRow(
                    icon: (Icons.schedule),
                    title: "Standard",
                    subtitle: ("20-25 mins"),
                  ),
                ),
        
                Expanded(
                  child: _scheduleRow(
                    icon: (Icons.calendar_today),
                    title: "Schedule",
                    subtitle: ("Select Time"),
                  ),
                ),
              ],
            ),
        
            _divider(),
        
            ListTile(
              leading: Icon(Icons.inventory_2_outlined),
              title: Text(
                'Delivery Instruction',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              subtitle: Text(
                'Leave at the Door',
                style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
              ),
              trailing: Icon(Icons.chevron_right),
            ),
            _divider(),
            ListTile(
              leading: Icon(Icons.card_giftcard_outlined),
              title: Text(
                'Gift someone else',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              subtitle: Text(
                'Add person info & message',
                style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
              ),
              trailing: Icon(Icons.chevron_right),
            ),
            SizedBox(height: 20),
            PrimaryBtn(
              text: "Make Payment",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Payment()),
                );
              },
              isLoading: false,
              bgclr: AppColor.backgColor,
            ),
          ],
        ),
      ),
    );
  }
}

Widget _divider() {
  return Divider(color: Colors.grey.shade300);
}

Widget _scheduleRow({
  required IconData icon,
  required String title,
  required String subtitle,
}) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 6),
    padding: EdgeInsets.all(8),
    decoration: BoxDecoration(
      color: AppColor.white,

      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: AppColor.black, width: 1),
    ),
    child: Row(
      children: [
        Icon(icon),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
            Text(subtitle),
          ],
        ),
      ],
    ),
  );
}
