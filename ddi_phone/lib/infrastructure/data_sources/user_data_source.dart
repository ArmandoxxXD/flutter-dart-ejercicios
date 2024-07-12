import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ddi_phone/infrastructure/models/user_model.dart';
import '../../domain/entities/user.dart';

class UserDataSource {
  final String apiUrl;

  UserDataSource(this.apiUrl);

  Future<UserModel> fetchUser(String id) async {
    try {
      final response = await http.get(Uri.parse('$apiUrl/users/$id'));
      if (response.statusCode == 200) {
        return UserModel.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to load user: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load user: $e');
    }
  }
}
