import 'dart:developer';

import 'package:covid_report/business/business.dart';
import 'package:covid_report/data/data_provider/report_provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReportUpdateBloc extends Bloc<ReportUpdateEvent, ReportUpdateState> {
  ReportUpdateBloc() : super(ReportUpdateInitialState()) {
    on<ReportUpdateSubmitEvent>(_onSubmit);
  }
  void _onSubmit(ReportUpdateSubmitEvent event, Emitter emit) async {
    try {
      emit(ReportUpdateLoading());
      await updateReport(event.report);
      // await Future.delayed(const Duration(seconds: 2));
      emit(ReportUpdateLoaded());
    } catch (e) {
      log(e.toString());
      emit(ReportUpdateError());
    }
  }
}
