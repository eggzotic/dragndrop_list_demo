import '../state/app_state.dart';

/// Parent class of all events triggered by UI actions (e.g. button-click,
/// list-item selection, ...)
abstract class Event {
  Future<void> process(AppState appState);
}
