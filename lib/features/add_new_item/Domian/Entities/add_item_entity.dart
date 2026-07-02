import 'package:equatable/equatable.dart';

class AddItemEntity extends Equatable {
  final int id;
  final String name;
  final String imageUrl;

  const AddItemEntity({
    required this.id,
    required this.name,
    required this.imageUrl,
  });

  @override
  List<Object?> get props => [id, name, imageUrl];
}
