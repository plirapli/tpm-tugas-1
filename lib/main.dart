import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import 'package:si_bagus/pages/home.dart';
import 'package:si_bagus/pages/login.dart';

void main() async {
  await GetStorage.init('auth');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final authStorage = GetStorage('auth');
    bool isLoggedIn = authStorage.read('isLogged') ?? false;

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Mobile Programming Assignment',
        theme: ThemeData(
          textSelectionTheme: const TextSelectionThemeData(
              cursorColor: Colors.black,
              selectionColor: Color.fromARGB(48, 0, 0, 0)),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
          useMaterial3: true,
        ),
        home: isLoggedIn
            ? HomePage(username: authStorage.read('username'))
            : const LoginPage());
  }
}
