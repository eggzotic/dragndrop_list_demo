import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UiCommon {
  UiCommon({required this.context});
  final BuildContext context;
  //
  final failColor = Colors.red;
  final deleteColor = Colors.red;
  final signOutColor = Colors.red;
  final cancelColor = Colors.red;
  //
  // Icons for re-use. A mix of the builtins (Icon) and Fontawesome (FaIcon) free
  Icon get editIcon => const Icon(Icons.edit);
  FaIcon get aboutIcon => const FaIcon(FontAwesomeIcons.circleInfo);
  FaIcon get appIcon => const FaIcon(FontAwesomeIcons.folderOpen);
  Icon get closeIcon => const Icon(Icons.close);
  Icon get addIcon => const Icon(Icons.add);
  Icon get signOutIcon => const Icon(Icons.logout);
  FaIcon get deleteIcon => const FaIcon(FontAwesomeIcons.trashCan);
  FaIcon get refreshIcon => const FaIcon(FontAwesomeIcons.rotate);
  Icon get undoIcon => const Icon(Icons.undo_outlined);

  /// To help with placement, layout, etc.
  final isWebMobile = kIsWeb &&
      (defaultTargetPlatform == TargetPlatform.iOS ||
          defaultTargetPlatform == TargetPlatform.android);
}
