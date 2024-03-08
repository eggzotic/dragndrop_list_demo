
import '../state/app_state.dart';
import 'event.dart';

class ClearFailureEvent extends Event {
  @override
  Future<void> process(AppState appState) async {
    appState.clearFailure();
  }
}
