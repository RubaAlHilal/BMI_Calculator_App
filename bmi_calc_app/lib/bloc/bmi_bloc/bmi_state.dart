abstract class BmiState {}

class InitialState extends BmiState {}

class ResultState extends BmiState {
  final double result;
  ResultState(this.result);
}

class ErrorState extends BmiState {}

class EmptyState extends BmiState {}
