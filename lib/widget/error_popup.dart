import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../state/app_state.dart';
import 'my_popup.dart';

class ErrorPopup extends StatelessWidget {
  const ErrorPopup({super.key});

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    return MyPopup(
      height: 200,
      width: 200,
      title: const Text("Error"),
      rows: [
        ListTile(
          title: Text(appState.failure?.message ?? "Unknown error"),
        ),
        SelectionArea(
          child: ListTile(
            title: Center(
              child: TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text("OK, got it"),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
