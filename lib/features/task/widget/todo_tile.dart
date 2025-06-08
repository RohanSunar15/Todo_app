import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/customWidget/custom_popup_menu.dart';

class TodoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  final Function(bool?)? onChanged;
  final Function(String) onSelected;

  const TodoTile({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
      child: Container(
        padding: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: taskCompleted ? Colors.green.shade100 : Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Checkbox(
              value: taskCompleted,
              onChanged: onChanged,
              shape: const CircleBorder(),
            ),
            const SizedBox(width: 10),

            /// Expanded text to take remaining space
            Expanded(
              child: Text(
                taskName,
                style:  TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  decoration: taskCompleted ? TextDecoration.lineThrough : TextDecoration.none,
                  color: taskCompleted ? Colors.green.shade900 : null,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 10,
              ),
            ),
            const SizedBox(width: 10),

            /// Ensure the popup menu doesn't expand
            ConstrainedBox(
              constraints: const BoxConstraints(
                minWidth: 0,
                maxWidth: 40,
              ),
              child: Align(
                alignment: Alignment.centerRight,
                child: CustomPopupMenu(
                  menuItems: [
                    PopupMenuItem(
                      value: 'edit',
                      child: Row(
                        children:  [
                          Icon(Icons.edit, size: 18,color: Theme.of(context).colorScheme.onSurface),
                          SizedBox(width: 8),
                          Text('Edit', style: TextStyle(color: Theme.of(context).colorScheme.onSurface)),
                        ],
                      ),
                    ),
                    PopupMenuItem(
                      value: 'delete',
                      child: Row(
                        children:  [
                          Icon(Icons.delete, size: 18, color: Colors.red),
                          SizedBox(width: 8),
                          Text('Delete',style: TextStyle(color: Theme.of(context).colorScheme.onSurface)),
                        ],
                      ),
                    ),
                  ],
                  onSelected: onSelected,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
