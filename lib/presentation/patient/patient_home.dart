import 'package:flutter/material.dart';

class PatientHome extends StatelessWidget {
  const PatientHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QUẢN LÝ TIÊM CHỦNG COVID-19'),
      ),
      body: Column(
        children: [
          Container(
            width: 150,
            height: 150,
          )
        ],
      ),
    );
  }
}
