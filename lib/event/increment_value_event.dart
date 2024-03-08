import '../state/app_state.dart';
import 'event.dart';

class IncrementValueEvent extends Event {
  @override
  Future<void> process(AppState appState) async {
    appState.increment();
  }
}
