import 'package:flutter_template/event/event.dart';
import 'package:flutter_template/state/app_state.dart';

class DeleteItemEvent extends Event {
  final int index;
  DeleteItemEvent({required this.index});

  @override
  void processSync(AppState appState) {
    appState.removeItem(withIndex: index);
  }
}
