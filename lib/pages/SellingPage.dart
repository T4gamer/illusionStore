import 'package:flutter/material.dart';

class SalesPage extends StatelessWidget {
  const SalesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: Color(0xFF212425),
        body: Column(
          children: [
            paymentButton(buttonText: "text", icon: Icons.check, color: Color(0xff3C3F41),),
          ],
        ));
  }
}

class paymentButton extends StatelessWidget {
  final String buttonText;
  final IconData icon;
  final Color color;
  const paymentButton({super.key, required this.buttonText, required this.icon, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 256,
      height: 256,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(color),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(32),
            ),
          ),
        ),
        onPressed: () {},
        child: Center(
          child: Column(
            children: [
              Icon(icon),
              Text(buttonText,style: const TextStyle(),),
            ],
          ),
        )
      ),
    );
  }
}
