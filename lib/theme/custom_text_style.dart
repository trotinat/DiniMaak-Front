import 'package:flutter/material.dart';
import '../core/app_export.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {
  // Body text style
  static get bodyLargeGray600 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.gray600,
      );
  static get bodyLargeLatoPrimary => theme.textTheme.bodyLarge!.lato.copyWith(
        color: theme.colorScheme.primary.withOpacity(1),
      );
  static get bodyLargeff000000 => theme.textTheme.bodyLarge!.copyWith(
        color: Color(0XFF000000),
      );
  static get bodyLargeff7c7c7c => theme.textTheme.bodyLarge!.copyWith(
        color: Color(0XFF7C7C7C),
      );
  static get bodyMediumPrimaryContainer => theme.textTheme.bodyMedium!.copyWith(
        color: theme.colorScheme.primaryContainer,
      );
  static get bodyMediumPrimaryContainer13 =>
      theme.textTheme.bodyMedium!.copyWith(
        color: theme.colorScheme.primaryContainer,
        fontSize: 13.fSize,
      );
  static get bodySmallGray400 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.gray400,
        fontSize: 9.fSize,
      );
  static get bodySmallOrange400 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.orange400,
        fontSize: 8.fSize,
      );
  static get bodySmallPrimaryContainer => theme.textTheme.bodySmall!.copyWith(
        color: theme.colorScheme.primaryContainer,
        fontSize: 12.fSize,
      );
  static get bodySmallWhiteA700 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.whiteA700,
        fontSize: 10.fSize,
      );
  static get bodySmallffff4444 => theme.textTheme.bodySmall!.copyWith(
        color: Color(0XFFFF4444),
        fontSize: 12.fSize,
      );
  // Headline text style
  static get headlineSmallLightblueA700 =>
      theme.textTheme.headlineSmall!.copyWith(
        color: appTheme.lightBlueA700,
        fontSize: 25.fSize,
        fontWeight: FontWeight.w600,
      );
  // Label text style
  static get labelLargePrimaryContainer => theme.textTheme.labelLarge!.copyWith(
        color: theme.colorScheme.primaryContainer,
        fontSize: 13.fSize,
        fontWeight: FontWeight.w600,
      );
  static get labelLargePrimaryContainerBold =>
      theme.textTheme.labelLarge!.copyWith(
        color: theme.colorScheme.primaryContainer,
        fontWeight: FontWeight.w700,
      );
  static get labelLargeRed500 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.red500,
        fontWeight: FontWeight.w700,
      );
  static get labelLargeSemiBold => theme.textTheme.labelLarge!.copyWith(
        fontSize: 13.fSize,
        fontWeight: FontWeight.w600,
      );
  static get labelLargeWhiteA700 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.whiteA700,
        fontWeight: FontWeight.w700,
      );
  static get labelLargeff7c7c7c => theme.textTheme.labelLarge!.copyWith(
        color: Color(0XFF7C7C7C),
        fontSize: 13.fSize,
        fontWeight: FontWeight.w600,
      );
  static get labelMediumTealA400 => theme.textTheme.labelMedium!.copyWith(
        color: appTheme.tealA400,
        fontWeight: FontWeight.w800,
      );
  static get labelMediumWhiteA700 => theme.textTheme.labelMedium!.copyWith(
        color: appTheme.whiteA700,
      );
  static get labelSmallWhiteA700 => theme.textTheme.labelSmall!.copyWith(
        color: appTheme.whiteA700,
        fontSize: 9.fSize,
        fontWeight: FontWeight.w700,
      );
  // Title text style
  static get titleMediumExtraBold => theme.textTheme.titleMedium!.copyWith(
        fontWeight: FontWeight.w800,
      );
  static get titleSmallGray600 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.gray600,
      );
  static get titleSmallSemiBold => theme.textTheme.titleSmall!.copyWith(
        fontSize: 14.fSize,
        fontWeight: FontWeight.w600,
      );
  static get titleSmallWhiteA700 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.whiteA700,
        fontSize: 14.fSize,
      );
  static get titleSmallWhiteA700ExtraBold =>
      theme.textTheme.titleSmall!.copyWith(
        color: appTheme.whiteA700,
        fontSize: 14.fSize,
        fontWeight: FontWeight.w800,
      );
  static get titleSmallWhiteA700ExtraBold_1 =>
      theme.textTheme.titleSmall!.copyWith(
        color: appTheme.whiteA700,
        fontWeight: FontWeight.w800,
      );
}

extension on TextStyle {
  TextStyle get lato {
    return copyWith(
      fontFamily: 'Lato',
    );
  }

  TextStyle get nunito {
    return copyWith(
      fontFamily: 'Nunito',
    );
  }
}
