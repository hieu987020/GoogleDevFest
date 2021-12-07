import 'package:covid_report/presentation/presentations.dart';
import 'package:covid_report/values/app_assets.dart';
import 'package:covid_report/values/app_colors.dart';
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
        padding: const EdgeInsets.only(left: 25, right: 25),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 70),
              Container(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
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
                    gradient: const LinearGradient(
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
                'Xin chào bạn,',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                'Đăng nhập',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              const SizedBox(height: 30),
              const TextField(
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.greenAccent,
                      width: 2.0,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: AppColors.boderFocus, width: 2.0),
                  ),
                  hintText: 'Username',
                  hintStyle: TextStyle(
                    fontSize: 16.0,
                    color: Colors.white,
                  ),
                ),
                style: TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 20),
              const TextField(
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.greenAccent, width: 2.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: AppColors.boderFocus, width: 2.0),
                  ),
                  hintText: 'Password',
                  hintStyle: TextStyle(fontSize: 16.0, color: Colors.white),
                ),
                style: TextStyle(color: Colors.white),
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
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextButton(
                      onPressed: () {
                        // Navigator.pushAndRemoveUntil(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) => const PatientHome()),
                        //   (Route<dynamic> route) => false,
                        // );
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PatientHome()),
                        );
                      },
                      child: Container(
                        child: const Text(
                          'Người tiêm chủng',
                          style: TextStyle(
                            color: Colors.white,
                            // fontWeight: FontWeight.bold,
                            fontSize: 22,
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
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const DoctorPage()),
                        );
                        // Navigator.pushAndRemoveUntil(
                        //   context,
                        //   MaterialPageRoute(builder: (context) => DoctorPage()),
                        //   (Route<dynamic> route) => false,
                        // );
                      },
                      child: Container(
                        child: const Text(
                          'Nhân viên y tế',
                          style: TextStyle(
                            color: Colors.white,
                            // fontWeight: FontWeight.bold,
                            fontSize: 22,
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
      ),
    );
  }
}
