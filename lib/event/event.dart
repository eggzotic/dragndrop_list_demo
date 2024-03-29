import '../state/app_state.dart';

/// Parent class of all events triggered by UI actions (e.g. button-click,
/// list-item selection, ...)
abstract class Event {
  /// Implement this when async event-handling will suffice
  Future<void> process(AppState appState) async {}

  /// Use this when sync event-handling is required
  void processSync(AppState appState) {}
}
