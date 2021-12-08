import 'dart:developer';

import 'package:covid_report/business/business.dart';
import 'package:covid_report/presentation/presentations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PatientHome extends StatelessWidget {
  const PatientHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<ReportCreateBloc, ReportCreateState>(
      listener: (context, state) {
        if (state is ReportCreateLoaded) {
          log("xác nhận tạo report");
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Đăng ký thành công, hãy kiểm tra mã QR của bạn!'),
              duration: Duration(seconds: 1),
            ),
          );
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 70),
              const Text(
                "QUY TRÌNH TIÊM CHỦNG",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                ),
              ),
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      height: 440,
                    ),
                  ),
                  const Positioned(
                    top: 50,
                    left: 55,
                    child: UserGuide(
                        text: "B1: Nhập phiếu xác nhận và nhận QR code",
                        width: 250,
                        height: 100),
                  ),
                  const Positioned(
                    top: 180,
                    left: 55,
                    child: UserGuide(
                        text:
                            "B2: Trình mã QR cho nhân viên y tế quét và nhận thông tin",
                        width: 250,
                        height: 120),
                  ),
                  const Positioned(
                    top: 330,
                    left: 55,
                    child: UserGuide(
                        text:
                            "B3: Khám sàng lọc và chỉ định tiêm (nếu đủ điều kiện)",
                        width: 250,
                        height: 120),
                  ),
                ],
              ),
              const Text(
                "Bạn đang ở bước 1/3",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      IconButton(
                        icon: Image.asset(
                          'assets/images/qr.png',
                          color: Colors.white,
                        ),
                        iconSize: 50,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ShowQRPage(
                                        data: '555500007777',
                                      )));
                        },
                      ),
                      const Text(
                        "Quản lý QR",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      IconButton(
                        icon: Image.asset(
                          'assets/images/confirm.png',
                          color: Colors.white,
                        ),
                        iconSize: 50,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const PatientPage()),
                          );
                        },
                      ),
                      const Text(
                        "Phiếu đăng ký",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class UserGuide extends StatelessWidget {
  const UserGuide({
    Key? key,
    required this.text,
    required this.width,
    required this.height,
  }) : super(key: key);
  final String text;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.white,
            width: 3,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
        ),
      ),
    );
  }
}
