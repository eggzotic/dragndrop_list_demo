import 'package:flutter_template/event/event.dart';
import 'package:flutter_template/state/app_state.dart';

class ClearNoticeEvent extends Event {
  @override
  Future<void> process(AppState appState) async {
    appState.clearNotice();
  }
}
