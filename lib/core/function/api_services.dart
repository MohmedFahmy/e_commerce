import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiServices {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://uvfttloqnwygwwzoqisi.supabase.co/rest/v1/',
      headers: {'apikey': dotenv.get('ANONKEY')},
    ),
  );

  Future<Response> getData(String path) async {
    return await _dio.get(path);
  }

  Future<Response> postData(String path, Map<String, dynamic> data) async {
    return await _dio.post(path, data: data);
  }

  Future<Response> patchData(String path, Map<String, dynamic> data) async {
    return await _dio.patch(path, data: data);
  }

  Future<Response> deleteData(String path) async {
    return await _dio.delete(path);
  }
}
