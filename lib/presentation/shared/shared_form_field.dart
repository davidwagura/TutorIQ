import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:tutoriq/presentation/assets/colors.dart' as colors;

class SharedFormField extends StatefulWidget {
  const SharedFormField({
    required this.controller,
    required this.label,
    super.key,
    this.prefixIcon,
    this.suffixIcon,
    this.isPassword = false,
    this.enabled = true,
    this.fillColor,
    this.iconColor,
    this.textColor,
    this.textInputAction = TextInputAction.next,
    this.onFieldSubmitted,
    this.validator,
    this.keyboardType,
    this.labelStyle,
    this.borderRadius = 12,
  });

  final TextEditingController controller;
  final String label;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final bool isPassword;
  final bool enabled;
  final Color? fillColor;
  final Color? iconColor;
  final Color? textColor;
  final TextInputAction textInputAction;
  final void Function(String)? onFieldSubmitted;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final TextStyle? labelStyle;
  final double borderRadius;

  @override
  State<SharedFormField> createState() => _SharedFormFieldState();
}

class _SharedFormFieldState extends State<SharedFormField> {
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final iconColor = widget.iconColor ?? colors.AppColors.primaryPurple;
    final textColor = widget.textColor ?? theme.colorScheme.onSurface;
    final fillColor = widget.fillColor ?? colors.AppColors.lightGrey;

    return TextFormField(
      controller: widget.controller,
      obscureText: widget.isPassword ? _obscure : false,
      keyboardType: widget.keyboardType,
      style: TextStyle(color: textColor),
      decoration: InputDecoration(
        labelText: widget.label,
        labelStyle: widget.labelStyle ?? TextStyle(
          color: colors.AppColors.darkGrey,
          fontSize: 16,
        ),
        floatingLabelStyle: TextStyle(
          color: colors.AppColors.primaryPurple,
          fontWeight: FontWeight.w600,
        ),
        prefixIcon: widget.prefixIcon != null
            ? Icon(widget.prefixIcon, color: iconColor)
            : null,
        suffixIcon: widget.isPassword
            ? IconButton(
          icon: Icon(
            _obscure ? Icons.visibility_off : Icons.visibility,
            color: iconColor.withOpacity(0.6),
          ),
          onPressed: () => setState(() => _obscure = !_obscure),
        )
            : (widget.suffixIcon != null
            ? Icon(widget.suffixIcon, color: iconColor)
            : null),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          borderSide: BorderSide(color: colors.AppColors.mediumGrey),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          borderSide: BorderSide(color: colors.AppColors.mediumGrey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          borderSide: const BorderSide(color: colors.AppColors.primaryPurple, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          borderSide: const BorderSide(color: colors.AppColors.errorRed),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          borderSide: const BorderSide(color: colors.AppColors.errorRed),
        ),
        errorStyle: const TextStyle(color: colors.AppColors.errorRed),
        filled: true,
        fillColor: fillColor,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
      ),
      validator: widget.validator,
      enabled: widget.enabled,
      textInputAction: widget.textInputAction,
      onFieldSubmitted: widget.onFieldSubmitted,
    );
  }
}
