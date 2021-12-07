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
        title: const Text('Mã QR của bạn'),
      ),
      body: Center(
        child: QRCustome(data: data),
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
