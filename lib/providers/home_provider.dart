import 'package:flutter/material.dart';
import 'package:alisons_machine_test/models/home_response.dart';
import 'package:alisons_machine_test/services/home_service.dart';

class HomeProvider extends ChangeNotifier {
  HomeResponse? _homeData;
  bool _isLoading = true;

  HomeResponse? get homeData => _homeData;
  bool get isLoading => _isLoading;

  Future<void> fetchHomeData() async {
    _isLoading = true;
    notifyListeners();

    _homeData = await HomeService().getHomeData();

    _isLoading = false;
    notifyListeners();
  }
}
