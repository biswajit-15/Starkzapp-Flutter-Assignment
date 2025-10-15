import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user_model.dart';

// Abstract contract for remote data source
abstract class UserRemoteDataSource {
  Future<List<UserModel>> getUsers();
}

// Implementation of remote data source
class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final http.Client client;
  static const String baseUrl = 'https://randomuser.me/api/?results=20';

  UserRemoteDataSourceImpl({required this.client});

  @override
  Future<List<UserModel>> getUsers() async {
    try {
      final response = await client.get(Uri.parse(baseUrl));

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        final results = jsonData['results'] as List;
        return results.map((user) => UserModel.fromJson(user)).toList();
      } else {
        throw Exception('Failed to load users: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }
}