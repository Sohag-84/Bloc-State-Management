// ignore_for_file: prefer_const_constructors

import 'package:api_call_with_bloc/cubit/user_cubit.dart';
import 'package:api_call_with_bloc/services/api_services.dart';
import 'package:api_call_with_bloc/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UserCubit(apiServices: ApiServices()),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Bloc',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
