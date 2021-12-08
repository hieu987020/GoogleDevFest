import 'dart:developer';

import 'package:covid_report/business/business.dart';
import 'package:covid_report/data/data_provider/report_provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReportBloc extends Bloc<ReportEvent, ReportState> {
  ReportBloc() : super(ReportInitialState()) {
    on<ReportFetchEvent>(_onFetch);
  }
  void _onFetch(ReportFetchEvent event, Emitter emit) async {
    try {
      emit(ReportFetchLoading());
      var result = await getReportByIdentification(event.identification);
      if (result.identification == 'fail') {
        emit(ReportFetchError());
      } else {
        emit(ReportFetchLoaded(result));
      }
    } catch (e) {
      log(e.toString());
      emit(ReportCreateError());
    }
  }
}
