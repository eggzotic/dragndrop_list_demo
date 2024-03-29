import 'package:flutter_template/event/event.dart';
import 'package:flutter_template/state/app_state.dart';

class MoveItemEvent extends Event {
  final int from;
  final int to;
  MoveItemEvent({required this.from, required this.to});

  @override
  void processSync(AppState appState)  {
    appState.move(from: from, to: to);
  }
}
