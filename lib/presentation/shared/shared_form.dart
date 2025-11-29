import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

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
    final iconColor = widget.iconColor ?? theme.colorScheme.primary;

    return TextFormField(
      controller: widget.controller,
      obscureText: widget.isPassword ? _obscure : false,
      keyboardType: widget.keyboardType,
      style: TextStyle(color: theme.colorScheme.onSurface),
      decoration: InputDecoration(
        labelText: widget.label,
        labelStyle: widget.labelStyle ?? TextStyle(
          color: theme.colorScheme.onSurface.withOpacity(0.7),
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
          borderSide: BorderSide(color: theme.colorScheme.outline),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          borderSide: BorderSide(color: theme.colorScheme.outline),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          borderSide: BorderSide(color: theme.colorScheme.primary, width: 2),
        ),
        filled: true,
        fillColor: widget.fillColor ?? theme.colorScheme.surface,
        contentPadding: const EdgeInsets.symmetric(
            horizontal: 16, vertical: 18),
      ),
      validator: widget.validator ??
          FormBuilderValidators.compose([
            FormBuilderValidators.required(
                errorText: '${widget.label} is required'),
          ]),
      enabled: widget.enabled,
      textInputAction: widget.textInputAction,
      onFieldSubmitted: widget.onFieldSubmitted,
    );
  }
}
