import 'package:fe_football/theme/theme.dart';
import 'package:fe_football/utils/local_storage/common_shared_preferences.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final String? token = await CommonSharedPreferences.shared
      .load<String>(CommonSharedPreferences.headerTokenKey)
      .then((value) => value.isNotEmpty ? value : null);

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Management Football Club",
      initialRoute: token != null ? Routes.NAVBAR : AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: lightTheme(),
      locale: const Locale('id', 'ID'),
      themeMode: ThemeMode.light,
    ),
  );
}
