import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sintia_system_design/sintia_system_design.dart';

/// Generic reusable text field with consistent styling
///
/// Provides a clean, modern text input with label, hint, and helper text.
/// Supports validation, custom keyboard types, and text formatting.
class SintiaTextField extends StatelessWidget {
  /// Label text displayed above the field
  final String? label;

  /// Label style
  final TextStyle? labelStyle;

  /// Placeholder text shown when field is empty
  final String? hint;

  /// Hint style
  final TextStyle? hintStyle;

  /// Helper text displayed below the field
  final String? helperText;

  /// Helper text style
  final TextStyle? helperTextStyle;

  /// Text field style
  final TextStyle? textFieldStyle;

  /// Text editing controller
  final TextEditingController? controller;

  /// Initial value (used if controller is not provided)
  final String? initialValue;

  /// Callback when text changes
  final void Function(String)? onChanged;

  /// Maximum number of characters allowed
  final int? maxLength;

  /// Keyboard type
  final TextInputType? keyboardType;

  /// Text capitalization mode
  final TextCapitalization textCapitalization;

  /// Input formatters for text processing
  final List<TextInputFormatter>? inputFormatters;

  /// Whether the field is read-only
  final bool readOnly;

  /// Whether the field is enabled
  final bool enabled;

  /// Obscure text (for passwords)
  final bool obscureText;

  /// Maximum number of lines
  final int? maxLines;

  /// Minimum number of lines
  final int? minLines;

  /// Semantic identifier for testing
  final String? semanticIdentifier;

  /// Custom validator function
  final String? Function(String?)? validator;

  /// Suffix icon
  final Widget? suffixIcon;

  /// Prefix icon
  final Widget? prefixIcon;

  /// Auto validate mode
  final AutovalidateMode? autovalidateMode;

  /// Focus node
  final FocusNode? focusNode;

  /// Text input action
  final TextInputAction? textInputAction;

  /// On field submitted callback
  final void Function(String)? onFieldSubmitted;

  //spacing between label, text field and helper text
  final double? spacing;

  /// Border
  final InputBorder? border;

  /// Enabled border
  final InputBorder? enabledBorder;

  /// Focused border
  final InputBorder? focusedBorder;

  /// Error border
  final InputBorder? errorBorder;

  /// Focused error border
  final InputBorder? focusedErrorBorder;

  /// Disabled border
  final InputBorder? disabledBorder;

  /// Content padding
  final EdgeInsetsGeometry? contentPadding;

  /// Enabled fill color
  final Color? enabledFillColor;

  /// Disabled fill color
  final Color? disabledFillColor;

