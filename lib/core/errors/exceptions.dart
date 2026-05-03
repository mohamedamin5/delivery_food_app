import 'package:dio/dio.dart';
import 'package:flutter_application_2/core/errors/error_handler.dart';
import 'package:flutter_application_2/core/errors/failures.dart';

void handleDioException(DioException e) {
  switch (e.type) {
    case DioExceptionType.connectionTimeout:
      throw ServerFailure("وقت الاتصال انتهى، حاول مرة تانية");
    case DioExceptionType.receiveTimeout:
      throw ServerFailure("السيرفر تأخر في الرد");
    case DioExceptionType.badResponse:
      handleBadResponse(e.response);
      break;
    case DioExceptionType.cancel:
      throw ServerFailure("تم إلغاء الطلب");
    case DioExceptionType.connectionError:
      throw NetworkFailure();
    default:
      throw ServerFailure("عذراً، حدث خطأ غير متوقع");
  }
}
