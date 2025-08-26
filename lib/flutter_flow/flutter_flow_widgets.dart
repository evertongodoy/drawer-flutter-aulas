import 'package:flutter/material.dart';

class FFButtonOptions {
  final double width;
  final double height;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? iconPadding;
  final Color color;
  final TextStyle textStyle;
  final double elevation;
  final BorderSide borderSide;
  final BorderRadiusGeometry borderRadius;

  const FFButtonOptions({
    this.width = double.infinity,
    this.height = 48,
    this.padding,
    this.iconPadding,
    this.color = const Color(0xFF4B39EF),
    this.textStyle = const TextStyle(
      color: Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.w600,
    ),
    this.elevation = 0,
    this.borderSide = BorderSide.none,
    this.borderRadius = const BorderRadius.all(Radius.circular(12)),
  });
}

class FFButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final FFButtonOptions options;
  final Widget? icon; // opcional, se quiser evoluir

  const FFButtonWidget({
    super.key,
    required this.text,
    required this.onPressed,
    this.options = const FFButtonOptions(),
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final child = Text(text, style: options.textStyle);

    return SizedBox(
      width: options.width,
      height: options.height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: options.color,
          elevation: options.elevation,
          padding: options.padding,
          shape: RoundedRectangleBorder(
            borderRadius: options.borderRadius,
            side: options.borderSide,
          ),
        ),
        child: icon == null
            ? child
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: options.iconPadding ?? EdgeInsets.zero,
                    child: icon!,
                  ),
                  const SizedBox(width: 8),
                  child,
                ],
              ),
      ),
    );
  }
}
