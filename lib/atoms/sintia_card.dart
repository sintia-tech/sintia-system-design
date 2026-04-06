import 'package:flutter/material.dart';
import 'package:sintia_system_design/sintia_system_design.dart';

class SintiaCard extends StatelessWidget {
  const SintiaCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(SintiaSizes.size1),
  });

  final Widget child;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        borderRadius: BorderRadius.circular(SintiaSizes.radius1),
        border: Border.all(color: AppColors.scale02),
        boxShadow: SintiaShadows.s1,
      ),
      child: child,
    );
  }
}

// coverage:ignore-start
@SintiaPreview(name: 'Basic card', group: 'SintiaCard')
Widget sintiaCardPreview() => SintiaCard(
  child: Container(
    alignment: Alignment.center,
    child: const Icon(Icons.abc_outlined),
  ),
);
// coverage:ignore-end
