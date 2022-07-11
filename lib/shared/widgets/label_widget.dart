import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:todo_app/shared/enums/label_enums.dart';

class LabelWidget extends StatelessWidget {
  final LabelEnums? label;
  final bool emptyCircle;

  const LabelWidget({
    Key? key,
    required this.label,
    this.emptyCircle = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Offstage(
      offstage: !emptyCircle && _checkLabel(),
      child: Padding(
        padding: const EdgeInsets.only(
          right: 8,
        ),
        child: _checkLabel() ? Icon(
          CupertinoIcons.circle,
          color: Get.textTheme.bodyMedium?.color,
        ) : Icon(
          CupertinoIcons.circle_fill,
          color: label?.getColor,
        ),
      ),
    );
  }

 bool _checkLabel() => label == null || label == LabelEnums.none;
}
