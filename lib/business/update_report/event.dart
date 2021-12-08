import 'package:covid_report/data/model/report.dart';
import 'package:equatable/equatable.dart';

abstract class ReportUpdateEvent extends Equatable {
  const ReportUpdateEvent();
  @override
  List<Object?> get props => [];
}

class ReportUpdateSubmitEvent extends ReportUpdateEvent {
  const ReportUpdateSubmitEvent({
    required this.report,
  });
  final Report report;
}
