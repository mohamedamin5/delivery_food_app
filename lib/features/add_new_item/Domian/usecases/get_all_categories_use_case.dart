import 'package:dartz/dartz.dart';
import 'package:flutter_application_2/features/add_new_item/Domian/repositories/repository.dart';
import 'package:flutter_application_2/features/add_new_item/data/model/add_item_response_model.dart';

class GetAllCategoriesUseCase {
  final AddItemRepository repository;

  GetAllCategoriesUseCase(this.repository);

  Future<Either<String, List<AddItemResponseModel>>> execute() async {
    try {
      final categories = await repository.getALlCategories();
      return Right(categories);
    } catch (e) {
      return Left("Failed to fetch categories: $e");
    }
  }
}
