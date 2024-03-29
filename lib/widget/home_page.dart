import 'package:flutter/material.dart';
import 'package:flutter_template/event/clear_notice_event.dart';
import 'package:flutter_template/event/move_item_event.dart';
import 'package:flutter_template/widget/my_popup.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../event/clear_failure_event.dart';
import '../state/app_state.dart';
import '../state/ui/ui_common.dart';
import 'error_popup.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    final uiState = Provider.of<UiCommon>(context);
    if (appState.hasFailure) {
      WidgetsBinding.instance.addPostFrameCallback(
        (_) {
          showDialog(
            context: context,
            builder: (_) => const ErrorPopup(),
          ).then((_) async {
            await appState.sendEvent(ClearFailureEvent());
          });
        },
      );
    } else if (appState.hasNotice) {
      WidgetsBinding.instance.addPostFrameCallback(
        (_) {
          showDialog(
            context: context,
            builder: (_) => MyPopup(
              title: const Text("Notice"),
              rows: [ListTile(title: Text(appState.notice ?? ""))],
              height: 200,
              width: 200,
            ),
          ).then((_) async {
            await appState.sendEvent(ClearNoticeEvent());
          });
        },
      );
    }
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            showAboutDialog(
              context: context,
              applicationVersion: "v${appState.version}",
              applicationName: "Drag-n-Drop List demo",
              applicationIcon: uiState.appIcon,
              applicationLegalese:
                  "Drag-n-Drop List demo is available for free/purchase, for personal or commercial use. No responsibility is accepted if this app causes any harm to your computer or data. That said, no such harm is expected or intended either. The app is written by Richard (eggzotic@gmail.com), but leverages wonderful work that went into the various composite packages, sourced from https://pub.dev/flutter - see the licenses section for the full detail.",
            );
          },
          icon: uiState.aboutIcon,
        ),
        title: const Text("Drag-n-Drop List demo"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              appState.moveCount.toString(),
              style: const TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          // Use this to assist with setting thresholds for layout changes
          debugPrint("$runtimeType width = ${constraints.maxWidth}");
          return ReorderableListView.builder(
            buildDefaultDragHandles: false,
            itemBuilder: (context, index) {
              final item = appState.items[index];
              return Card(
                key: ValueKey("item ${item.index}"),
                child: ListTile(
                  title: Text(item.name),
                  subtitle: Text(item.description),
                  trailing: ReorderableDragStartListener(
                    index: index,
                    child: const FaIcon(FontAwesomeIcons.hand),
                  ),
                ),
              );
            },
            itemCount: appState.itemCount,
            onReorder: (before, after) =>
                appState.sendEventSync(MoveItemEvent(from: before, to: after)),
          );
        },
      ),
    );
  }
}
