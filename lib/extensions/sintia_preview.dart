import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';
import '../foundation/theme/sintia_theme_config.dart';
import '../foundation/theme/sintia_themes.dart';

const _previewConfig = SintiaThemeConfig(
  primaryColor: Colors.blue,
  secondaryColor: Colors.indigo,
  primaryFont: 'Montserrat',
  secondaryFont: 'OpenSans',
);

final class SintiaPreview extends Preview {
  const SintiaPreview({
    super.name,
    super.group,
    super.size,
    super.textScaleFactor,
    super.wrapper,
    super.brightness,
    super.localizations,
  }) : super(theme: SintiaPreview._themeBuilder);

  static PreviewThemeData _themeBuilder() {
    return PreviewThemeData(
      materialLight: SintiaTheme.light(_previewConfig),
      materialDark: SintiaTheme.dark(_previewConfig),
    );
  }
}
