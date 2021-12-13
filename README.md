# Flutter project: im-covid.
State management: BloC </br>
Database: Firestore firebase </br>
Package: qr_flutter, qr_scanner
### Example
```dart
import 'dart:developer';
import 'dart:io';
import 'package:covid_report/business/business.dart';
import 'package:covid_report/presentation/presentations.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRViewExample extends StatefulWidget {
  const QRViewExample({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QRViewExampleState();
}

class _QRViewExampleState extends State<QRViewExample> {
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ReportBloc, ReportState>(
      listener: (context, state) {
        if (state is ReportFetchLoaded) {
          Navigator.pop(context);
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const Update()));
        }
        if (state is ReportFetchLoading) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return Center(
                child: Container(
                  width: 50,
                  height: 40,
                  color: Colors.white,
                  child: const Center(
                    child: SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        color: Colors.grey,
                        strokeWidth: 1,
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: Column(
          children: <Widget>[
            Expanded(flex: 4, child: _buildQrView(context)),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    result != null
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Số CCCD: ${result!.code}',
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Container(
                                height: 65,
                                width: 300,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: TextButton(
                                  onPressed: () async {
                                    BlocProvider.of<ReportBloc>(context).add(
                                        ReportFetchEvent(
                                            identification:
                                                result?.code ?? "not"));
                                  },
                                  child: const Text(
                                    'Xác nhận',
                                    style: TextStyle(
                                      color: AppColors.primaryColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        : const Text(
                            'Số Căn cước công dân:',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 150.0
        : 300.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: Colors.red,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
```
### Development
```
[√] Flutter (Channel stable, 2.5.3, on Microsoft Windows [Version 10.0.19043.1348], locale en-US)
[√] Android toolchain - develop for Android devices (Android SDK version 30.0.3)
[√] Chrome - develop for the web
[√] Android Studio (version 4.2)
[√] VS Code (version 1.63.0)
[√] Connected device (3 available)
```

### Nghiệp vụ
GIỚI THIỆU CHUNG VỀ IM-COVID

App có 2 loại user là người dân đi tiêm vắc xin(gọi là Người tiêm vắc-xin) và Nhân viên y tế.

Bước 1: Người tiêm vắc-xin ở nhà điền thông tin cơ bản vào form " Phiếu đăng ký tiêm chủng" và phải tick vào mục đồng ý tiêm vắc xin sau đó app tạo ra 1 QR code.

Bước 2: Người tiêm vắc-xin đến nơi tiêm vắc xin và trình QR code nhân viên y tế quét mã lấy thông tin mà Người tiêm vắc-xin đã nhập trước đó.

Bước 3: Người tiêm vắc-xin sẽ trình QR code này tại từng khâu trong quy trình tiêm chủng. Nhân viên y tế ở từng khâu sẽ quét QR code của người tiêm vắc-xin tại để kiểm tra, bổ sung thông tin của từng khâu mà nhân viên y tế này phụ trách.

Ví dụ: 1. Khâu tiếp nhận -> 2. Các khâu khám sàng lọc: đo nhịp tim, huyết áp, nhiệt độ, v.v… -> 3. Phòng tiêm vắc-xin Nếu tất các các khâu khám sàng lọc đã nhập thông tin và đủ điều kiện tiêm chủng thì nhân viên y tế chọn vào mục đồng ý cho người tiêm vắc-xin tiêm. => DONE quá trình.

Hiện trạng khi chưa có App này thì:

- Đối với người tiêm chủng: Người tiêm chủng phải điền form vào giấy tại chỗ và nộp form cho nhân viên y tế sắp xếp. Khi được gọi thì người tiêm chủng cầm form đến từng khu vực để kiểm tra sức khỏe và xác nhận. => tốn nhiều thời gian chờ đợi, tiếp xúc nhiều với nhân viên y tế, đồ dùng chung như bút viết, bàn ghế, giấy tờ.

- Đối với nhân viên y tế: phải thu lại toàn bộ form của người tiêm vắc-xin, sau đó gọi từng bệnh nhân một để kiểm tra sức khỏe và tick vào form giấy. Nhân viên y tế phải nhập dữ liệu từ form giấy vào máy tính. => tốn nhiều thời gian và công sức nhập liệu, tiếp xúc với giấy tờ qua tay nhiều người.

Ưu điểm khi có App:

App sẽ giải quyết được việc nhập liệu cho người tiêm vắc-xin và nhân viên y tế . => hạn chế tiếp xúc, tiết kiệm thời gian, không phải qua khâu thu form và gọi từng người.

App sẽ hạn chế được việc nhân viên y tế và người tiêm vắc-xin tiếp xúc nhiều với các đồ dùng chung (giấy-bút, v.v..).

Hạn chế của App:

Do thời gian có hạn, nên chỉ xây dựng được 1 số chức năng chính để demon trong phiên bản 1.0 này, nếu phát triển hơn thì sẽ xây dựng thêm các chức năng bổ sung: xuất phiếu xác nhận đã tiêm vắc-xin cho người tiêm, ràng buộc dữ liệu, tối ưu dữ liệu, giao diện v.v…

=================================
Video demo sản phẩm:
https://drive.google.com/drive/folders/1xnvKG_CMl_XUFmuwpKk2Vw_4zvbkpSY-?usp=sharing
