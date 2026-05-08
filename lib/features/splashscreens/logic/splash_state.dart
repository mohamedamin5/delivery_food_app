import 'package:equatable/equatable.dart';

abstract class SplashState extends Equatable {
  const SplashState();

  @override
  List<Object> get props => [];
}

class SplashInitial extends SplashState {}

// 1. المستخدم مسجل دخول -> اذهب للرئيسية مباشرة
class Authenticated extends SplashState {}

// 2. المستخدم فتح التطبيق من قبل لكنه غير مسجل -> اذهب لصفحة تسجيل الدخول/الإنشاء
class Unauthenticated extends SplashState {}

// 3. المستخدم أول مرة يفتح التطبيق -> اذهب لشاشات الترحيب (Intro/Onboarding)
class FirstTimeUsage extends SplashState {}
