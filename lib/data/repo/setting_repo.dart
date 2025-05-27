import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/setting_model.dart';

class SettingsRepository {
  Future<SettingsModel> fetchSettings() async {
    final response = await http.get(Uri.parse(
        'http://103.127.29.85/ecom-layout-dynamic/laravel/dynamic_layout/public/api/settings'));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return SettingsModel.fromJson(data[0]);
    } else {
      throw Exception('Failed to load settings');
    }
  }
}
