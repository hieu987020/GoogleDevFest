import 'package:covid_report/business/business.dart';
import 'package:covid_report/presentation/presentations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ReportCreateBloc>(
          create: (BuildContext context) => ReportCreateBloc(),
        ),
        BlocProvider<ReportBloc>(
          create: (BuildContext context) => ReportBloc(),
        ),
        BlocProvider<ReportUpdateBloc>(
          create: (BuildContext context) => ReportUpdateBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'IM-COVID',
        theme: ThemeData(
          primaryColor: AppColors.primaryColor,
        ),
        debugShowCheckedModeBanner: false,
        home: const Welcome(),
      ),
    );
  }
}
