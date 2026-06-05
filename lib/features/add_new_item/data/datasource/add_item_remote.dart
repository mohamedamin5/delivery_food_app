import 'package:flutter_application_2/features/add_new_item/data/model/add_item_response_model.dart';

abstract class AddItemRemote {
  Future<List<AddItemResponseModel>> getallCategories();

  Future<void> addItem(
    String name,
    String description,
    double price,
    int categoryId,
    String imageUrl,
  );
}
