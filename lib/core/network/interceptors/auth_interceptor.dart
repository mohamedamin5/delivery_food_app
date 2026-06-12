import 'package:dio/dio.dart';
import 'package:flutter_application_2/core/consts/storage_keys.dart';
import 'package:flutter_application_2/features/Auth/data/datasoorce/auth_local_data_source.dart';

class AuthInterceptor extends Interceptor {
  final Dio dio;
  final AuthLocalDataSource authLocalDataSource;

  AuthInterceptor(this.dio, this.authLocalDataSource);

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 403 || err.response?.statusCode == 401) {
      try {
        final refreshToken = await authLocalDataSource.getAuthData(
          StorageKeys.refreshToken,
        );

        if (refreshToken != null) {
          final refreshResponse = await dio.post(
            'http://127.0.0.1:8000/auth/refresh',
            data: {'refresh_token': refreshToken},
          );

          if (refreshResponse.statusCode == 200) {
            final newAccessToken = refreshResponse.data['access_token'];

            await authLocalDataSource.updateAccessToken(newAccessToken);

            final requestOptions = err.requestOptions;
            requestOptions.headers['Authorization'] = 'Bearer $newAccessToken';

            final clonedRequest = await dio.request(
              requestOptions.path,
              options: Options(
                method: requestOptions.method,
                headers: requestOptions.headers,
              ),
              data: requestOptions.data,
              queryParameters: requestOptions.queryParameters,
            );

            // تمرير الطلب الناجح للـ Bloc وكأن شيئاً لم يكن
            return handler.resolve(clonedRequest);
          }
        }
      } catch (e) {
        // لو حتى الـ Refresh token باظ، امسح البيانات واطرد المستخدم للـ Login
        // هنا نمرر الخطأ عادي عشان ينزل لـ handleDioException
      }
    }

    // لو الخطأ مش انتهاء توكن، مرره طبيعي يروح للـ handleDioException
    super.onError(err, handler);
  }
}
