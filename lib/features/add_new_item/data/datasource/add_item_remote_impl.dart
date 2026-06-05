import 'package:flutter_application_2/core/consts/storage_keys.dart';
import 'package:flutter_application_2/core/network/i_api_consumer.dart';
import 'package:flutter_application_2/core/network/api_endpoints.dart';
import 'package:flutter_application_2/features/Auth/data/datasoorce/auth_local_data_source.dart';
import 'package:flutter_application_2/features/add_new_item/data/datasource/add_item_remote.dart';
import 'package:flutter_application_2/features/add_new_item/data/model/add_item_response_model.dart';

class AddItemRemoteImpl implements AddItemRemote {
  final IApiConsumer api;
  final AuthLocalDataSource authLocalDataSource;

  AddItemRemoteImpl(this.api, this.authLocalDataSource);

  @override
  Future<List<AddItemResponseModel>> getallCategories() async {
    final reponse = await api.get(ApiEndpoints.categories);
    return (reponse["categories"] as List)
        .map((e) => AddItemResponseModel.fromJson(e))
        .toList();
  }

  @override
  Future<void> addItem(
    String name,
    String description,
    double price,
    int categoryId,
    String imageUrl,
  ) async {
    final token = await authLocalDataSource.getAuthData(
      StorageKeys.accessToken,
    );
    final response = await api.post(
      ApiEndpoints.products,
      body: {
        "name": name,
        "description": description,
        "price": price,
        "category_id": categoryId,
        "image_url": imageUrl,
      },
      headers: {"Authorization": "Bearer $token"},
    );
  }
}
