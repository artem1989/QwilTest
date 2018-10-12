import 'package:rxdart/rxdart.dart';

class SummaryApi {

  Observable<TimeInterval<String>> summaryMessage(String summary) {
    return Observable.just(summary).timeInterval();
  }

}