import 'package:covid_report/data/model/report.dart';
import 'package:equatable/equatable.dart';

abstract class ReportCreateState extends Equatable {
  const ReportCreateState();
  @override
  List<Object?> get props => [];
}

class ReportCreateInitialState extends ReportCreateState {}

class ReportCreateLoaded extends ReportCreateState {
  // final Report report;
  // const ReportCreateLoaded(this.report);
}

class ReportCreateLoading extends ReportCreateState {}

class ReportCreateError extends ReportCreateState {}

class ReportCreateShowNotification extends ReportCreateState {
  final Report report;

  const ReportCreateShowNotification(this.report);
}
