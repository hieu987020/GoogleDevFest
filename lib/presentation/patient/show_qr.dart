import 'package:covid_report/values/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ShowQRPage extends StatelessWidget {
  const ShowQRPage({Key? key, required this.data}) : super(key: key);
  final String data;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Thông tin mã QR"),
        backgroundColor: AppColors.primaryColor,
      ),
      body: Column(
        children: [
          const SizedBox(height: 100),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                "Nguyễn Văn A",
                style: TextStyle(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          QRCustome(data: data),
        ],
      ),
    );
  }
}

class QRCustome extends StatelessWidget {
  const QRCustome({Key? key, required this.data}) : super(key: key);
  final String data;

  @override
  Widget build(BuildContext context) {
    return QrImage(
      data: data,
      version: QrVersions.auto,
      size: 300.0,
    );
  }
}
