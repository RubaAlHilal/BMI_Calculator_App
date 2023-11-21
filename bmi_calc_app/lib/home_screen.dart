// ignore_for_file: non_constant_identifier_names

import 'package:bmi_calculator/bloc/bmi_bloc/bmi_bloc.dart';
import 'package:bmi_calculator/bloc/bmi_bloc/bmi_event.dart';
import 'package:bmi_calculator/bloc/bmi_bloc/bmi_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'components/textfield_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController heightController = TextEditingController(),
        weightController = TextEditingController();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                const Text(
                  "BMI Calculator",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 45,
                ),
                TextfieldWidget(
                  title: 'Insert Weight',
                  hint: 'kg',
                  controller: heightController,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextfieldWidget(
                  title: 'Insert Height',
                  hint: 'cm',
                  controller: weightController,
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 175,
                  child: ElevatedButton(
                    onPressed: () {
                      //calculate bmi and insert value of bmi result into table bmi
                      context.read<BmiBloc>().add(BmiEvent(
                          heightController.text, weightController.text));
                    },
                    child: const Text(
                      "calculate BMI",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                BlocBuilder<BmiBloc, BmiState>(
                  builder: (context, state) {
                    if (state is InitialState) {
                      return const Text("");
                    } else if (state is ZeroState) {
                      return const Text("please enter a valid number");
                    } else if (state is ResultState) {
                      return Text(
                        "Your Bmi is: ${state.result}\naverage: ${BmiAverage(state.result)}",
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      );
                    } else {
                      if (state is EmptyState) {
                        return const Text(
                          "enter height and weight",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        );
                      } else {
                        return const Text(
                          "Error",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        );
                      }
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

BmiAverage(double result) {
  if (result < 18.5) {
    return "underweight";
  } else if (18.5 <= result && result <= 24.9) {
    return "healthy";
  } else if (25.0 <= result && result <= 29.9) {
    return "overweight";
  } else {
    return "out of range";
  }
}
