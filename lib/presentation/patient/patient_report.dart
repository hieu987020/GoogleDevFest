import 'package:covid_report/data/data_provider/report_provider.dart';
import 'package:covid_report/data/model/report.dart';
import 'package:covid_report/presentation/presentations.dart';
import 'package:covid_report/values/app_colors.dart';
import 'package:flutter/material.dart';

class PatientPage extends StatelessWidget {
  const PatientPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Xác nhận tiêm chủng"),
        backgroundColor: AppColors.primaryColor,
      ),
      body: const SingleChildScrollView(
        child: ReportView(),
      ),
    );
  }
}

enum SingingCharacter { Male, Female }

class ReportView extends StatefulWidget {
  const ReportView({Key? key}) : super(key: key);

  @override
  _ReportViewState createState() => _ReportViewState();
}

class _ReportViewState extends State<ReportView> {
  final _hoten = TextEditingController();
  final _ns = TextEditingController();
  final _nn = TextEditingController();
  final _dvct = TextEditingController();
  final _dclh = TextEditingController();
  final _sdt = TextEditingController();
  final _cccd = TextEditingController();
  bool _confirmed = false; // xác nhận tiêm vắc xin

  bool _ismale = false;
  bool _isFemale = false;

  @override
  Widget build(BuildContext context) {
    SingingCharacter? _character = SingingCharacter.Male;
    return SafeArea(
      minimum: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                "PHIẾU XÁC NHẬN TIÊM CHỦNG COVID-19",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 19,
                  overflow: TextOverflow.ellipsis,
                  color: AppColors.primaryColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          TextField(
            decoration: const InputDecoration(labelText: 'Họ và tên'),
            controller: _hoten,
          ),
          TextField(
            decoration: const InputDecoration(labelText: 'CMND/CCCD'),
            controller: _cccd,
          ),
          Row(
            children: [
              Text(
                'Nam',
                style: TextStyle(color: Colors.grey[700], fontSize: 16),
              ),
              IconButton(
                onPressed: () {
                  if (_ismale == false) {
                    setState(() {
                      _ismale = true;
                      _isFemale = false;
                    });
                  }
                },
                icon: _ismale
                    ? Icon(Icons.check_box_outlined, color: Colors.grey[700])
                    : Icon(Icons.check_box_outline_blank,
                        color: Colors.grey[700]),
              ),
              Text(
                'Nữ',
                style: TextStyle(color: Colors.grey[700], fontSize: 16),
              ),
              IconButton(
                onPressed: () {
                  if (_isFemale == false) {
                    setState(() {
                      _isFemale = true;
                      _ismale = false;
                    });
                  }
                },
                icon: _isFemale
                    ? Icon(Icons.check_box_outlined, color: Colors.grey[700])
                    : Icon(Icons.check_box_outline_blank,
                        color: Colors.grey[700]),
              ),
            ],
          ),
          TextField(
            decoration: const InputDecoration(labelText: 'Ngày tháng năm sinh'),
            controller: _ns,
            style: const TextStyle(color: AppColors.primaryColor),
          ),
          TextField(
            decoration: const InputDecoration(labelText: 'Nghề nghiệp'),
            controller: _nn,
          ),
          TextField(
            decoration: const InputDecoration(labelText: 'Đơn vị công tác'),
            controller: _dvct,
          ),
          TextField(
            decoration: const InputDecoration(labelText: 'Địa chỉ liên hệ'),
            controller: _dclh,
          ),
          TextField(
            decoration: const InputDecoration(labelText: 'Số điện thoại'),
            controller: _sdt,
          ),
          const SizedBox(
            height: 50,
          ),
          /*TextButton(
            onPressed: onPressed, 
            child: Text('Continue'),
          ),*/
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              Text(
                'Lưu ý:',
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                  '1. Tiêm chủng vắc xin là bệnh pháp hiệu quả, tuy nhiên vắc xin phòng COVID-19 có thể không phòng được bệnh hoàn toàn. Người được tiêm chủng vắc xin phòng COVID-19 đủ liều có thể phòng được bệnh hoặc giảm mức độ nặng nếu mắc COVID-19. Sau khi được tiêm vắc xin phòng COVID-19 vẫn cần thực hiện đầy đủ Thông điệp 5K phòng, chống dịch COVID-19.'),
            ],
          ),
          const SizedBox(height: 10),
          const Text(
              '2. Tiêm chủng vắc xin phòng COVID-19 có thể gây ra một số biểu hiện tại chỗ tiêm hoặc toàn thân như sưng, đau chỗ tiêm, nhức đầu, buồn nôn, sốt, đau cơ,... hoặc tai biến nặng sau tiêm chủng.'),
          const SizedBox(height: 10),
          const Text(
              '3. Khi có triệu chứng bất thường về sức khỏe, người được tiêm chủng cần liên hệ với cơ sở y tế gần nhất để được tư vấn, khám và điều trị kịp thời.'),
          const Text(
              'Sau khi đã đọc các thông tin nêu trên, tôi đã hiểu về các nguy cơ và:'),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                  onPressed: () {
                    setState(() {
                      _confirmed = !_confirmed;
                    });
                  },
                  icon: _confirmed
                      ? const Icon(Icons.check_box_outlined)
                      : const Icon(Icons.check_box_outline_blank)),
              const Text('Đồng ý tiêm chủng'),
            ],
          ),
          const SizedBox(height: 20),
          Container(
            width: 200,
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextButton(
              onPressed: () async {
                if (!_confirmed) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Bạn phải tick vào ô đồng ý tiêm!'),
                      duration: Duration(seconds: 1),
                    ),
                  );
                } else {
                  await createReport(Report(
                    identification: _cccd.text,
                    patientName: _hoten.text,
                    age: 10,
                    image: 'image',
                    doctorConfirmed: 'false',
                  ));
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => ShowQRPage(
                  //               data: _cccd.text.toString(),
                  //             )));
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PatientHome()));
                }
                // ignore: curly_braces_in_flow_control_structures
              },
              child: const Text(
                'Xác nhận',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
            ),
          ),
          const SizedBox(height: 100),
          // IconButton(
          //   onPressed: () {
          //     setState(() {
          //       var user = FirebaseFirestore.instance
          //           .collection('idiid')
          //           .doc(_cccd.text.toString());
          //       user.set({
          //         'CCCD': _cccd.text.toString(),
          //         'Name': _hoten.text.toString(),
          //         'Ismale': _ismale.toString(),
          //         'Birtday': _ns.text.toString(),
          //         'Job': _nn.text.toString(),
          //         'Company': _dvct.text.toString(),
          //         'Address': _dclh.text.toString(),
          //         'Phone': _sdt.text.toString(),
          //       });
          //     });
          //   },
          //   icon: Icon(Icons.qr_code),
          // ),
        ],
      ),
    );
  }
}
