import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../event/increment_value_event.dart';
import '../state/app_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            showAboutDialog(
              context: context,
              applicationVersion: "v${appState.version}",
              applicationName: "App Name & Acronym",
              applicationIcon: const FaIcon(FontAwesomeIcons.folderOpen),
              applicationLegalese:
                  "App-name is available for free/purchase, for personal or commercial use. No responsibility is accepted if this app causes any harm to your computer or data. That said, no such harm is expected or intended either. The app is written by Richard (eggzotic@gmail.com), but leverages wonderful work that went into the various composite packages, sourced from https://pub.dev/flutter - see the licenses section for the full detail.",
            );
          },
          icon: const FaIcon(FontAwesomeIcons.info),
        ),
        title: const Text("App Name &/or Acronym"),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          // Use this to assist with setting thresholds for layout changes
          debugPrint("$runtimeType width = ${constraints.maxWidth}");
          return Center(
            child: Text(
              "${appState.value}",
              style: Theme.of(context).textTheme.displayLarge,
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await appState.sendEvent(IncrementValueEvent());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
