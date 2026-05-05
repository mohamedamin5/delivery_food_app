import 'package:equatable/equatable.dart';

abstract class SplashState extends Equatable {
  const SplashState();

  @override
  List<Object> get props => [];
}

class SplashInitial extends SplashState {}

// الحالة: المستخدم مسجل دخول
class Authenticated extends SplashState {}

// الحالة: المستخدم غير مسجل دخول
class Unauthenticated extends SplashState {}
