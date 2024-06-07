import 'package:flutter/material.dart';

class MyGoogleButton extends StatelessWidget {

  final Function()? onTap;
  const MyGoogleButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(15.0),
        margin: const EdgeInsets.symmetric(horizontal: 24.0),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(8)),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Image.asset(
              //   'lib/images/google.png',
              //   height: 30,
              // ),
              const SizedBox(width: 10.0),
              Text(
                'Google',
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}