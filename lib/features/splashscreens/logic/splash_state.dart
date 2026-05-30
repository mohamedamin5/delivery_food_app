import 'package:equatable/equatable.dart';

enum UserRole { customer, chef }

abstract class SplashState extends Equatable {
  const SplashState();

  @override
  List<Object> get props => [];
}

class SplashInitial extends SplashState {}

class Authenticated extends SplashState {
  final UserRole role;

  Authenticated({required this.role});
}

class Unauthenticated extends SplashState {}

class FirstTimeUsage extends SplashState {}
