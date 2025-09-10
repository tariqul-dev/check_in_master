import 'package:flutter/material.dart';

import 'show_app_bottom_sheet.dart';

Future<String?> showSingleInputBottomSheet(
  BuildContext context, {
  required TextEditingController nameController,
}) async {
  return await showAppBottomSheet<String>(
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
            controller: nameController,
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
                final name = nameController.text.trim();
                if (name.isEmpty) {
                  ScaffoldMessenger.of(ctx).showSnackBar(
                    const SnackBar(content: Text("Please enter a name")),
                  );
                  return;
                }
                Navigator.pop(ctx, name); // return entered value
              },
              child: const Text("Save"),
            ),
          ),
        ],
      );
    },
  );
}
