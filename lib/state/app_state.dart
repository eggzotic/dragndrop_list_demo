import 'package:flutter/material.dart';
import 'package:version/version.dart';
//
import '../event/event.dart';
import '../model/failure.dart';

/// Top-level state - intended to be injected to the Widget tree via
/// ChangeNotifierProvider
class AppState extends ChangeNotifier {
  /// Increment this accordingly with each new commit/build/release
  /// compare it with the in-DB value to determine whether the user ought to
  /// update
  final version = Version(0, 0, 3);

  /// replace this with actual, meaningful state...
  int _value = 0;
  int get value => _value;
  void increment() {
    _value += 1;
    // insert a Failure, to demonstrate how they can be communicated
    if (_value % 10 == 0) _failure = Failure("Multiple of 10 reached!");
  }

  //
  Failure? _failure;
  Failure? get failure => _failure;
  bool get hasFailure => _failure != null;

  void clearFailure() {
    _failure = null;
  }

  /// Call this from the action section of UI control, with a subclass of Event
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
}
