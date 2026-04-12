import 'package:equatable/equatable.dart';

abstract class DropDownEvent extends Equatable {
  const DropDownEvent();

  @override
  List<Object?> get props => [];
}

class DropDownSelectEvent extends DropDownEvent {
  final String selectedCategorie;
  const DropDownSelectEvent(this.selectedCategorie);

  @override
  List<Object?> get props => [selectedCategorie];
}
