import 'dart:convert';
import 'dart:developer';
import 'package:alisons_machine_test/models/home_response.dart';
import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio();
  static String? userId;
  static String? userToken;

  static String getImageUrl(String filename) {
    if (filename.isEmpty) return 'https://picsum.photos/200'; // fallback
    if (filename.startsWith('http')) return filename;
    return 'https://sungod.demospro2023.in.net/public/uploads/products/$filename';
  }

  static String getBannerUrl(String filename) {
    if (filename.isEmpty) return 'https://picsum.photos/400/200';
    if (filename.startsWith('http')) return filename;
    return 'https://sungod.demospro2023.in.net/public/uploads/banners/$filename';
  }

  Future<HomeResponse?> getHomeData() async {
    try {
      final response = await _dio.post(
        'https://sungod.demospro2023.in.net/api/home/en',
        options: Options(contentType: Headers.formUrlEncodedContentType),
        data: {
          'id': userId ?? '80y',
          'token': userToken ?? 'qGLJyosEDVntg8KsWU8aVvX0Xc8eVfF5YDYecufR',
        },
      );

      if (response.statusCode == 200 && response.data != null) {
        final data = response.data is String
            ? jsonDecode(response.data)
            : response.data;
        if (data['success'] == 1) {
          return HomeResponse.fromJson(data);
        }
      }
    } catch (e) {
      log('API Error: $e');
    }
    return null;
  }
}
