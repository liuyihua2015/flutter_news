import 'package:flutter/material.dart';
import 'package:flutter_news/common/values/colors.dart';

/// 透明背景 AppBar
AppBar transparentAppBar({
  Widget? title,
  Widget? leading,
  List<Widget>? actions,
}) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    title: title != null
        ? Center(
      child: title,
    )
        : null,
    leading: leading,
    actions: actions,
  );
}
