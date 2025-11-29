import 'package:flutter/material.dart';
import 'package:tutoriq/presentation/assets/colors.dart' as colors;

class SharedButton extends StatelessWidget {
  const SharedButton({
    required this.onPressed,
    required this.text,
    super.key,
    this.isLoading = false,
    this.enabled = true,
    this.height = 56,
    this.borderRadius = 12,
    this.backgroundColor,
    this.foregroundColor,
    this.textStyle,
    this.disabledColor,
  });

  final VoidCallback? onPressed;
  final String text;
  final bool isLoading;
  final bool enabled;
  final double height;
  final double borderRadius;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final TextStyle? textStyle;
  final Color? disabledColor;

  @override
  Widget build(BuildContext context) {
    final effectiveBackgroundColor = backgroundColor ?? colors.AppColors.primaryPurple;
    final effectiveForegroundColor = foregroundColor ?? colors.AppColors.white;
    final effectiveDisabledColor = disabledColor ?? colors.AppColors.mediumGrey;

    return SizedBox(
      width: double.infinity,
      height: height,
      child: ElevatedButton(
        onPressed: (enabled && !isLoading) ? onPressed : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: enabled ? effectiveBackgroundColor : effectiveDisabledColor,
          disabledBackgroundColor: effectiveDisabledColor,
          foregroundColor: effectiveForegroundColor,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          padding: const EdgeInsets.symmetric(vertical: 16),
        ),
        child: isLoading
            ? const SizedBox(
          width: 20,
          height: 20,
          child: CircularProgressIndicator(
            strokeWidth: 2,
            valueColor: AlwaysStoppedAnimation<Color>(colors.AppColors.white),
          ),
        )
            : Text(
          text,
          style: textStyle ??
              const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
        ),
      ),
    );
  }
}
