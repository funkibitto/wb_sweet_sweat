import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_colors.dart';
import 'extension/custom_theme_extension.dart';

class AppThemes {
  static ThemeData get darkTheme {
    final ThemeData base = ThemeData.dark();
    return base.copyWith(
      brightness: Brightness.dark,
      useMaterial3: true,
      colorScheme: const ColorScheme.dark(background: AppColors.backgroundDark),
      scaffoldBackgroundColor: AppColors.backgroundDark,
      extensions: [CustomThemeExtension.darkMode],
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.greyBackground,
        titleTextStyle: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: AppColors.greyDark,
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
        ),
        iconTheme: IconThemeData(
          color: AppColors.greyDark,
        ),
      ),
      tabBarTheme: const TabBarTheme(
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide(
            color: AppColors.greenDark,
            width: 2,
          ),
        ),
        unselectedLabelColor: AppColors.greyDark,
        labelColor: AppColors.greenDark,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.greenDark,
          foregroundColor: AppColors.backgroundDark,
          splashFactory: NoSplash.splashFactory,
          elevation: 0,
          shadowColor: Colors.transparent,
        ),
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: AppColors.greyBackground,
        modalBackgroundColor: AppColors.greyBackground,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
      ),
      dialogBackgroundColor: AppColors.greyBackground,
      dialogTheme: DialogTheme(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.greenDark,
        foregroundColor: Colors.white,
      ),
      listTileTheme: const ListTileThemeData(
        iconColor: AppColors.greyDark,
        tileColor: AppColors.backgroundDark,
      ),
      switchTheme: const SwitchThemeData(
        thumbColor: MaterialStatePropertyAll(AppColors.greyDark),
        trackColor: MaterialStatePropertyAll(Color(0xFF344047)),
      ),
    );
  }

  static ThemeData get lightTheme {
    final ThemeData base = ThemeData.light();
    return base.copyWith(
      brightness: Brightness.light,
      useMaterial3: true,
      colorScheme:
          const ColorScheme.light(background: AppColors.backgroundLight),
      scaffoldBackgroundColor: AppColors.backgroundLight,
      extensions: [CustomThemeExtension.lightMode],
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.greenLight,
        titleTextStyle: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      tabBarTheme: const TabBarTheme(
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide(
            color: Colors.white,
            width: 2,
          ),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.greenLight,
          foregroundColor: AppColors.backgroundLight,
          splashFactory: NoSplash.splashFactory,
          elevation: 0,
          shadowColor: Colors.transparent,
        ),
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: AppColors.backgroundLight,
        modalBackgroundColor: AppColors.backgroundLight,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
      ),
      dialogBackgroundColor: AppColors.backgroundLight,
      dialogTheme: DialogTheme(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.greenDark,
        foregroundColor: Colors.white,
      ),
      listTileTheme: const ListTileThemeData(
        iconColor: AppColors.greyDark,
        tileColor: AppColors.backgroundLight,
      ),
      switchTheme: const SwitchThemeData(
        thumbColor: MaterialStatePropertyAll(Color(0xFF83939C)),
        trackColor: MaterialStatePropertyAll(Color(0xFFDADFE2)),
      ),
    );
  }
}
