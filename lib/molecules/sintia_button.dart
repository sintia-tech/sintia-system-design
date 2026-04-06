import 'package:flutter/material.dart';
import 'package:sintia_system_design/sintia_system_design.dart';

enum SintiaButtonVariant { primary, secondary, destructive, text }

enum SintiaButtonSize { small, medium, large }

class _ButtonStyle {
  final Color background;
  final Color foreground;
  final Color? border;

  const _ButtonStyle({
    required this.background,
    required this.foreground,
    this.border,
  });

  factory _ButtonStyle.from(BuildContext context, SintiaButtonVariant variant) {
    final primary = context.primaryColor;
    return switch (variant) {
      SintiaButtonVariant.primary => _ButtonStyle(
        background: primary,
        foreground: context.onPrimaryColor,
      ),
      SintiaButtonVariant.secondary => _ButtonStyle(
        background: Colors.transparent,
        foreground: primary,
        border: AppColors.scale02,
      ),
      SintiaButtonVariant.destructive => _ButtonStyle(
        background: Colors.transparent,
        foreground: AppColors.statusDanger01,
        border: AppColors.statusDanger01,
      ),
      SintiaButtonVariant.text => _ButtonStyle(
        background: Colors.transparent,
        foreground: primary,
      ),
    };
  }
}

class _SizeConfig {
  final double height;
  final EdgeInsetsGeometry padding;
  final double iconSize;
  final double spinnerSize;
  final double spacing;
  final TextStyle? Function(BuildContext) textStyle;

  const _SizeConfig({
    required this.height,
    required this.padding,
    required this.iconSize,
    required this.spinnerSize,
    required this.spacing,
    required this.textStyle,
  });

  factory _SizeConfig.from(SintiaButtonSize size) {
    return switch (size) {
      SintiaButtonSize.small => _SizeConfig(
        height: 36,
        padding: const EdgeInsets.symmetric(horizontal: SintiaSizes.size1),
        iconSize: 14,
        spinnerSize: 14,
        spacing: 6,
        textStyle: (ctx) =>
            ctx.textTheme.labelMedium?.copyWith(fontWeight: FontWeight.w600),
      ),
      SintiaButtonSize.medium => _SizeConfig(
        height: 44,
        padding: const EdgeInsets.symmetric(horizontal: SintiaSizes.size2),
        iconSize: 16,
        spinnerSize: 16,
        spacing: SintiaSizes.size1,
        textStyle: (ctx) =>
            ctx.textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w600),
      ),
      SintiaButtonSize.large => _SizeConfig(
        height: 52,
        padding: const EdgeInsets.symmetric(horizontal: SintiaSizes.size2),
        iconSize: SintiaSizes.size2,
        spinnerSize: SintiaSizes.size2,
        spacing: SintiaSizes.size1,
        textStyle: (ctx) =>
            ctx.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600),
      ),
    };
  }
}

class _ButtonContent extends StatelessWidget {
  final String label;
  final Color color;
  final _SizeConfig config;
  final Widget? leftIcon;
  final Widget? rightIcon;
  final Widget? topIcon;
  final Widget? bottomIcon;

  const _ButtonContent({
    required this.label,
    required this.color,
    required this.config,
    this.leftIcon,
    this.rightIcon,
    this.topIcon,
    this.bottomIcon,
  });

  @override
  Widget build(BuildContext context) {
    final labelWidget = Flexible(
      child: SintiaText(
        label,
        textAlign: TextAlign.center,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: config.textStyle(context)?.copyWith(color: color),
      ),
    );

    if (topIcon != null || bottomIcon != null) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (topIcon != null) ...[
            topIcon!,
            SizedBox(height: config.spacing / 2),
          ],
          labelWidget,
          if (bottomIcon != null) ...[
            SizedBox(height: config.spacing / 2),
            bottomIcon!,
          ],
        ],
      );
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (leftIcon != null) ...[leftIcon!, SizedBox(width: config.spacing)],
        labelWidget,
        if (rightIcon != null) ...[SizedBox(width: config.spacing), rightIcon!],
      ],
    );
  }
}

class _ButtonLoading extends StatelessWidget {
  final String? label;
  final Color color;
  final _SizeConfig config;

  const _ButtonLoading({required this.color, required this.config, this.label});

  @override
  Widget build(BuildContext context) {
    final spinner = SizedBox(
      width: config.spinnerSize,
      height: config.spinnerSize,
      child: CircularProgressIndicator(
        strokeWidth: 2,
        valueColor: AlwaysStoppedAnimation<Color>(color),
      ),
    );

    if (label == null || label!.isEmpty) return spinner;

    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        spinner,
        SizedBox(width: config.spacing),
        Flexible(
          child: SintiaText(
            label!,
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: config.textStyle(context)?.copyWith(color: color),
          ),
        ),
      ],
    );
  }
}

