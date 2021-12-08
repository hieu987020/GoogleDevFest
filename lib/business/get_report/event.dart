import 'package:equatable/equatable.dart';

abstract class ReportEvent extends Equatable {
  const ReportEvent();
  @override
  List<Object?> get props => [];
}

class ReportFetchEvent extends ReportEvent {
  const ReportFetchEvent({
    required this.identification,
  });
  final String identification;
}
