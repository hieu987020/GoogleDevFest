import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covid_report/data/model/patient.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> createReport() async {
  await Firebase.initializeApp();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference reports = firestore.collection('report');
  try {
    reports.add({'Identification': '55465', 'Name': 'konbanwa'}).then(
        (value) => log(value.toString()));
  } catch (e) {
    log(e.toString());
  }
}

Future<void> getReportByIdentification() async {
  await Firebase.initializeApp();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference reports = firestore.collection('report');
  try {
    Report report;
    reports.get().then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        if (doc['Identification'] == '32132132132') {
          log(doc["Identification"]);
          log(doc["Name"]);
          report = Report(doc["Identification"], doc["Name"], 10, 'image');
          log(report.toString());
        }
      });
    });
  } catch (e) {
    log(e.toString());
  }
}
