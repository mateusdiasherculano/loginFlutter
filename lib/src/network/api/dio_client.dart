import 'package:auth/src/network/api/dio_client_interface.dart';
import 'package:dio/dio.dart';

class DioClient implements IDioClient {
  final Dio dio = Dio();
  @override
  Future<Map<String, String>> get(String url) async {
    var response = await dio.get(url);
    return response.data;
  }
}
