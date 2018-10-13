import 'package:rxdart/rxdart.dart';

class SummaryApi {

  Observable<String> summaryMessage() {
    return Observable.just("1234");
  }

}