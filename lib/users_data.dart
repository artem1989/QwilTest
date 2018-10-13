import 'package:rxdart/rxdart.dart';
import 'dart:math';

class ChatApi {
  final _random = new Random();

  static const INT_MIN_BOUND = 1;
  static const INT_MAX_BOUND = 2;

  // Constants for testing not delivered messages
  static const INT_MIN_BOUND_NOT_DELIVERED = 15;
  static const INT_MAX_BOUND_NOT_DELIVERED = 20;

  static const RANDOM_STRING_LENGTH = 30;

  int _next(int min, int max) => min + _random.nextInt(max - min);

  String _randomString(int length) {
    var codeUnits = new List.generate(length, (index) {
      return _random.nextInt(33) + 89;
    });
    return new String.fromCharCodes(codeUnits);
  }

  Observable<Timestamped<String>> firstUserMessages() =>
      _simulateTimedMessage(INT_MIN_BOUND, INT_MAX_BOUND);

  Observable<Timestamped<String>> secondUserMessages() =>
      _simulateTimedMessage(INT_MIN_BOUND, INT_MAX_BOUND);

  /// Third user sends messages rarely between 15 and 20 seconds
  Observable<Timestamped<String>> thirdUserMessages() => _simulateTimedMessage(
      INT_MIN_BOUND_NOT_DELIVERED, INT_MAX_BOUND_NOT_DELIVERED);

  /// Simulate timeStamped observable random string messages periodically between 1 and 2 seconds
  Observable<Timestamped<String>> _simulateTimedMessage(
      int minBoundInSec, int maxBoundInSec) {
    return Observable.periodic(
        Duration(seconds: _next(minBoundInSec, maxBoundInSec)),
        (_) => _randomString(RANDOM_STRING_LENGTH)).timestamp();
  }
}
