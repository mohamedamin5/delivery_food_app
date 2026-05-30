import 'dart:io';

import 'package:equatable/equatable.dart';

abstract class AddNewItemEvent extends Equatable {
  const AddNewItemEvent();

  @override
  List<Object> get props => [];
}

class AddNewItemRequested extends AddNewItemEvent {
  final String name;
  final String description;
  final double price;
  final File file;

  const AddNewItemRequested({
    required this.name,
    required this.description,
    required this.price,
    required this.file,
  });

  @override
  List<Object> get props => [name, description, price, file];
}