  const SintiaTextField({
    super.key,
    this.label,
    this.labelStyle,
    this.hint,
    this.hintStyle,
    this.helperText,
    this.helperTextStyle,
    this.textFieldStyle,
    this.controller,
    this.initialValue,
    this.onChanged,
    this.maxLength,
    this.keyboardType,
    this.textCapitalization = TextCapitalization.none,
    this.inputFormatters,
    this.readOnly = false,
    this.enabled = true,
    this.obscureText = false,
    this.maxLines = 1,
    this.minLines,
    this.semanticIdentifier,
    this.validator,
    this.suffixIcon,
    this.prefixIcon,
    this.autovalidateMode,
    this.focusNode,
    this.textInputAction,
    this.onFieldSubmitted,
    this.spacing,
    this.border,
    this.enabledBorder,
    this.focusedBorder,
    this.errorBorder,
    this.focusedErrorBorder,
    this.disabledBorder,
    this.contentPadding,
    this.enabledFillColor,
    this.disabledFillColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: spacing ?? SintiaSizes.size1,
      children: [
        // Label
        SintiaText(label ?? '', style: context.textTheme.bodyMedium),
        // Text Field
        Semantics(
          identifier: semanticIdentifier ?? 'sintia_text_field',
          label: label,
          textField: true,
          child: TextFormField(
            controller: controller,
            initialValue: initialValue,
            maxLength: maxLength,
            keyboardType: keyboardType,
            textCapitalization: textCapitalization,
            inputFormatters: inputFormatters,
            readOnly: readOnly,
            enabled: enabled,
            obscureText: obscureText,
            maxLines: maxLines,
            minLines: minLines,
            validator: validator,
            autovalidateMode: autovalidateMode,
            focusNode: focusNode,
            textInputAction: textInputAction,
            onFieldSubmitted: onFieldSubmitted,
            onChanged: onChanged,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: hintStyle ?? context.textTheme.bodyMedium,
              suffixIcon: suffixIcon,
              prefixIcon: prefixIcon,
              border:
                  border ??
                  OutlineInputBorder(
                    borderRadius: BorderRadius.circular(SintiaSizes.radius2),
                    borderSide: BorderSide(
                      color: AppColors.statusDisabled,
                      width: 0.5,
                    ),
                  ),
              enabledBorder:
                  enabledBorder ??
                  OutlineInputBorder(
                    borderRadius: BorderRadius.circular(SintiaSizes.radius2),
                    borderSide: BorderSide(
                      color: AppColors.statusDisabled,
                      width: 0.5,
                    ),
                  ),
              focusedBorder:
                  focusedBorder ??
                  OutlineInputBorder(
                    borderRadius: BorderRadius.circular(SintiaSizes.radius2),
                    borderSide: BorderSide(color: AppColors.statusDisabled),
                  ),
              errorBorder:
                  errorBorder ??
                  OutlineInputBorder(
                    borderRadius: BorderRadius.circular(SintiaSizes.radius2),
                    borderSide: const BorderSide(
                      color: AppColors.statusDanger01,
                      width: 0.5,
                    ),
                  ),
              focusedErrorBorder:
                  focusedErrorBorder ??
                  OutlineInputBorder(
                    borderRadius: BorderRadius.circular(SintiaSizes.radius2),
                    borderSide: const BorderSide(
                      color: AppColors.statusDanger01,
                    ),
                  ),
              disabledBorder:
                  disabledBorder ??
                  OutlineInputBorder(
                    borderRadius: BorderRadius.circular(SintiaSizes.radius2),
                    borderSide: BorderSide(
                      color: AppColors.statusDisabled.withValues(alpha: 0.5),
                      width: 0.5,
                    ),
                  ),
              filled: true,
              fillColor: enabled
                  ? enabledFillColor ?? context.colorScheme.surface
                  : disabledFillColor ??
                        context.colorScheme.surface.withValues(alpha: 0.5),
              contentPadding:
                  contentPadding ??
                  EdgeInsets.symmetric(
                    horizontal: SintiaSizes.size2,
                    vertical: SintiaSizes.size2,
                  ),
              counterText: '',
            ),
            style: textFieldStyle ?? context.textTheme.bodyMedium,
          ),
        ),

        // Helper Text
        if (helperText != null)
          SintiaText(
            helperText!,
            style:
                helperTextStyle ??
                context.textTheme.bodySmall?.copyWith(
                  color: AppColors.statusDanger01,
                ),
          ),
      ],
    );
  }
}

// coverage:ignore-start
@SintiaPreview(name: 'Default', group: 'SintiaTextField')
Widget sintiaTextFieldDefaultPreview() =>
    SintiaTextField(label: 'Nombre', hint: 'Ingrese su nombre');

@SintiaPreview(name: 'Error', group: 'SintiaTextField')
Widget sintiaTextFieldErrorPreview() => SintiaTextField(
  hint: 'Ingrese su nombre',
  helperText: 'El nombre es requerido',
);

@SintiaPreview(name: 'Enabled fill color', group: 'SintiaTextField')
Widget sintiaTextFieldEnabledFillColorPreview() => SintiaTextField(
  label: 'Nombre',
  hint: 'Ingrese su nombre',
  enabledFillColor: AppColors.statusSuccess01,
);

@SintiaPreview(name: 'Disabled fill color', group: 'SintiaTextField')
Widget sintiaTextFieldDisabledFillColorPreview() => SintiaTextField(
  label: 'Nombre',
  hint: 'Ingrese su nombre',
  disabledFillColor: AppColors.statusDisabled,
  enabled: false,
);
// coverage:ignore-end
