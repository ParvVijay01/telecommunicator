import 'package:dio/dio.dart';
import '../utility/constants.dart';

class HttpService {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: MAIN_URL,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      validateStatus: (status) {
        return status != null &&
            status < 500; // ✅ Allows handling of 404 errors
      },
    ),
  );

  /// 🔹 GET Request - Fetch data from API
  Future<Response?> getItems(
      {required String endpointUrl,
      Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await dio.get(endpointUrl);
      return response;
    } on DioException catch (e) {
      return _handleDioError(e, endpointUrl);
    }
  }

  /// 🔹 POST Request - Add new item to API
  Future<Response?> addItem(
      {required String endpointUrl, required dynamic itemData}) async {
    try {
      final response =  await dio.post(endpointUrl, data: itemData);
      return response;
    } on DioException catch (e) {
      return _handleDioError(e, endpointUrl);
    }
  }

  /// 🔹 PUT Request - Update an existing item
  Future<Response?> updateItem({
    required String endpointUrl,
    required String itemId,
    required dynamic itemData,
  }) async {
    try {
      final response = await dio.put('$endpointUrl/$itemId', data: itemData);
      return response;
    } on DioException catch (e) {
      return _handleDioError(e, endpointUrl);
    }
  }

  /// 🔹 DELETE Request - Remove an item
  Future<Response?> deleteItem(
      {required String endpointUrl, required String itemId}) async {
    try {
      final response = await dio.delete('$endpointUrl/$itemId');
      return response;
    } on DioException catch (e) {
      return _handleDioError(e, endpointUrl);
    }
  }

  /// 🔹 Handle API response status codes

  /// 🔹 Handle Dio exceptions properly
  Response _handleDioError(DioException e, String path) {
    String errorMessage = "Unknown error occurred.";
    if (e.response != null) {
      errorMessage =
          "Error: ${e.response!.statusCode} - ${e.response!.statusMessage}";
    } else if (e.type == DioExceptionType.connectionTimeout) {
      errorMessage = "Connection timeout. Please check your internet.";
    } else if (e.type == DioExceptionType.receiveTimeout) {
      errorMessage = "Receive timeout. Server is taking too long.";
    } else if (e.type == DioExceptionType.badResponse) {
      errorMessage = "Bad response from server.";
    } else if (e.type == DioExceptionType.cancel) {
      errorMessage = "Request was cancelled.";
    } else {
      errorMessage = "Unexpected error: ${e.message}";
    }

    print("Dio Error: $errorMessage");
    return Response(
      requestOptions: RequestOptions(path: path),
      statusCode: e.response?.statusCode ?? 500,
      data: {'error': errorMessage},
    );
  }
}
