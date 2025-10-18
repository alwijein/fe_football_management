part of 'theme.dart';

ThemeData lightTheme() {
  return ThemeData(
    useMaterial3: true,
    primaryColor: ColorSchemaCollections.primary.primary,
    colorScheme: ColorScheme.fromSeed(
      seedColor: ColorSchemaCollections.primary.primary,
    ),
    scaffoldBackgroundColor: ColorSchemaCollections.primary.scaffold,
    appBarTheme: AppBarTheme(
      toolbarHeight: 70,
      iconTheme: iconThemeDataLight(),
      backgroundColor: ColorSchemaCollections.primary.scaffold,
      titleTextStyle: TypographyCollections.primaryTextStyle.copyWith(
        fontSize: 18,
      ),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor:
            ColorSchemaCollections.primary.white, // bikin status bar sama warna
        statusBarIconBrightness: Brightness.dark, // ikon putih
      ),
      elevation: 0,
    ),
  );
}

IconThemeData iconThemeDataLight() {
  return IconThemeData(color: ColorSchemaCollections.primary.primary);
}
