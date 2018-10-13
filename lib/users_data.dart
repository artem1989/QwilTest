import 'package:rxdart/rxdart.dart';
import 'dart:math';

class ChatApi {
  final _random = new Random();

  static const INT_MIN_BOUND = 1;
  static const INT_MAX_BOUND = 2;
  static const RANDOM_STRING_LENGTH = 30;

  int _next(int min, int max) => min + _random.nextInt(max - min);

  String _randomString(int length) {
    var codeUnits = new List.generate(length, (index) {
      return _random.nextInt(33) + 89;
    });
    return new String.fromCharCodes(codeUnits);
  }

  Observable<Timestamped<String>> firstUserMessages() =>
      _simulateTimedMessage();

  Observable<Timestamped<String>> secondUserMessages() =>
      _simulateTimedMessage();

  Observable<Timestamped<String>> thirdUserMessages() =>
      _simulateTimedMessage();

  /// Simulate timestampted observable random string messages periodically between 1 and 2 seconds
  Observable<Timestamped<String>> _simulateTimedMessage() {
    return Observable.periodic(
        Duration(seconds: _next(INT_MIN_BOUND, INT_MAX_BOUND)),
        (_) => _randomString(RANDOM_STRING_LENGTH)).timestamp();
  }
}
