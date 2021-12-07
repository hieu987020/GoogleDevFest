import 'dart:ui';
import 'package:covid_report/presentation/authentication/login.dart';
import 'package:covid_report/values/app_assets.dart';
import 'package:covid_report/values/app_colors.dart';
import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: GestureDetector(
          // ignore: sized_box_for_whitespace
          child: Column(
            children: [
              const SizedBox(height: 200),
              Container(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                child: Image.asset(
                  AppAssets.imageSyringe,
                  color: Colors.white,
                  width: 10,
                  height: 10,
                ),
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(26),
                    // color: AppColors.mainColor,
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        AppColors.mainColor1,
                        AppColors.mainColor2,
                      ],
                    )),
              ),
              const SizedBox(height: 30),
              const Text(
                "IM-COVID",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                ),
              ),
            ],
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
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 180),
            // ignore: sized_box_for_whitespace
            Container(
              child: Container(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: Image.asset(
                  AppAssets.imageSyringe,
                  color: Colors.white,
                  fit: BoxFit.cover,
                ),
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(26),
                    // color: AppColors.mainColor,
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        AppColors.mainColor1,
                        AppColors.mainColor2,
                      ],
                    )),
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              'CHÀO BẠN !',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Chúng tôi luôn đồng hành',
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w300,
                fontSize: 18,
              ),
            ),
            const Text(
              'bảo vệ sức khoẻ cộng đồng',
              style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w300,
                  fontSize: 18),
            ),
            const SizedBox(height: 50),
            Container(
              width: 255,
              height: 61,
              decoration: BoxDecoration(
                  // color: Colors.green,
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      AppColors.getstartColor1,
                      AppColors.getstartColor2,
                    ],
                  )),
              child: TextButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => Login()),
                    (Route<dynamic> route) => false,
                  );
                },
                child: Container(
                  child: const Text(
                    'Bắt đầu',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
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
