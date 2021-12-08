import 'package:bloc_test/bloc_test.dart';
import 'package:covid_report/business/business.dart';
import 'package:covid_report/data/model/report.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Create report bloc test.....', () {
    blocTest(
      'emits [] when nothing is added',
      build: () => ReportCreateBloc(),
      expect: () => [],
    );

    blocTest(
      'emits [ReportCreateLoading(), ReportCreateError()] when create report',
      build: () => ReportCreateBloc(),
      act: (ReportCreateBloc bloc) => bloc.add(ReportCreateSubmitEvent(
          report: Report(
              identification: '123',
              patientName: 'bloctest123',
              doctorConfirmed: 'false'))),
      expect: () => [ReportCreateLoading(), ReportCreateError()],
    );
  });
}
