import 'package:flutter/material.dart';
import 'package:sintia_system_design/sintia_system_design.dart';

/// Organism — Custom dialog of the Sintia design system.
///
/// A reusable dialog composed of optional slots:
/// icon, title, message/content, and action buttons.
///
/// Colors and typography come from the active theme's [ColorScheme] and [TextTheme].
///
/// ---
/// **Case 1 — Error dialog:**
/// ```dart
/// SintiaDialog(
///   icon: PathAssets.alertIcon,
///   title: 'Error',
///   message: 'Something went wrong. Please try again.',
/// );
/// ```
///
/// **Case 2 — Confirm dialog with actions:**
/// ```dart
/// SintiaDialog(
///   title: 'Confirm Action',
///   message: 'Are you sure you want to continue?',
///   primaryAction: SintiaButton(
///     label: 'Accept',
///     onPressed: () async => Navigator.of(context).pop(),
///   ),
///   secondaryAction: SintiaButton(
///     label: 'Cancel',
///     variant: SintiaButtonVariant.secondary,
///     onPressed: () async => Navigator.of(context).pop(),
///   ),
/// );
/// ```
///
/// **Case 3 — Minimal dialog:**
/// ```dart
/// SintiaDialog(title: 'Success!');
/// ```
class SintiaDialog extends StatelessWidget {
  /// Dialog padding
  final EdgeInsets? padding;

  /// Path to icon image (use PathAssets)
  final String? icon;

  /// Dialog title
  final String? title;

  /// Dialog title style
  final TextStyle? titleStyle;

  /// Dialog message/description
  final String? message;

  /// Custom content widget (takes precedence over [message] if provided)
  final Widget? content;

  /// Primary action button (use [SintiaButton])
  final Widget? primaryAction;

  /// Secondary action button (use [SintiaButton])
  final Widget? secondaryAction;

  /// Show close button (X) in top-right corner. Defaults to true.
  final bool showCloseButton;

  /// Close button icon
  final Widget? closeButtonIcon;

  /// Callback when close button is pressed
  final VoidCallback? onClose;

  /// Background color
  final Color? backgroundColor;

  const SintiaDialog({
    super.key,
    this.padding,
    this.icon,
    this.title,
    this.titleStyle,
    this.message,
    this.content,
    this.primaryAction,
    this.secondaryAction,
    this.showCloseButton = true,
    this.closeButtonIcon,
    this.onClose,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;
    final textTheme = context.textTheme;

    return Dialog(
      backgroundColor: backgroundColor ?? Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: SintiaSizes.size3),
      child: Container(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.sizeOf(context).height * 0.8,
        ),
        padding: padding ?? const EdgeInsets.all(SintiaSizes.size1),
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: BorderRadius.circular(SintiaSizes.radius2),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: SintiaSizes.size2,
              offset: const Offset(0, SintiaSizes.size5),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Space so content doesn't  close button
            if (showCloseButton)
              Container(
                width: SintiaSizes.size9,
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    onClose?.call();
                    Navigator.of(context).pop();
                  },
                  child:
                      closeButtonIcon ??
                      Icon(
                        Icons.close_rounded,
                        size: SintiaSizes.size3,
                        color: colorScheme.onSurfaceVariant,
                      ),
                ),
              ),

            // ── Icon ──────────────────────────────────────────────
            if (icon != null) ...[
              Image.asset(
                icon!,
                width: SintiaSizes.size4,
                height: SintiaSizes.size4,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: SintiaSizes.size1),
            ],

            // ── Title ─────────────────────────────────────────────
            if (title != null) ...[
              SintiaText(
                title!,
                style:
                    titleStyle ??
                    textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: colorScheme.onSurface,
                    ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: SintiaSizes.size1),
            ],

            // ── Content or Message ────────────────────────────────
            if (content != null) ...[
              Flexible(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: SintiaSizes.size1,
                    ),
                    child: content!,
                  ),
                ),
              ),
              const SizedBox(height: SintiaSizes.size2),
            ],
            if (message != null) ...[
              Flexible(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: SintiaSizes.size2,
                    ),
                    child: SintiaText(
                      message!,
                      style: textTheme.bodyMedium?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: SintiaSizes.size2),
            ],

            // ── Primary action ────────────────────────────────────
            if (primaryAction != null) ...[
              primaryAction!,
              const SizedBox(height: SintiaSizes.size1),
            ],

            // ── Secondary action ──────────────────────────────────
            if (secondaryAction != null) ...[
              secondaryAction!,
              const SizedBox(height: SintiaSizes.size1),
            ],
          ],
        ),
      ),
    );
  }
}

// coverage:ignore-start
@SintiaPreview(name: 'Solo título', group: 'SintiaDialog')
Widget sintiaDialogMinimalPreview() => SintiaDialog(title: 'Success!');

@SintiaPreview(name: 'Con mensaje', group: 'SintiaDialog')
Widget sintiaDialogMessagePreview() => SintiaDialog(
  title: 'Error',
  message: 'Something went wrong. Please try again.',
);

@SintiaPreview(name: 'Con acciones', group: 'SintiaDialog')
Widget sintiaDialogActionsPreview() => Builder(
  builder: (context) => SintiaDialog(
    title: 'Confirm Action',
    message: 'Are you sure you want to continue?',
    primaryAction: SintiaButton(label: 'Accept', onPressed: () async {}),
    secondaryAction: SintiaButton(
      label: 'Cancel',
      variant: SintiaButtonVariant.secondary,
      onPressed: () async {},
    ),
  ),
);

@SintiaPreview(name: 'Sin close button', group: 'SintiaDialog')
Widget sintiaDialogNoClosePreview() => const SintiaDialog(
  title: 'Aviso',
  message: 'Esta acción no se puede deshacer.',
  showCloseButton: false,
);
// coverage:ignore-end
