import 'package:rxdart/rxdart.dart';
import 'dart:math';

class ChatApi {

  final _random = new Random();

  int next(int min, int max) => min + _random.nextInt(max - min);

  String _randomString(int length) {
    var codeUnits = new List.generate(length, (index) {
          return _random.nextInt(33) + 89;
        }
    );

    return new String.fromCharCodes(codeUnits);
  }

  Observable<Timestamped<String>> firstUserMessages() {
    return Observable.periodic(
        Duration(seconds: next(1, 2)), (_) => _randomString(20)).timestamp();
  }

  Observable<Timestamped<String>> secondUserMessages() {
    return Observable.periodic(
        Duration(seconds: next(1, 2)), (_) => _randomString(20)).timestamp();
  }

  Observable<Timestamped<String>> thirdUserMessages() {
    return Observable.periodic(
        Duration(seconds: next(1, 2)), (_) => _randomString(20)).timestamp();
  }

}
        
