import 'dart:ui';

import 'package:covid_report/presentation/authentication/login.dart';
import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          // ignore: sized_box_for_whitespace
          child: Container(
            width: 100,
            height: 100,
            child: Image.asset('assets/images/google.png'),
          ),
          onTap: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const StartedPage()),
              (Route<dynamic> route) => false,
            );
          },
        ),
      ),
    );
  }
}

class StartedPage extends StatelessWidget {
  const StartedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 180),
            // ignore: sized_box_for_whitespace
            Container(
              width: 100,
              height: 100,
              child: Image.asset('assets/images/google.png'),
            ),
            const SizedBox(height: 30),
            const Text(
              'New Experience',
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'AAAAAAAAAAAAAAAAAAA',
              style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w300,
                  fontSize: 22),
            ),
            const Text(
              'BBBBBBBBBBBBBB',
              style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w300,
                  fontSize: 22),
            ),
            const SizedBox(height: 50),
            Container(
              width: 200,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => Login()),
                    (Route<dynamic> route) => false,
                  );
                },
                child: const Text(
                  'Get Started',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
