import 'package:flutter/material.dart';

class AppColor {
  static const primaryText = Color(0xFF001F3F);
  static const secondaryText = Color(0xFF66798C);

  /// UI
  static const divider = Color(0xFFF5F6F8);
  static const lightBorder = Color(0xFFF2F3F7);
  static const darkBorder = Color(0xFF98A3B3);
  static const snackbarGreen = Color(0xFF18B23C);
  static const snackbarRed = Color(0xFFDE002C);

  /// Third party
  static const wingmall = Color(0xFFFFCD00);
  static const wingmallSecondary = Color(0xFF003595);
  static const cellcard = Color(0xFFF9A01B);
  static const smart = Color(0xFF01963A);
  static const metfone = Color(0xFFE33521);
  static const seatel = Color(0xFFEC008C);

  /// App Colors
  static const white = Colors.white;
  static const red = Color(0xFFE73E3E);
  static const lighGreen = Color(0xFF98C20A);
  static const darkGreen = Color(0xFF6FC13C);
  static const blue = Color(0xFF0077FF);
  static const blueTextColor = Color(0xFF007BFB);
  static const cyanlightColor = Color(0xff4DDBD9);
  static const black = Color(0xFF000000);
  static const coldBlack = Color(0xFF00255B);
  static const grey = Color(0xFFD8DBE5);
  static const lightGrey = Color(0xFF626F86);
  static const lighterGrey = Color(0xFF6E7C95);
  static const lightGreyText = Color(0xFF6D7E9D);
  static const brightGray = Color(0xFFEBEDEF);
  static const darkOrange = Color(0xFFF0A106);
  static const lighOrange = Color(0xFFFFEF99);

  /// Revamp UI
  static const primary = Color(0xFF7BBE45);
  static const midNightBlue = Color(0xFF0B1E2B);
  static const background = Color(0xFFF3F5F9);
  static const lightNightBlue = Color(0xFF5D6B82);
  static const darkBlue = Color(0xFF041628);
}

/// Naming Conventions:
/// - large: 20
/// - medium: 16
/// - normal: 14
/// - small: 12
/// Format: {fontsize}{color(optional)}{weight}
class AppTextStyle {
  // Primary Text
  static const largePrimaryTextSemiBold = TextStyle(
    color: AppColor.primaryText,
    fontSize: 20,
    fontWeight: AppStyle._semiBold,
  );
  static const largePrimaryTextMedium = TextStyle(
    color: AppColor.primaryText,
    fontSize: 20,
    fontWeight: AppStyle._medium,
  );
  static const mediumPrimaryTextSemiBold = TextStyle(
    color: AppColor.primaryText,
    fontSize: 16,
    fontWeight: AppStyle._semiBold,
  );
  static const mediumPrimaryTextMedium = TextStyle(
    color: AppColor.primaryText,
    fontSize: 16,
    fontWeight: AppStyle._medium,
  );
  static const normalPirmaryTextSemiBold = TextStyle(
    color: AppColor.primaryText,
    fontSize: 14,
    fontWeight: AppStyle._semiBold,
  );
  static const normalPrimaryTextMedium = TextStyle(
    color: AppColor.primaryText,
    fontSize: 14,
    fontWeight: AppStyle._medium,
  );
  static const normalPrimaryTextRegular = TextStyle(
    color: AppColor.primaryText,
    fontSize: 14,
    fontWeight: AppStyle._regular,
  );
  static const smallPrimaryTextMedium = TextStyle(
    color: AppColor.primaryText,
    fontSize: 12,
    fontWeight: AppStyle._medium,
  );

  // Secondary Text
  static const normalSecondaryTextSemiBold = TextStyle(
    color: AppColor.secondaryText,
    fontSize: 14,
    fontWeight: AppStyle._semiBold,
  );
  static const normalSecondaryTextRegular = TextStyle(
    color: AppColor.secondaryText,
    fontSize: 14,
    fontWeight: AppStyle._regular,
  );

  // Wingmall Secondary
  static const normalWingmallSecondarySemiBold = TextStyle(
    color: AppColor.wingmallSecondary,
    fontSize: 14,
    fontWeight: AppStyle._semiBold,
  );

  // Dark Blue
  static const largeDarkBlueSemiBold = TextStyle(
    color: AppColor.darkBlue,
    fontSize: 20,
    fontWeight: AppStyle._semiBold,
  );
  static const mediumDarkBlueBold = TextStyle(
    color: AppColor.darkBlue,
    fontSize: 16,
    fontWeight: AppStyle._bold,
  );
  static const mediumDarkBlueSemiBold = TextStyle(
    color: AppColor.darkBlue,
    fontSize: 16,
    fontWeight: AppStyle._semiBold,
  );
  static const mediumDarkBlueRegular = TextStyle(
    color: AppColor.darkBlue,
    fontSize: 16,
    fontWeight: AppStyle._regular,
  );
  static const normalDarkBlueSemiBold = TextStyle(
    color: AppColor.darkBlue,
    fontSize: 14,
    fontWeight: AppStyle._semiBold,
  );
  static const normalDarkBlueRegular = TextStyle(
    color: AppColor.darkBlue,
    fontSize: 14,
    fontWeight: AppStyle._regular,
  );
  static const smallDarkBlueSemiBold = TextStyle(
    color: AppColor.darkBlue,
    fontSize: 12,
    fontWeight: AppStyle._semiBold,
  );
  static const smallDarkBlueMedium = TextStyle(
    color: AppColor.darkBlue,
    fontSize: 12,
    fontWeight: AppStyle._medium,
  );
  static const smallDarkBlueRegular = TextStyle(
    color: AppColor.darkBlue,
    fontSize: 12,
    fontWeight: AppStyle._regular,
  );

