import 'package:flutter/material.dart';
import 'package:flutter_template/model/item.dart';
import 'package:version/version.dart';
//
import '../event/event.dart';
import '../model/failure.dart';

/// Top-level state - intended to be injected to the Widget tree via
/// ChangeNotifierProvider
class AppState extends ChangeNotifier {
  final version = Version(0, 0, 6);

  //
  Failure? _failure;
  Failure? get failure => _failure;
  bool get hasFailure => _failure != null;
  String? _notice;
  String? get notice => _notice;
  bool get hasNotice => _notice != null;

  void clearNotice() {
    _notice = null;
  }

  void clearFailure() {
    _failure = null;
  }

  /// Call this from the action section of a UI control, with a subclass of Event
  Future<void> sendEvent(Event event, {bool notify = true}) async {
    try {
      await event.process(this);
    } on Failure catch (f) {
      _failure = f;
    } catch (e) {
      _failure = Failure("$e");
    } finally {
      if (notify) notifyListeners();
    }
  }

  /// For receiving/processing sync events, such as ReorderableListView
  /// requires for clean, non-janking, animation of the move of an item
  void sendEventSync(Event event, {bool notify = true}) {
    try {
      event.processSync(this);
    } on Failure catch (f) {
      _failure = f;
    } catch (e) {
      _failure = Failure("$e");
    } finally {
      if (notify) notifyListeners();
    }
  }

  /// Local state for this re-orderable-list demo
  final items = <Item>[];
  final int itemCount;

  final notifyAfter = 5;
  int _moveCount = 0;
  int get moveCount => _moveCount;

  AppState({required this.itemCount}) {
    for (int i = 0; i < itemCount; i++) {
      items.add(
        Item(
          index: i,
          name: "Item number $i",
          description: "Description of item $i",
        ),
      );
    }
  }

  /// Move an element to another position
  void move({required int from, required int to}) {
    // this reduces the indexes of all items after that location
    final item = items.removeAt(from);
    if (to > from) to--;
    debugPrint("$runtimeType from = $from, to = $to");
    items.insert(to, item);
    _moveCount++;
    debugPrint("$runtimeType items now: $items");
    if (_moveCount % notifyAfter == 0) {
      _notice = "$_moveCount moves completed!";
    }
  }
}
