import 'package:flutter_application_2/blocs_imports.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeLoading()) {}
}