  // White
  static const largeWhiteBold = TextStyle(
    color: AppColor.white,
    fontSize: 20,
    fontWeight: AppStyle._bold,
  );
  static const mediumWhiteBold = TextStyle(
    color: AppColor.white,
    fontSize: 16,
    fontWeight: AppStyle._bold,
  );
  static const mediumWhiteSemiBold = TextStyle(
    color: AppColor.white,
    fontSize: 16,
    fontWeight: AppStyle._semiBold,
  );
  static const mediumWhiteMedium = TextStyle(
    color: AppColor.white,
    fontSize: 16,
    fontWeight: AppStyle._medium,
  );
  static const normalWhiteSemiBold = TextStyle(
    color: AppColor.white,
    fontSize: 14,
    fontWeight: AppStyle._semiBold,
  );
  static const normalWhiteRegular = TextStyle(
    color: AppColor.white,
    fontSize: 14,
    fontWeight: AppStyle._regular,
  );
  static const smallWhiteBold = TextStyle(
    color: AppColor.white,
    fontSize: 12,
    fontWeight: AppStyle._bold,
  );
  static const smallWhiteSemiBold = TextStyle(
    color: AppColor.white,
    fontSize: 12,
    fontWeight: AppStyle._semiBold,
  );
  static const smallWhiteRegular = TextStyle(
    color: AppColor.white,
    fontSize: 12,
    fontWeight: AppStyle._regular,
  );

  // Cold Black
  static const normalColdBlackSemiBold = TextStyle(
    color: AppColor.coldBlack,
    fontSize: 14,
    fontWeight: AppStyle._semiBold,
  );

  // Blue
  static const mediumBlueSemiBold = TextStyle(
    color: AppColor.blue,
    fontSize: 16,
    fontWeight: AppStyle._semiBold,
  );
  static const normalBlueSemiBold = TextStyle(
    color: AppColor.blue,
    fontSize: 14,
    fontWeight: AppStyle._semiBold,
  );

  // Light Grey Text
  static const largeLightGreyTextSemiBold = TextStyle(
    color: AppColor.lightGreyText,
    fontSize: 20,
    fontWeight: AppStyle._semiBold,
  );
  static const normalLightGreyTextMedium = TextStyle(
    color: AppColor.lightGreyText,
    fontSize: 14,
    fontWeight: AppStyle._medium,
  );
  static const normalLightGreyTextRegular = TextStyle(
    color: AppColor.lightGreyText,
    fontSize: 14,
    fontWeight: AppStyle._regular,
  );
  static const smallLightGreyTextRegular = TextStyle(
    color: AppColor.lightGreyText,
    fontSize: 12,
    fontWeight: AppStyle._regular,
  );

  // Lighter Grey
  static const mediumLighterGreyMedium = TextStyle(
    color: AppColor.lighterGrey,
    fontSize: 16,
    fontWeight: AppStyle._medium,
  );
  static const smallLighterGreyRegular = TextStyle(
    color: AppColor.lighterGrey,
    fontSize: 12,
    fontWeight: AppStyle._regular,
  );

  // Light Grey
  static const mediumLightGreyRegular = TextStyle(
    color: AppColor.lightGrey,
    fontSize: 16,
    fontWeight: AppStyle._regular,
  );
  static const normalLightGreySemiBold = TextStyle(
    color: AppColor.lightGrey,
    fontSize: 14,
    fontWeight: AppStyle._semiBold,
  );
  static const normalLightGreyRegular = TextStyle(
    color: AppColor.lightGrey,
    fontSize: 14,
    fontWeight: AppStyle._regular,
  );

  // Red
  static const normalRedSemiBold = TextStyle(
    color: AppColor.red,
    fontSize: 14,
    fontWeight: AppStyle._semiBold,
  );
  static const smallRedSemiBold = TextStyle(
    color: AppColor.red,
    fontSize: 12,
    fontWeight: AppStyle._semiBold,
  );
  static const smallRedRegular = TextStyle(
    color: AppColor.red,
    fontSize: 12,
    fontWeight: AppStyle._regular,
  );

