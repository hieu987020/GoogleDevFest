import 'package:covid_report/data/model/report.dart';
import 'package:equatable/equatable.dart';

abstract class ReportUpdateState extends Equatable {
  const ReportUpdateState();
  @override
  List<Object?> get props => [];
}

class ReportUpdateInitialState extends ReportUpdateState {}

class ReportUpdateLoaded extends ReportUpdateState {
  // final Report report;
  // const ReportUpdateLoaded(this.report);
}

class ReportUpdateLoading extends ReportUpdateState {}

class ReportUpdateError extends ReportUpdateState {}

class ReportUpdateShowNotification extends ReportUpdateState {
  final Report report;

  const ReportUpdateShowNotification(this.report);
}
