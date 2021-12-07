import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covid_report/data/model/report.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> createReport(Report report) async {
  await Firebase.initializeApp();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference reports = firestore.collection('report');
  try {
    reports.add({
      'Identification': report.identification,
      'Name': report.patientName,
      'DoctorConfirmed': report.doctorConfirmed,
    }).then((value) => log(value.toString()));
  } catch (e) {
    log(e.toString());
    throw (e.toString());
  }
}

Future<void> updateReport(Report report) async {
  await Firebase.initializeApp();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference reports = firestore.collection('report');
  try {
    String docId = '';
    await reports.get().then((QuerySnapshot querySnapshot) async {
      for (var doc in querySnapshot.docs) {
        if (doc['Identification'] == report.identification) {
          docId = doc.id;
        }
      }
    });
    if (docId.isEmpty) {
      log("Retrieve data fail in Update Logic");
      return;
    }
    return reports
        .doc(docId)
        .update({'DoctorConfirmed': 'true'})
        .then((value) => log("User Updated"))
        .catchError((error) => log("Failed to update user: $error"));
  } catch (e) {
    log(e.toString());
    throw (e.toString());
  }
}

Future<Report> getReportByIdentification(String identification) async {
  await Firebase.initializeApp();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference reports = firestore.collection('report');
  try {
    Report? result;
    await reports.get().then((QuerySnapshot querySnapshot) async {
      for (var doc in querySnapshot.docs) {
        if (doc['Identification'] == identification) {
          result = Report(
            identification: doc["Identification"],
            patientName: doc["Name"],
            age: 10,
            image: 'image',
            doctorConfirmed: doc["DoctorConfirmed"],
          );
        }
      }
    });
    if (result == null) {
      return Report(
        identification: 'fail',
        patientName: 'fail',
        age: 10,
        image: 'fail',
        doctorConfirmed: 'fail',
      );
    } else {
      return result!;
    }
  } catch (e) {
    log(e.toString());
    throw (e.toString());
  }
}
