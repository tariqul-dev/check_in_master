import 'package:flutter/material.dart';

import 'show_app_bottom_sheet.dart';

Future<void> showSingleInputBottomSheet(
  BuildContext context, {
  required Function(String name) onPressSave,
}) async {
  final TextEditingController nameTextController = TextEditingController();
  await showAppBottomSheet(
    context: context,
    builder: (ctx) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Save Location",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: nameTextController,
            decoration: const InputDecoration(
              labelText: "Location name",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed: () {
                final name = nameTextController.text.trim();
                if (name.isEmpty) {
                  ScaffoldMessenger.of(ctx).showSnackBar(
                    const SnackBar(content: Text("Please enter a name")),
                  );
                  return;
                }
                onPressSave(name);
                Navigator.pop(ctx);
              },
              child: const Text("Save"),
            ),
          ),
        ],
      );
    },
  );
}
