import 'package:bmi_calculator/bloc/bmi_bloc/bmi_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
          create: (BuildContext context) {
            return BmiBloc();
          },
          child: const HomeScreen()),
    );
  }
}
