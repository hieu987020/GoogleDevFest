import 'package:covid_report/data/data_provider/report_provider.dart';
import 'package:covid_report/data/model/report.dart';
import 'package:covid_report/presentation/presentations.dart';
import 'package:flutter/material.dart';

class PatientPage extends StatelessWidget {
  const PatientPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _identification = TextEditingController();
    TextEditingController _name = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hello Bệnh nhân A'),
      ),
      body: Column(
        children: [
          TextField(
            controller: _identification,
            decoration: const InputDecoration(
              filled: true,
              labelText: 'Identification',
            ),
          ),
          TextField(
            controller: _name,
            decoration: const InputDecoration(
              filled: true,
              labelText: 'Name',
            ),
          ),
          const SizedBox(height: 20),
          Container(
            width: 200,
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextButton(
              onPressed: () async {
                // Chỗ này thêm hàm add
                await createReport(Report(
                  identification: _identification.text,
                  patientName: _name.text,
                  age: 10,
                  image: 'image',
                  doctorConfirmed: 'false',
                ));
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ShowQRPage()));
              },
              child: const Text(
                'Save/QR',
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
    );
  }
}
