import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opex/routes/routes.dart';
import 'package:opex/utils/app_routes.dart';
import 'themes/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Socket',
      debugShowCheckedModeBanner: false,
      getPages: routes(),
      initialRoute: AppRoutes.entry,
      theme: AppTheme().lightTheme,
      darkTheme: AppTheme().darkTheme,
    );
  }
}
