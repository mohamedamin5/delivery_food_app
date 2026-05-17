import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

abstract class AddNewItemEvent extends Equatable {
  const AddNewItemEvent();

  @override
  List<Object> get props => [];
}

class AddNewItemRequested extends AddNewItemEvent {
  final String name;
  final String description;
  final double price;
  final XFile image;

  const AddNewItemRequested({
    required this.name,
    required this.description,
    required this.price,
    required this.image,
  });

  @override
  List<Object> get props => [name, description, price, image];
}
