import 'dart:convert';
import 'dart:developer';
import 'package:alisons_machine_test/models/home_response.dart';
import 'package:dio/dio.dart';
import 'package:alisons_machine_test/utils/api_constants.dart';

class HomeService {
  final Dio _dio = Dio();
  static String? userId;
  static String? userToken;
  static String fallbackUrl = 'https://picsum.photos/200';
  static String getImageUrl(String filename) {
    if (filename.isEmpty) return fallbackUrl; // fallback
    if (filename.startsWith('http')) return filename;
    return '${ApiConstants.productImagesUrl}$filename';
  }

  static String getBannerUrl(String filename) {
    if (filename.isEmpty) return fallbackUrl;
    if (filename.startsWith('http')) return filename;
    return '${ApiConstants.bannerImagesUrl}$filename';
  }

  Future<HomeResponse?> getHomeData() async {
    try {
      final response = await _dio.post(
        ApiConstants.homeEndpoint,
        options: Options(contentType: Headers.formUrlEncodedContentType),
        data: {'id': userId ?? '', 'token': userToken ?? ''},
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
