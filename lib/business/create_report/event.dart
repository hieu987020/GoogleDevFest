import 'package:covid_report/data/model/report.dart';
import 'package:equatable/equatable.dart';

abstract class ReportCreateEvent extends Equatable {
  const ReportCreateEvent();
  @override
  List<Object?> get props => [];
}

class ReportCreateSubmitEvent extends ReportCreateEvent {
  const ReportCreateSubmitEvent({
    required this.report,
  });
  final Report report;
}
