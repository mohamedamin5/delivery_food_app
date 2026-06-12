import 'package:equatable/equatable.dart';

sealed class Failure extends Equatable {
  final String message;
  const Failure(this.message);
}

class ServerFailure extends Failure {
  const ServerFailure(super.message);

  @override
  List<Object?> get props => throw UnimplementedError();
}

class NetworkFailure extends Failure {
  const NetworkFailure() : super("No internet connection");

  @override
  List<Object?> get props => throw UnimplementedError();
}

class ValidationFailure extends Failure {
  const ValidationFailure(super.message);

  @override
  List<Object?> get props => throw UnimplementedError();
}
