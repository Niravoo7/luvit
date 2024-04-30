import 'package:get/get.dart';

class ApiClient extends GetConnect implements GetxService {
  ApiClient() {
    super.timeout = const Duration(seconds: 5);
    _mainHeaders = {"Content-Type": "application/json; charset=UTF-8"};
  }

  late Map<String, String> _mainHeaders;

  Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String? contentType,
    Map<String, String>? headers,
  }) async {
    try {
      final response = await get(
        url,
        contentType: contentType,
        query: query,
        headers: _mainHeaders,
      );
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  Future<Response> postData({
    required String url,
    //ignore:avoid_annotating_with_dynamic
    required dynamic body,
    Map<String, dynamic>? query,
    String? contentType,
    Map<String, String>? headers,
  }) async {
    try {
      final response = await post(
        url,
        body,
        contentType: contentType,
        query: query,
        headers: _mainHeaders,
      );
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  Response? handleResponse(Response response) {
    Response? responseTemp;
    if (response.hasError &&
        response.body != null &&
        response.body is! String) {
      if (response.body.toString().startsWith('{errors: [{code:')) {
        responseTemp = Response(
          statusCode: response.statusCode,
          body: response.body,
          statusText: "Error",
        );
      } else if (response.body.toString().startsWith('{message')) {
        responseTemp = Response(
          statusCode: response.statusCode,
          body: response.body,
          statusText: response.body['message'],
        );
      }
    } else if (response.hasError && response.body == null) {
      responseTemp = const Response(
        statusCode: 0,
        statusText:
            'Connection to API server failed due to internet connection',
      );
    }
    return responseTemp;
  }
}
