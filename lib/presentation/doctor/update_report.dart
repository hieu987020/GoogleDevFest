import 'package:covid_report/business/business.dart';
import 'package:covid_report/data/model/report.dart';
import 'package:covid_report/presentation/doctor/doctor_home.dart';
import 'package:covid_report/values/app_colors.dart';
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
          CustomeReportText(text: "Họ và tên: " + report!.identification),
          const SizedBox(height: 20),
          CustomeReportText(text: "CMND/CCCD: " + report.identification),
          const SizedBox(height: 20),
          CustomeReportText(
              text: "Ngày tháng năm sinh: " + report.identification),
          const SizedBox(height: 20),
          CustomeReportText(text: "Nghề nghiệp: " + report.identification),
          const SizedBox(height: 20),
          CustomeReportText(text: "Đơn vị công tác: " + report.identification),
          const SizedBox(height: 20),
          CustomeReportText(text: "Địa chỉ liên hệ: " + report.identification),
          const SizedBox(height: 20),
          CustomeReportText(text: "Số điện thoại: " + report.identification),
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
