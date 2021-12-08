import 'package:covid_report/data/model/report.dart';
import 'package:equatable/equatable.dart';

abstract class ReportState extends Equatable {
  const ReportState();
  @override
  List<Object?> get props => [];
}

class ReportInitialState extends ReportState {}

class ReportFetchLoaded extends ReportState {
  final Report report;
  const ReportFetchLoaded(this.report);
}

class ReportFetchLoading extends ReportState {}

class ReportFetchError extends ReportState {}
