import 'package:flutter/material.dart';
import 'package:sintia_system_design/models/sintia_app_bar_action.dart';

import '../molecules/app_bar/sintia_app_bar_leading.dart';
import '../molecules/app_bar/sintia_app_bar_title_section.dart';
import '../molecules/app_bar/sintia_app_bar_trailing.dart';
import '../sintia_system_design.dart';

/// Organism — Main AppBar of the Sintia design system.
///
/// Colors default to the active theme's [ColorScheme] if not provided:
/// - [backgroundColor] → [ColorScheme.surface]
/// - [foregroundColor] → [ColorScheme.onSurface]
///
/// Title size comes from [TextTheme.titleLarge].
///
/// ---
/// **Case 1 — Home (tappable title + cart):**
/// ```dart
/// SintiaAppBar(
///   title: 'Tienda el Centro',
///   titleSuffix: const Icon(Icons.keyboard_arrow_down),
///   onTitlePressed: () => context.push('/stores'),
///   trailingAction: SintiaAppBarAction.cart(onPressed: () {}, itemCount: 3),
/// )
/// ```
///
/// **Case 2 — Secondary screen (no back):**
/// ```dart
/// SintiaAppBar(
///   title: 'Mis pedidos',
///   trailingAction: SintiaAppBarAction.cart(onPressed: () {}),
/// )
/// ```
///
/// **Case 3 — Secondary screen with back:**
/// ```dart
/// SintiaAppBar(
///   title: 'Detalle del producto',
///   leadingType: SintiaAppBarLeadingType.back,
///   onLeadingPressed: () => context.pop(),
///   trailingAction: SintiaAppBarAction.cart(onPressed: () {}),
/// )
/// ```
///
/// **Case 4 — Custom trailing action:**
/// ```dart
/// SintiaAppBar(
///   title: 'Búsqueda',
///   leadingType: SintiaAppBarLeadingType.back,
///   trailingAction: SintiaAppBarAction(icon: Icons.search, onPressed: () {}),
/// )
/// ```
class SintiaAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final SintiaAppBarLeadingType leadingType;
  final VoidCallback? onLeadingPressed;
  final List<SintiaAppBarAction>? trailingActions;
  final VoidCallback? onTitlePressed;
  final Widget? titlePrefix;
  final Widget? titleSuffix;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double elevation;

  const SintiaAppBar({
    super.key,
    required this.title,
    this.leadingType = SintiaAppBarLeadingType.none,
    this.onLeadingPressed,
    this.trailingActions,
    this.onTitlePressed,
    this.titlePrefix,
    this.titleSuffix,
    this.backgroundColor,
    this.foregroundColor,
    this.elevation = 0,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  bool get _hasLeading => leadingType != SintiaAppBarLeadingType.none;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final fgColor = foregroundColor ?? colorScheme.onSurface;
    final titleStyle = Theme.of(context).textTheme.titleLarge?.copyWith(
      color: fgColor,
      fontWeight: FontWeight.bold,
    );

    return AppBar(
      backgroundColor: backgroundColor ?? colorScheme.surface,
      elevation: elevation,
      automaticallyImplyLeading: false,
      centerTitle: _hasLeading,
      leading: _hasLeading
          ? SintiaAppBarLeading(
              leadingType: leadingType,
              onPressed: onLeadingPressed,
              color: fgColor,
            )
          : null,
      title: SintiaAppBarTitleSection(
        title: title,
        textStyle: titleStyle,
        prefix: titlePrefix,
        suffix: titleSuffix,
        onTitlePressed: onTitlePressed,
        centerTitle: _hasLeading,
      ),
      actions: [
        if (trailingActions != null)
          for (var action in trailingActions!)
            SintiaAppBarTrailing(action: action, color: fgColor),
      ],
    );
  }
}

// coverage:ignore-start
@SintiaPreview(name: 'Home', group: 'SintiaAppBar')
Widget sintiaAppBarHomePreview() => SintiaAppBar(
  title: 'Tienda el Centro',
  titleSuffix: const Icon(Icons.keyboard_arrow_down),
  onTitlePressed: () {},
  trailingActions: [SintiaAppBarAction.cart(onPressed: () {}, itemCount: 3)],
);

@SintiaPreview(name: 'Sin back', group: 'SintiaAppBar')
Widget sintiaAppBarNoBackPreview() => SintiaAppBar(
  title: 'Mis pedidos',
  trailingActions: [SintiaAppBarAction.cart(onPressed: () {})],
);

@SintiaPreview(name: 'Con back', group: 'SintiaAppBar')
Widget sintiaAppBarWithBackPreview() => SintiaAppBar(
  title: 'Detalle del producto',
  leadingType: SintiaAppBarLeadingType.back,
  onLeadingPressed: () {},
  trailingActions: [
    SintiaAppBarAction.cart(onPressed: () {}, itemCount: 1),
    SintiaAppBarAction(icon: Icons.search, onPressed: () {}, tooltip: 'Buscar'),
  ],
);

@SintiaPreview(name: 'Acción personalizada', group: 'SintiaAppBar')
Widget sintiaAppBarCustomActionPreview() => SintiaAppBar(
  title: 'Búsqueda',
  leadingType: SintiaAppBarLeadingType.back,
  onLeadingPressed: () {},
  trailingActions: [
    SintiaAppBarAction(icon: Icons.search, onPressed: () {}, tooltip: 'Buscar'),
  ],
);

@SintiaPreview(name: 'Sin acciones', group: 'SintiaAppBar')
Widget sintiaAppBarBarePreview() => const SintiaAppBar(title: 'Configuración');
// coverage:ignore-end
