import 'package:flutter/material.dart';

class additionalInfo extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  const additionalInfo({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 30,),
        const SizedBox(
          height: 8,
        ),
        Text(label, style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
        const SizedBox(
          height: 8,
        ),
        Text(value, style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),)
      ],
    );
  }
}