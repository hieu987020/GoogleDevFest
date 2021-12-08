import 'dart:developer';

import 'package:covid_report/business/business.dart';
import 'package:covid_report/data/data_provider/report_provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReportCreateBloc extends Bloc<ReportCreateEvent, ReportCreateState> {
  ReportCreateBloc() : super(ReportCreateInitialState()) {
    on<ReportCreateSubmitEvent>(_onSubmit);
  }
  void _onSubmit(ReportCreateSubmitEvent event, Emitter emit) async {
    try {
      emit(ReportCreateLoading());
      await createReport(event.report);
      // await Future.delayed(const Duration(seconds: 2));
      emit(ReportCreateLoaded());
    } catch (e) {
      log(e.toString());
      emit(ReportCreateError());
    }
  }
}
