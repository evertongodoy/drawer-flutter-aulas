import 'package:flutter/material.dart';

class FlutterFlowTheme {
  final BuildContext context;
  FlutterFlowTheme._(this.context);

  static FlutterFlowTheme of(BuildContext context) =>
      FlutterFlowTheme._(context);

  // Cores usadas no seu SplashWidget
  Color get primaryBackground =>
      Theme.of(context).scaffoldBackgroundColor; // branco no tema claro
  Color get info => Colors.white;

  // Estilos usados no seu SplashWidget
  TextStyle get displaySmall =>
      Theme.of(context).textTheme.headlineSmall ??
      const TextStyle(fontSize: 32, fontWeight: FontWeight.w600);

  TextStyle get titleSmall =>
      Theme.of(context).textTheme.titleSmall ??
      const TextStyle(fontSize: 14, fontWeight: FontWeight.w600);

  TextStyle get bodySmall =>
      Theme.of(context).textTheme.bodySmall ??
      const TextStyle(fontSize: 12, fontWeight: FontWeight.w400);

  TextStyle get bodyMedium =>
      Theme.of(context).textTheme.bodyMedium ??
      const TextStyle(fontSize: 14, fontWeight: FontWeight.w400);
}

/// Extensão para imitar o `.override(...)` gerado pelo FlutterFlow.
/// Aceita um `font` vindo de GoogleFonts (que é um TextStyle)
extension FlutterFlowTextStyleExtensions on TextStyle {
  TextStyle override({
    TextStyle? font, // ex.: GoogleFonts.interTight(...)
    Color? color,
    double? fontSize,
    double? letterSpacing,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    TextDecoration? decoration,
    double? height,
  }) {
    TextStyle base = copyWith(
      color: color ?? this.color,
      fontSize: fontSize ?? this.fontSize,
      letterSpacing: letterSpacing ?? this.letterSpacing,
      fontWeight: fontWeight ?? this.fontWeight,
      fontStyle: fontStyle ?? this.fontStyle,
      decoration: decoration ?? this.decoration,
      height: height ?? this.height,
    );
    // Se vier um TextStyle de GoogleFonts, fazemos um merge
    if (font != null) {
      base = font.merge(base);
    }
    return base;
  }
}
