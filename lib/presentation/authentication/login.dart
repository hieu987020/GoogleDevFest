import 'package:covid_report/presentation/presentations.dart';
import 'package:covid_report/values/app_assets.dart';
import 'package:covid_report/values/app_colors.dart';
import 'package:covid_report/values/app_styles.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Padding(
        padding: const EdgeInsets.all(50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Container(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                child: Image.asset(
                  AppAssets.imageSyringe,
                  color: Colors.white,
                  fit: BoxFit.cover,
                ),
                width: 80,
                height: 80,
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
              'MỪNG BẠN QUAY LẠI ',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 15),
            const Text(
              'Mời bạn đăng nhập ',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                decoration: new InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.greenAccent, width: 2.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: AppColors.boderFocus, width: 2.0),
                  ),
                  hintText: 'Username',
                ),
                style: TextStyle(color: Colors.white),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                decoration: new InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.greenAccent, width: 2.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: AppColors.boderFocus, width: 2.0),
                  ),
                  hintText: 'Password',
                ),
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 255,
                  height: 61,
                  decoration: BoxDecoration(
                    color: AppColors.loginColor.withOpacity(1.0),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => DoctorPage()),
                        (Route<dynamic> route) => false,
                      );
                    },
                    child: Container(
                      child: const Text(
                        'Người tiêm',
                        style: TextStyle(
                          color: Colors.white,
                          // fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 255,
                  height: 61,
                  decoration: BoxDecoration(
                    color: AppColors.loginColor.withOpacity(1.0),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => DoctorPage()),
                        (Route<dynamic> route) => false,
                      );
                    },
                    child: Container(
                      child: const Text(
                        'Bác sỹ',
                        style: TextStyle(
                          color: Colors.white,
                          // fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
