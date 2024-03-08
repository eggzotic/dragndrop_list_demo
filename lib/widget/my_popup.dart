import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../state/ui/ui_common.dart';

class MyPopup extends StatelessWidget {
  const MyPopup({
    required this.rows,
    this.title,
    this.height,
    this.width,
    this.fixed,
    super.key,
  });

  final Widget? fixed;
  final List<Widget> rows;
  final Widget? title;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    const radius = 15.0;
    final uiState = Provider.of<UiCommon>(context);
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
      ),
      // setting the Dialog's bg color to transparent means we only need apply
      //  the rounded border to the Scaffold further down
      backgroundColor: Colors.transparent,
      child: SizedBox(
        height: height,
        width: width,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(radius),
          child: Builder(builder: (context) {
            // creating a new ScaffoldMessenger at this point in the tree prevents
            // SnackBars shown by ScaffoldMessanger.of(context) from also being
            // shown in these popups
            return ScaffoldMessenger(
              key: const ValueKey("Do not receive Snackbars"),
              child: Scaffold(
                appBar: AppBar(
                  automaticallyImplyLeading: false,
                  title: title,
                  actions: [
                    IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: uiState.closeIcon,
                    ),
                  ],
                ),
                body: Column(
                  children: [
                    if (fixed != null) ...[
                      fixed!,
                      const Divider(),
                    ],
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: rows.length,
                        itemBuilder: (_, i) => rows[i],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
