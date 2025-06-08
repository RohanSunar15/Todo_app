import 'package:flutter/material.dart';

class CustomPopupMenu extends StatelessWidget {
  final List<PopupMenuEntry<String>> menuItems;
  final Widget icon;
  final void Function(String value) onSelected;

  const CustomPopupMenu({
    super.key,
    required this.menuItems,
    required this.onSelected,
    this.icon = const Icon(Icons.more_vert),
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      icon: icon ,
      onSelected: onSelected,
      itemBuilder: (context) => menuItems,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      color: Colors.white,
    );
  }
}
