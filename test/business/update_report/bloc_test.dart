import 'package:bloc_test/bloc_test.dart';
import 'package:covid_report/business/business.dart';
import 'package:covid_report/data/model/report.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Update report bloc test.....', () {
    blocTest(
      'emits [] when nothing is added',
      build: () => ReportUpdateBloc(),
      expect: () => [],
    );

    blocTest(
      'emits [ReportUpdateLoading(), ReportUpdateError()] when Fetch event',
      build: () => ReportUpdateBloc(),
      act: (ReportUpdateBloc bloc) => bloc.add(ReportUpdateSubmitEvent(
          report: Report(
              identification: '123',
              patientName: 'bloctest123',
              doctorConfirmed: 'false'))),
      expect: () => [ReportUpdateLoading(), ReportUpdateError()],
    );
  });
}
