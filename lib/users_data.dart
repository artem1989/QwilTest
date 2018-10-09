import 'package:rxdart/rxdart.dart';
import 'dart:math';

class MessageApi {

  final _random = new Random();

  int next(int min, int max) => min + _random.nextInt(max - min);

  String _randomString(int length) {
    var codeUnits = new List.generate(
        length,
            (index) {
          return _random.nextInt(33) + 89;
        }
    );

    return new String.fromCharCodes(codeUnits);
  }

  Observable<dynamic> firstUserMessages() {
    return Observable.periodic(
        Duration(seconds: next(1, 2)), (_) => _randomString(10));
  }

  Observable<dynamic> secondUserMessages() {
    return Observable.periodic(
        Duration(seconds: next(1, 2)), (_) => _randomString(10));
  }

  Observable<dynamic> thirdUserMessages() {
    return Observable.periodic(
        Duration(seconds: next(1, 2)), (_) => _randomString(10));
  }
}
        
