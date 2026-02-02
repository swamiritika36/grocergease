import 'package:flutter/material.dart';

class SocilIcon extends StatelessWidget {
  final dynamic path;

  const SocilIcon({super.key, required this.path});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.grey.shade300),
      ),
      child:  Image.asset(
          path,height: 38,width: 38,

        ),

    );
  }
}
