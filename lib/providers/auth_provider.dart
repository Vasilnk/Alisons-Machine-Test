import 'package:flutter/material.dart';
import 'package:alisons_machine_test/services/auth_service.dart';
import 'package:alisons_machine_test/services/home_service.dart';

class AuthProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<bool> login(String email, String password) async {
    _isLoading = true;
    notifyListeners();

    try {
      final response = await AuthService().login(email, password);

      if (response != null && response['success'] == 1) {
        final customerData = response['customerdata'];
        if (customerData != null) {
          HomeService.userId = customerData['id']?.toString();
          HomeService.userToken = customerData['token']?.toString();
        }
        _isLoading = false;
        notifyListeners();
        return true;
      }
    } catch (e) {
      // Handle error natively
    }

    _isLoading = false;
    notifyListeners();
    return false;
  }
}
