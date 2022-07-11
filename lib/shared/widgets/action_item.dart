import 'package:flutter/material.dart';

class ActionItem extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;
  final void Function() onTap;

  const ActionItem({
    Key? key,
    required this.child,
    this.padding = const EdgeInsets.symmetric(
      vertical: 8,
      horizontal: 16,
    ),
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          minHeight: 54,
        ),
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: padding,
            child: Align(
              alignment: Alignment.centerLeft,
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
