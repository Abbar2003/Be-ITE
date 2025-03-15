// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:public_testing_app/Bindings.dart';

import 'package:public_testing_app/src/models/Themes.dart';
import 'package:public_testing_app/firebase_options.dart';
import 'package:public_testing_app/App_Routes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';

SharedPreferences? Auth;
SharedPreferences? is_Dark;
SharedPreferences? appData;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  Auth = await SharedPreferences.getInstance();
  is_Dark = await SharedPreferences.getInstance();
  appData = await SharedPreferences.getInstance();

  runApp(
    GetMaterialApp(
      color: is_Dark!.getString('is_dark') == 'true'
          ? Themes.darkColorScheme.background
          : Colors.white,
      initialBinding: Binding(),
      debugShowCheckedModeBanner: false,
      theme: Themes.lightTheme,
      darkTheme: Themes.darkTheme,
      themeMode: is_Dark!.getString('is_dark') == 'true'
          ? ThemeMode.dark
          : ThemeMode.light,
      initialRoute: AppNavigation.getInitRoute,
      getPages: AppNavigation.routes,
    ),
  );
}
