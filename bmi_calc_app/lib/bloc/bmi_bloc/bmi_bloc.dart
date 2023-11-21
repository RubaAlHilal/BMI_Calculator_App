import 'package:bmi_calculator/bloc/bmi_bloc/bmi_event.dart';
import 'package:bmi_calculator/bloc/bmi_bloc/bmi_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BmiBloc extends Bloc<BmiEvent, BmiState> {
  BmiBloc() : super(InitialState()) {
    on<BmiEvent>((event, emit) {
      try {
        if (event.height.isEmpty || event.weight.isEmpty) {
          emit(EmptyState());
        } else if (event.height == "0" || event.weight == "0") {
          emit(ZeroState());
        } else {
          double heightdouble = double.parse(event.height);
          double weightDouble = double.parse(event.weight);

          final double result =
              weightDouble / (heightdouble * heightdouble) * 10000;

          bmiAverage(double result) {
            if (result <= 18.4) {
              return "Underweight";
            } else if (18.5 <= result && result <= 24.9) {
              return "Normal";
            } else if (25.0 <= result && result <= 39.9) {
              return "Overweight";
            } else {
              return "Obese";
            }
          }

          String averageReselt = bmiAverage(result);

          emit(ResultState(
              double.parse(result.toStringAsFixed(1)), averageReselt));
        }
      } catch (e) {
        emit(ErrorState());
      }
    });
  }
}
