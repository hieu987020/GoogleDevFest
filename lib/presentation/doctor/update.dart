import 'dart:developer';
import 'package:covid_report/data/data_provider/report_provider.dart';
import 'package:covid_report/data/model/report.dart';
import 'package:flutter/material.dart';

class Update extends StatelessWidget {
  const Update({Key? key, required this.report}) : super(key: key);
  final Report report;
  @override
  Widget build(BuildContext context) {
    TextEditingController _identification =
        TextEditingController(text: report.identification);
    TextEditingController _name =
        TextEditingController(text: report.patientName);
    log(report.toString());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Report'),
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
          ElevatedButton(
            child: const Text('Update'),
            onPressed: () async {
              await updateReport(Report(
                identification: _identification.text,
                patientName: _name.text,
                age: 10,
                image: 'image',
                doctorConfirmed: 'true',
              ));
            },
          ),
        ],
      ),
    );
  }
}
