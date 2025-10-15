import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'presentation/providers/user_provider.dart';
import 'presentation/screens/home_screen.dart';
import 'data/datasources/user_remote_datasource.dart';
import 'data/repositories/user_repository_impl.dart';
import 'domain/usecases/get_users.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Dependency Injection
    final httpClient = http.Client();
    final remoteDataSource = UserRemoteDataSourceImpl(client: httpClient);
    final repository = UserRepositoryImpl(remoteDataSource: remoteDataSource);
    final getUsersUseCase = GetUsers(repository);

    return ChangeNotifierProvider(
      create: (_) => UserProvider(getUsersUseCase),
      child: MaterialApp(
        title: 'Profile Explorer',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: const Color(0xFF1a1a1a),
          useMaterial3: true,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}