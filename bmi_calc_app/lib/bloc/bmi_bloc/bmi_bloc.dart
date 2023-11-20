import 'package:bmi_calculator/bloc/bmi_bloc/bmi_event.dart';
import 'package:bmi_calculator/bloc/bmi_bloc/bmi_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BmiBloc extends Bloc<BmiEvent, BmiState> {
  BmiBloc() : super(InitialState()) {
    on<BmiEvent>((event, emit) {
      try {
        if (event.height.isEmpty || event.weight.isEmpty) {
          emit(EmptyState());
        } else {
          double heightdouble = double.parse(event.height);
          double Weightdouble = double.parse(event.weight);

          final double result = heightdouble + Weightdouble;
          emit(ResultState(result));
        }
      } catch (e) {
        emit(ErrorState());
      }
    });
  }
}