  // Mid Night Blue
  static const largeMidNightBlueBold = TextStyle(
    color: AppColor.midNightBlue,
    fontSize: 20,
    fontWeight: AppStyle._bold,
  );
  static const largeMidNightBlueSemiBold = TextStyle(
    color: AppColor.midNightBlue,
    fontSize: 20,
    fontWeight: AppStyle._semiBold,
  );
  static const mediumMidNightBlueBold = TextStyle(
    color: AppColor.midNightBlue,
    fontSize: 16,
    fontWeight: AppStyle._bold,
  );
  static const mediumMidNightBlueSemiBold = TextStyle(
    color: AppColor.midNightBlue,
    fontSize: 16,
    fontWeight: AppStyle._semiBold,
  );
  static const mediumMidNightBlueRegular = TextStyle(
    color: AppColor.midNightBlue,
    fontSize: 16,
    fontWeight: AppStyle._regular,
  );
  static const normalMidNightBlueBold = TextStyle(
    color: AppColor.midNightBlue,
    fontSize: 14,
    fontWeight: AppStyle._bold,
  );
  static const normalMidNightBlueSemiBold = TextStyle(
    color: AppColor.midNightBlue,
    fontSize: 14,
    fontWeight: AppStyle._semiBold,
  );
  static const normalMidNightBlueRegular = TextStyle(
    color: AppColor.midNightBlue,
    fontSize: 14,
    fontWeight: AppStyle._regular,
  );
  static const smallMidNightBlueRegular = TextStyle(
    color: AppColor.midNightBlue,
    fontSize: 12,
    fontWeight: AppStyle._regular,
  );

  // Primary
  static const normalPrimarySemiBold = TextStyle(
    color: AppColor.primary,
    fontSize: 14,
    fontWeight: AppStyle._semiBold,
  );
  static const normalPrimaryRegular = TextStyle(
    color: AppColor.primary,
    fontSize: 14,
    fontWeight: AppStyle._regular,
  );

  // Light Night Blue
  static const normalLightNightBlueRegular = TextStyle(
    color: AppColor.lightNightBlue,
    fontSize: 14,
    fontWeight: AppStyle._regular,
  );
}

class AppStyle {
  AppStyle._();

  static ThemeData themeData() {
    String? fontFamily = 'Inter';

    return ThemeData(
      primaryColor: AppColor.primary,
      fontFamily: fontFamily,
      useMaterial3: false,
      scaffoldBackgroundColor: AppColor.divider,
      unselectedWidgetColor: const Color(0xFFDFE4E9),
      inputDecorationTheme: const InputDecorationTheme(
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        contentPadding: EdgeInsets.symmetric(horizontal: 14),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColor.background,
        elevation: 0,
        foregroundColor: AppColor.primaryText,
        titleTextStyle: TextStyle(
          fontWeight: _semiBold,
          fontSize: 16.0,
          color: AppColor.midNightBlue,
        ),
      ),
      textTheme: _textTheme,
      canvasColor: Colors.transparent,
    );
  }

  static const TextTheme _textTheme = TextTheme(
    displayLarge: TextStyle(
      fontWeight: _regular,
      fontSize: 96.0,
      color: AppColor.primaryText,
    ),
    displayMedium: TextStyle(
      fontWeight: _regular,
      fontSize: 60.0,
      color: AppColor.primaryText,
    ),
    displaySmall: TextStyle(
      fontWeight: _regular,
      fontSize: 48.0,
      color: AppColor.primaryText,
    ),
    headlineMedium: TextStyle(
      fontWeight: _regular,
      fontSize: 34.0,
      color: AppColor.primaryText,
    ),
    headlineSmall: TextStyle(
      fontWeight: _regular,
      fontSize: 24.0,
      color: AppColor.primaryText,
    ),
    titleLarge: TextStyle(
      fontWeight: _medium,
      fontSize: 18.0,
      color: AppColor.primaryText,
    ),
    titleMedium: TextStyle(
      fontWeight: _regular,
      fontSize: 16.0,
      color: AppColor.primaryText,
    ),
    titleSmall: TextStyle(
      fontWeight: _medium,
      fontSize: 14.0,
      color: AppColor.primaryText,
    ),
    bodyLarge: TextStyle(
      fontWeight: _regular,
      fontSize: 14.0,
      color: AppColor.primaryText,
    ),
    bodyMedium: TextStyle(
      fontWeight: _regular,
      fontSize: 12.0,
      color: AppColor.primaryText,
    ),
    labelLarge: TextStyle(
      fontWeight: _semiBold,
      fontSize: 14.0,
      color: AppColor.primaryText,
    ),
    bodySmall: TextStyle(
      fontWeight: _regular,
      fontSize: 16.0,
      color: AppColor.primaryText,
    ),
    labelSmall: TextStyle(
      fontWeight: _regular,
      fontSize: 10.0,
      color: AppColor.primaryText,
    ),
  );

  static const _regular = FontWeight.w400;
  static const _medium = FontWeight.w500;
  static const _semiBold = FontWeight.w600;
  static const _bold = FontWeight.w700;
}