class SintiaButton extends StatefulWidget {
  final Future<void> Function()? onPressed;
  final String label;
  final String? loadingLabel;
  final SintiaButtonVariant variant;
  final SintiaButtonSize size;
  final double? desktopWidth;
  final Color? backgroundColor;
  final Color? textColor;
  final Widget? leftIcon;
  final Widget? rightIcon;
  final Widget? topIcon;
  final Widget? bottomIcon;
  final Color? borderColor;
  final BorderRadius? borderRadius;
  final String? semanticId;
  final bool enabled;

  const SintiaButton({
    super.key,
    required this.onPressed,
    required this.label,
    this.loadingLabel,
    this.variant = SintiaButtonVariant.primary,
    this.size = SintiaButtonSize.medium,
    this.desktopWidth,
    this.backgroundColor,
    this.textColor,
    this.leftIcon,
    this.rightIcon,
    this.topIcon,
    this.bottomIcon,
    this.borderColor,
    this.borderRadius,
    this.semanticId,
    this.enabled = true,
  });

  @override
  State<SintiaButton> createState() => _SintiaButtonState();
}

class _SintiaButtonState extends State<SintiaButton> {
  bool _isLoading = false;

  bool get _isDisabled => !widget.enabled || widget.onPressed == null;

  Future<void> _onTap() async {
    if (_isLoading) return;
    setState(() => _isLoading = true);
    try {
      await widget.onPressed!();
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final config = _SizeConfig.from(widget.size);
    final style = _ButtonStyle.from(context, widget.variant);

    final bgColor = widget.backgroundColor ?? style.background;
    final fgColor = widget.textColor ?? style.foreground;
    final bdColor = widget.borderColor ?? style.border;
    final radius =
        widget.borderRadius ?? BorderRadius.circular(SintiaSizes.radius1);
    final isMobile =
        MediaQuery.sizeOf(context).width < SintiaBreakpoints.mobile;

    return Semantics(
      identifier: widget.semanticId ?? 'sintia_button_${widget.variant.name}',
      button: true,
      enabled: !_isDisabled,
      child: SizedBox(
        width: isMobile ? double.infinity : widget.desktopWidth,
        child: AbsorbPointer(
          absorbing: _isLoading,
          child: TextButton(
            onPressed: _isDisabled ? null : _onTap,
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.resolveWith((states) {
                if (states.contains(WidgetState.disabled)) {
                  return AppColors.statusDisabled;
                }
                return bgColor;
              }),
              foregroundColor: WidgetStateProperty.resolveWith((states) {
                if (states.contains(WidgetState.disabled)) return Colors.white;
                return fgColor;
              }),
              overlayColor: WidgetStateProperty.all(
                fgColor.withValues(alpha: 0.08),
              ),
              elevation: WidgetStateProperty.all(0),
              padding: WidgetStateProperty.all(config.padding),
              minimumSize: WidgetStateProperty.all(Size(0, config.height)),
              shape: WidgetStateProperty.all(
                RoundedRectangleBorder(borderRadius: radius),
              ),
              side: bdColor != null
                  ? WidgetStateProperty.resolveWith(
                      (states) => BorderSide(
                        color: states.contains(WidgetState.disabled)
                            ? AppColors.statusDisabled
                            : bdColor,
                      ),
                    )
                  : null,
            ),
            child: _isLoading
                ? _ButtonLoading(
                    color: fgColor,
                    config: config,
                    label: widget.loadingLabel,
                  )
                : _ButtonContent(
                    label: widget.label,
                    color: fgColor,
                    config: config,
                    leftIcon: widget.leftIcon,
                    rightIcon: widget.rightIcon,
                    topIcon: widget.topIcon,
                    bottomIcon: widget.bottomIcon,
                  ),
          ),
        ),
      ),
    );
  }
}

// coverage:ignore-start
@SintiaPreview(name: 'Primary', group: 'SintiaButton')
Widget sintiaButtonPrimaryPreview() =>
    SintiaButton(onPressed: () async {}, label: 'Primary');

@SintiaPreview(name: 'Secondary', group: 'SintiaButton')
Widget sintiaButtonSecondaryPreview() => SintiaButton(
  onPressed: () async {},
  label: 'Secondary',
  variant: SintiaButtonVariant.secondary,
);

@SintiaPreview(name: 'Destructive', group: 'SintiaButton')
Widget sintiaButtonDestructivePreview() => SintiaButton(
  onPressed: () async {},
  label: 'Destructive',
  variant: SintiaButtonVariant.destructive,
);

@SintiaPreview(name: 'Text', group: 'SintiaButton')
Widget sintiaButtonTextPreview() => SintiaButton(
  onPressed: () async {},
  label: 'Text button',
  variant: SintiaButtonVariant.text,
);

@SintiaPreview(name: 'Disabled', group: 'SintiaButton')
Widget sintiaButtonDisabledPreview() =>
    const SintiaButton(onPressed: null, label: 'Disabled');

@SintiaPreview(name: 'With icons', group: 'SintiaButton')
Widget sintiaButtonIconsPreview() => SintiaButton(
  onPressed: () async {},
  label: 'With icons',
  leftIcon: const Icon(Icons.add),
  rightIcon: const Icon(Icons.arrow_forward),
);
// coverage:ignore-end
