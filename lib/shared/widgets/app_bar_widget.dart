import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/shared/widgets/app_buttons.dart';
import 'package:todo_app/shared/widgets/divider_widget.dart';

class AppBarWidget extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final void Function()? back;
  final List<IconButton>? actions;
  final bool bottomDivider;

  const AppBarWidget({
    Key? key,
    required this.title,
    this.back,
    this.actions,
    this.bottomDivider = true,
  }) : super(key: key);

  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _AppBarWidgetState extends State<AppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      automaticallyImplyLeading: false,
      leading: widget.back == null ? null : AppBackButton(
        onTap: widget.back,
      ),
      title: Text(widget.title.tr),
      actions: widget.actions,
      bottom: widget.bottomDivider ? const PreferredSize(
        preferredSize: Size.fromHeight(1),
        child: DividerWidget(),
      ) : const PreferredSize(
        preferredSize: Size.fromHeight(1),
        child: SizedBox(
          height: 1,
        ),
      ),
    );
  }
}
