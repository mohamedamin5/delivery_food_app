import 'package:flutter_application_2/core/bloc/blocs_imports.dart';
import 'package:flutter_application_2/features/Home/logic/widgets_provider/custom_drop_down_bloc/drop_down_event.dart';
import 'package:flutter_application_2/features/Home/logic/widgets_provider/custom_drop_down_bloc/drop_down_state.dart';

abstract class DropDownBloc extends Bloc<DropDownEvent, DropDownState> {
  DropDownBloc() : super(const DropDownInitialState('All')) {
    on<DropDownSelectEvent>((event, emit) {
      emit(DropDownInitialState(event.selectedCategorie));
    });
  }
}
