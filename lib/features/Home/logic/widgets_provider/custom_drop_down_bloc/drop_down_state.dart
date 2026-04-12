import 'package:equatable/equatable.dart';

abstract class DropDownState extends Equatable {
  final String selectedCategorie;
  const DropDownState(this.selectedCategorie);

  @override
  List<Object?> get props => [selectedCategorie];
}

class DropDownInitialState extends DropDownState {
  const DropDownInitialState(super.selectedCategorie);
}
