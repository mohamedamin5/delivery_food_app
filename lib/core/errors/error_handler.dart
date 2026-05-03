import 'package:dio/dio.dart';
import 'package:flutter_application_2/core/errors/failures.dart';

void handleBadResponse(Response? response) {
  if (response == null) {
    throw ServerFailure("رد السيرفر فارغ، حاول لاحقاً");
  }

  final statusCode = response.statusCode;
  final data = response.data;

  if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
    String errorMessage = data['message'] ?? "خطأ في البيانات المرسلة";
    throw ServerFailure(errorMessage);
  } else if (statusCode == 404) {
    throw ServerFailure("العنوان اللي بتطلبه غير موجود (404)");
  } else if (statusCode == 500) {
    throw ServerFailure("السيرفر فيه مشكلة داخلية، حاول لاحقاً");
  } else {
    throw ServerFailure("حدث خطأ غير معروف، كود: $statusCode");
  }
}
