abstract class BmiState {}

class InitialState extends BmiState {}

class ResultState extends BmiState {
  final double result;
  final String average;
  ResultState(this.result, this.average);
}

class ErrorState extends BmiState {}

class EmptyState extends BmiState {}

class ZeroState extends BmiState {}

class AverageState extends BmiState {
  final String average;
  AverageState(this.average);
}
