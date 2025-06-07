import 'package:flutter/material.dart';
import 'package:todo_app/features/task/widget/custom_button.dart';

class AddTodoDialog extends StatelessWidget {
  VoidCallback onSave;
  VoidCallback onCancel;
  final TextEditingController controller;

  AddTodoDialog({
    super.key,
    required this.onSave,
    required this.onCancel,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SizedBox(
        height: 180,
        child: Column(
          children: [
            Text('Add Task', style: TextStyle(fontSize: 18)),
            TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "New Task",
              ),
            ),
            SizedBox(height: 25),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(buttonText: 'Save', onPressed: onSave),
                SizedBox(width: 15),
                CustomButton(buttonText: 'Cancel', onPressed: onCancel),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
