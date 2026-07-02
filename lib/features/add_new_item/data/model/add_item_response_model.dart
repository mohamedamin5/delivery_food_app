import 'package:flutter_application_2/features/add_new_item/Domian/Entities/add_item_entity.dart';

class AddItemResponseModel extends AddItemEntity {
  const AddItemResponseModel({
    required super.id,
    required super.name,
    required super.imageUrl,
  });

  factory AddItemResponseModel.fromJson(Map<String, dynamic> json) {
    return AddItemResponseModel(
      id: json['id'],
      name: json['name'],
      imageUrl: json['picture'],
    );
  }
}
