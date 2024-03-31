import 'package:flutter_template/model/failure.dart';

import '../state/app_state.dart';

/// Parent class of all events triggered by UI actions (e.g. button-click,
/// list-item selection, ...)
abstract class Event {
  /// Implement this when async event-handling will suffice
  Future<void> process(AppState appState) async {
    throw Failure("Please override the async 'process' method");
  }

  /// Use this when sync event-handling is required
  void processSync(AppState appState) {
    throw Failure("Please override the sync 'processSync' method");
  }
}
