import 'package:flutter_template/event/event.dart';
import 'package:flutter_template/state/app_state.dart';

class ClearFailureEvent extends Event {
  @override
  Future<void> process(AppState appState) async {
    appState.clearFailure();
  }
}
