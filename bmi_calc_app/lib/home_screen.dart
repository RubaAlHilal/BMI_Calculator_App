// ignore_for_file: non_constant_identifier_names

import 'package:bmi_calculator/bloc/bmi_bloc/bmi_bloc.dart';
import 'package:bmi_calculator/bloc/bmi_bloc/bmi_event.dart';
import 'package:bmi_calculator/bloc/bmi_bloc/bmi_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'components/textfield_widget.dart';
import 'package:google_fonts/google_fonts.dart';

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
            Text(
              "BMI Calculator",
              style:
                  GoogleFonts.lato(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 25,
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextfieldWidget(
                      title: 'Insert Weight',
                      hint: 'kg',
                      controller: weightController,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    TextfieldWidget(
                      title: 'Insert Height',
                      hint: 'cm',
                      controller: heightController,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 175,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: () {
                      //calculate bmi and insert value of bmi result into table bmi
                      context.read<BmiBloc>().add(BmiEvent(
                          heightController.text, weightController.text));
                    },
                    child: const Text(
                      "calculate BMI",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
                        "Your Bmi is: ${state.result}\naverage: ${state.average}",
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
