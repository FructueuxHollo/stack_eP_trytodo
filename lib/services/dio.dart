import 'package:dio/dio.dart';

class DioHelper {
  Dio _dio = Dio();
  DioHelper() {
    _dio = Dio();
  }
  Future<Response<Map<String, dynamic>>> fetchData(int counterint) async {
    String _searchUrl = makeUrl(counterint);
    Future<Response<Map<String, dynamic>>> _response;
    try {
      _response = _dio.get(_searchUrl);
      print(await _response);
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }
    return _response;
  }
}

String baseurl = 'http://numbersapi.com/';
String makeUrl(int counterint) {
  String number = counterint.toString();
  return baseurl + number + '?json';
}
