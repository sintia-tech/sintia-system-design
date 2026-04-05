# Sintia System Design

A Flutter design system package with configurable theming, and UI components. Built to give consuming apps full control over colors and typography while keeping UI consistency.

## Installation

Add the package to your `pubspec.yaml`:

```yaml
dependencies:
  sintia_system_design: ^0.0.1
```

Then run:

```bash
flutter pub get
```

## Setup

Configure the theme in your app's `main.dart` using `SintiaThemeConfig` and `SintiaTheme`:

```dart
import 'package:sintia_system_design/sintia_system_design.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const config = SintiaThemeConfig(
      primaryColor: Colors.blue,
      secondaryColor: Colors.indigo,
      primaryFont: 'YourPrimaryFont',
      secondaryFont: 'YourSecondaryFont',
      tertiaryFont: 'YourTertiaryFont', // optional
    );

    return MaterialApp(
      theme: SintiaTheme.light(config),
      darkTheme: SintiaTheme.dark(config),
      home: const MyHomePage(),
    );
  }
}
```

> Fonts must be registered in your app's `pubspec.yaml`. The package is font-source agnostic — use local assets or any font package like `google_fonts`.

### Font roles

| Text roles | Font used |
|---|---|
| `display*`, `headline*` | `primaryFont` |
| `title*`, `body*` | `secondaryFont` |
| `label*` | `tertiaryFont` if provided, otherwise `secondaryFont` |

## Components

### SintiaText

A styled text widget that wraps Flutter's `Text`.

```dart
SintiaText(
  'Hello World',
  style: TextStyle(fontSize: 16),
  maxLines: 2,
  overflow: TextOverflow.ellipsis,
)
```

### SintiaCard

A surface container with consistent border, shadow, and radius tokens applied.

```dart
SintiaCard(
  padding: EdgeInsets.all(SintiaSizes.size2),
  child: Text('Card content'),
)
```

## Design Tokens

### Colors — `AppColors`

Semantic color palette and gray scale:

```dart
AppColors.statusDanger01
AppColors.statusSuccess01
AppColors.statusWarning
AppColors.statusDisabled
AppColors.scale00 // white
AppColors.scale06 // darkest gray
```

### Sizes — `SintiaSizes`

Spacing and border radius tokens based on a Fibonacci-like scale:

```dart
SintiaSizes.size1  // 10
SintiaSizes.size2  // 20
SintiaSizes.size3  // 30
// ...up to size9

SintiaSizes.radius1  // 10
SintiaSizes.radius2  // 20
```

### Shadows — `SintiaShadows`

Three elevation levels:

```dart
SintiaShadows.s1  // subtle
SintiaShadows.s2  // medium
SintiaShadows.s3  // strong
```

### Elevations — `SintiaElevations`

```dart
SintiaElevations.s1  // 2
SintiaElevations.s2  // 4
// ...up to s6
```

## Extensions

### BuildContext

Quick access to theme properties:

```dart
context.theme
context.colorScheme
context.textTheme
context.primaryColor
context.errorColor
```

### TextStyle

Compose styles fluently:

```dart
someStyle.primary(context)    // applies colorScheme.primary
someStyle.secondary(context)  // applies colorScheme.secondary
someStyle.withColor(AppColors.statusDanger01)
```

## Links

- Website: [sintia.tech](https://sintia.tech)
- Repository: [github.com/sintia-tech/sintia-system-design](https://github.com/sintia-tech/sintia-system-design)
- Issues: [github.com/sintia-tech/sintia-system-design/issues](https://github.com/sintia-tech/sintia-system-design/issues)