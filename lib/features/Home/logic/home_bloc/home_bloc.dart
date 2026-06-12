import 'package:flutter_application_2/core/bloc/blocs_imports.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeLoading());
}
