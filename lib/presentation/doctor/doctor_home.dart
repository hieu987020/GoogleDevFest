import 'dart:developer';

import 'package:covid_report/business/business.dart';
import 'package:covid_report/presentation/presentations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoctorHome extends StatelessWidget {
  const DoctorHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<ReportUpdateBloc, ReportUpdateState>(
      listener: (context, state) {
        if (state is ReportUpdateLoaded) {
          log("xác nhận cập nhật report");
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Xác nhận tiêm vắc xin thành công!'),
              duration: Duration(seconds: 1),
            ),
          );
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
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
                          text: "B1: Nhập phiếu đăng ký và nhận QR code",
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
                  "Cùng nhau đẩy lùi dịch bệnh",
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
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: Image.asset(
                            'assets/images/scanner.png',
                            color: Colors.white,
                          ),
                          iconSize: 50,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const QRViewExample()),
                            );
                          },
                        ),
                        const Text(
                          "Quét mã QR",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: Image.asset(
                            'assets/images/confirm.png',
                            color: Colors.white,
                          ),
                          iconSize: 50,
                          onPressed: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) => const QRViewExample()),
                            // );
                          },
                        ),
                        const Text(
                          "Hồ sơ",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
