import 'package:covid_report/business/business.dart';
import 'package:covid_report/data/model/report.dart';
import 'package:covid_report/presentation/doctor/doctor_home.dart';
import 'package:covid_report/presentation/presentations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Update extends StatelessWidget {
  const Update({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocListener<ReportUpdateBloc, ReportUpdateState>(
      listener: (context, state) {
        if (state is ReportUpdateLoading) {
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
        if (state is ReportUpdateLoaded) {
          Navigator.pop(context);
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const DoctorHome()));
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
          title: const Text(
            'Cập nhật hồ sơ khám sàng lọc',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        body: const SingleChildScrollView(
          child: UpdateView(),
        ),
      ),
    );
  }
}

class UpdateView extends StatefulWidget {
  const UpdateView({
    Key? key,
  }) : super(key: key);

  @override
  State<UpdateView> createState() => _UpdateViewState();
}

class _UpdateViewState extends State<UpdateView> {
  bool _is1 = false;
  bool _is2 = false;
  bool _is3 = false;
  bool _is4 = false;
  bool _is5 = false;
  bool _is6 = false;
  bool _is7 = false;
  bool _is8 = false;
  bool _is9 = false;
  bool _is10 = false;
  bool _is11 = false;
  bool _is12 = false;
  bool _is13 = false;
  bool _is14 = false;
  bool _is15 = false;

  @override
  Widget build(BuildContext context) {
    var state = BlocProvider.of<ReportBloc>(context).state;
    Report? report;
    if (state is ReportFetchLoaded) {
      report = state.report;
    }
    return SafeArea(
      minimum: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: const [
                  Text(
                    "PHIẾU SÀNG LỌC TRƯỚC TIÊM CHỦNG",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 19,
                        color: AppColors.primaryColor),
                  ),
                  Text(
                    "VẮC XIN PHÒNG COVID-19",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 19,
                        color: AppColors.primaryColor),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          CustomeReportText(text: "Họ và tên: " + report!.patientName),
          const SizedBox(height: 20),
          CustomeReportText(text: "CMND/CCCD: " + report.identification),
          const SizedBox(height: 20),
          const CustomeReportText(text: "Ngày tháng năm sinh: 22/8/2000"),
          const SizedBox(height: 20),
          const CustomeReportText(text: "Nghề nghiệp: Sinh viên"),
          const SizedBox(height: 20),
          const CustomeReportText(text: "Đơn vị công tác: Hồ Chí Minh"),
          const SizedBox(height: 20),
          const CustomeReportText(
              text: "Địa chỉ liên hệ: 345 Nguyễn Trãi, Quận 1, TP.HCM"),
          const SizedBox(height: 20),
          const CustomeReportText(text: "Số điện thoại: 0909868415"),
          const SizedBox(height: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const CustomeReportText(
                text:
                    '1. Tiền sử phản vệ từ độ 2 trở lên (Nếu có, loại tác nhân dị ứng',
              ),
              IconButton(
                iconSize: 35,
                onPressed: () {
                  setState(() {
                    _is1 = !_is1;
                  });
                },
                icon: _is1
                    ? const Icon(Icons.check_box_outlined)
                    : const Icon(Icons.check_box_outline_blank),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const CustomeReportText(
                text: '2. Tiền sử bị COVID-19 trong vòng 6 tháng',
              ),
              IconButton(
                iconSize: 35,
                onPressed: () {
                  setState(() {
                    _is2 = !_is2;
                  });
                },
                icon: _is2
                    ? const Icon(Icons.check_box_outlined)
                    : const Icon(Icons.check_box_outline_blank),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const CustomeReportText(
                text:
                    '3. Tiền sử tiêm vắc xin khác trong 14 ngày qua (Nếu có, loại vắc xin………)',
              ),
              IconButton(
                iconSize: 35,
                onPressed: () {
                  setState(() {
                    _is3 = !_is3;
                  });
                },
                icon: _is3
                    ? const Icon(Icons.check_box_outlined)
                    : const Icon(Icons.check_box_outline_blank),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const CustomeReportText(
                text: '4. Tiền sử bệnh mạn tính, đang tiến triển',
              ),
              IconButton(
                iconSize: 35,
                onPressed: () {
                  setState(() {
                    _is4 = !_is4;
                  });
                },
                icon: _is4
                    ? const Icon(Icons.check_box_outlined)
                    : const Icon(Icons.check_box_outline_blank),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const CustomeReportText(
                text:
                    '5. Đang bị suy giảm khả năng đáp ứng miễn dịch nặng, ung thư giai đoạn cuối, đã cắt lách, đang dùng thuốc ức chế miễn dịch, corticoid liều cao (tương đương hoặc hơn 2mg prednisolon/kg/ngày trong ít nhất 7 ngày)',
              ),
              IconButton(
                iconSize: 35,
                onPressed: () {
                  setState(() {
                    _is5 = !_is5;
                  });
                },
                icon: _is5
                    ? const Icon(Icons.check_box_outlined)
                    : const Icon(Icons.check_box_outline_blank),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const CustomeReportText(
                text: '6. Bệnh cấp tính',
              ),
              IconButton(
                iconSize: 35,
                onPressed: () {
                  setState(() {
                    _is6 = !_is6;
                  });
                },
                icon: _is6
                    ? const Icon(Icons.check_box_outlined)
                    : const Icon(Icons.check_box_outline_blank),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const CustomeReportText(
                text: '7. Đang mang thai, phụ nữ đang nuôi con bằng sữa mẹ',
              ),
              IconButton(
                iconSize: 35,
                onPressed: () {
                  setState(() {
                    _is7 = !_is7;
                  });
                },
                icon: _is7
                    ? const Icon(Icons.check_box_outlined)
                    : const Icon(Icons.check_box_outline_blank),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const CustomeReportText(
                text: '8. Tiền sử dị ứng với bất kỳ dị nguyên nào',
              ),
              IconButton(
                iconSize: 35,
                onPressed: () {
                  setState(() {
                    _is8 = !_is8;
                  });
                },
                icon: _is8
                    ? const Icon(Icons.check_box_outlined)
                    : const Icon(Icons.check_box_outline_blank),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const CustomeReportText(
                text:
                    '9. Tiền sử bệnh nền, bệnh mạn tính được điều trị ổn định',
              ),
              IconButton(
                iconSize: 35,
                onPressed: () {
                  setState(() {
                    _is9 = !_is9;
                  });
                },
                icon: _is9
                    ? const Icon(Icons.check_box_outlined)
                    : const Icon(Icons.check_box_outline_blank),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const CustomeReportText(
                text:
                    '10. Tiền sử rối loạn đông/ cầm máu hoặc đang dùng thuốc chống đông',
              ),
              IconButton(
                iconSize: 35,
                onPressed: () {
                  setState(() {
                    _is10 = !_is10;
                  });
                },
                icon: _is10
                    ? const Icon(Icons.check_box_outlined)
                    : const Icon(Icons.check_box_outline_blank),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const CustomeReportText(
                text: '11. Độ tuổi:≥ 65 tuổi',
              ),
              IconButton(
                iconSize: 35,
                onPressed: () {
                  setState(() {
                    _is11 = !_is11;
                  });
                },
                icon: _is11
                    ? const Icon(Icons.check_box_outlined)
                    : const Icon(Icons.check_box_outline_blank),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const CustomeReportText(
                text: '12. Bất thường dấu hiệu sống',
              ),
              IconButton(
                iconSize: 35,
                onPressed: () {
                  setState(() {
                    _is12 = !_is12;
                  });
                },
                icon: _is12
                    ? const Icon(Icons.check_box_outlined)
                    : const Icon(Icons.check_box_outline_blank),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const CustomeReportText(
                text: '13. Dấu hiệu bất thường khi nghe tim phổi',
              ),
              IconButton(
                iconSize: 35,
                onPressed: () {
                  setState(() {
                    _is13 = !_is13;
                  });
                },
                icon: _is13
                    ? const Icon(Icons.check_box_outlined)
                    : const Icon(Icons.check_box_outline_blank),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const CustomeReportText(
                text: '14. Rối loạn tri giác',
              ),
              IconButton(
                iconSize: 35,
                onPressed: () {
                  setState(() {
                    _is14 = !_is14;
                  });
                },
                icon: _is14
                    ? const Icon(Icons.check_box_outlined)
                    : const Icon(Icons.check_box_outline_blank),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const CustomeReportText(
                text: '15. Đã tiêm phòng mũi 1 vắc xin COVID-19.',
              ),
              IconButton(
                iconSize: 35,
                onPressed: () {
                  setState(() {
                    _is15 = !_is15;
                  });
                },
                icon: _is15
                    ? const Icon(Icons.check_box_outlined)
                    : const Icon(Icons.check_box_outline_blank),
              ),
            ],
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 200,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextButton(
                  onPressed: () async {
                    BlocProvider.of<ReportUpdateBloc>(context)
                        .add(ReportUpdateSubmitEvent(
                            report: Report(
                      identification: report!.identification,
                      patientName: report.patientName,
                      doctorConfirmed: 'true',
                    )));
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
            ],
          ),
          const SizedBox(height: 100),
        ],
      ),
    );
  }
}

class CustomeReportText extends StatelessWidget {
  const CustomeReportText({Key? key, required this.text}) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        // fontWeight: FontWeight.bold,
        fontSize: 19,
        color: AppColors.primaryColor,
      ),
    );
  }
}
