import 'package:bloc_test/bloc_test.dart';
import 'package:covid_report/business/business.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Fetch report bloc test.....', () {
    blocTest(
      'emits [] when nothing is added',
      build: () => ReportBloc(),
      expect: () => [],
    );

    blocTest(
      'emits [ReportFetchLoading()] when Fetch event',
      build: () => ReportBloc(),
      act: (ReportBloc bloc) =>
          bloc.add(const ReportFetchEvent(identification: '123')),
      expect: () => [ReportFetchLoading()],
    );
  });
}
