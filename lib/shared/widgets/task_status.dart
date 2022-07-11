import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/shared/enums/importance_enums.dart';
import 'package:todo_app/shared/enums/label_enums.dart';
import 'package:todo_app/shared/widgets/label_widget.dart';

class TackStatus extends StatelessWidget {
  final LabelEnums label;
  final ImportanceEnums importance;
  final EdgeInsets padding;

  const TackStatus({
    Key? key,
    required this.label,
    required this.importance,
    this.padding = EdgeInsets.zero,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Row(
        children: [
          LabelWidget(
            label: label,
          ),
          Text(
            importance.getName.tr,
            style: Get.textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
