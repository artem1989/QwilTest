import 'dart:async';

import 'package:qwil_flutter_test/redux/actions.dart';
import 'package:qwil_flutter_test/redux/app_state.dart';
import 'package:qwil_flutter_test/summary_data.dart';
import 'package:qwil_flutter_test/users_data.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:rxdart/rxdart.dart';

final epic = combineEpics<AppState>([
  FirstUserEpic(ChatApi(), SummaryApi()),
  SecondUserEpic(ChatApi(), SummaryApi()),
  ThirdUserEpic(ChatApi(), SummaryApi())
]);

class FirstUserEpic implements EpicClass<AppState> {
  final ChatApi api;
  final SummaryApi summaryApi;

  FirstUserEpic(this.api, this.summaryApi);

  @override
  Stream<dynamic> call(Stream<dynamic> actions, EpicStore<AppState> store) {
    return new Observable(actions)
        .ofType(new TypeToken<UISimulationToggle>())
        .switchMap((action) => action.startSimulation ? api.firstUserMessages().map(
        ((result) => new FirstUserMessageSuccessAction(result.value, result.timestamp))
    ) : Observable.just(store.state.firstUserLastMessages));
    }
}

class SecondUserEpic implements EpicClass<AppState> {
  final ChatApi api;
  final SummaryApi summaryApi;

  SecondUserEpic(this.api, this.summaryApi);

  @override
  Stream<dynamic> call(Stream<dynamic> actions, EpicStore<AppState> store) {
    return new Observable(actions)
        .ofType(new TypeToken<UISimulationToggle>())
        .switchMap((action) => action.startSimulation ? api.secondUserMessages().map(
        ((result) => new SecondUserMessageSuccessAction(result.value, result.timestamp))
    ) : Observable.just(store.state.secondUserLastMessages));
  }
}

class ThirdUserEpic implements EpicClass<AppState> {
  final ChatApi api;
  final SummaryApi summaryApi;

  ThirdUserEpic(this.api, this.summaryApi);

  @override
  Stream<dynamic> call(Stream<dynamic> actions, EpicStore<AppState> store) {
    return new Observable(actions)
        .ofType(new TypeToken<UISimulationToggle>())
        .switchMap((action) => action.startSimulation ? api.thirdUserMessages().map(
        ((result) => new ThirdUserMessageSuccessAction(result.value, result.timestamp))
    ) : Observable.just(store.state.thirdUserLastMessages));
  }
}

//class SummaryMessageEpic implements EpicClass<AppState> {
//  final SummaryApi api;
//
//  SummaryMessageEpic(this.api);
//
//  @override
//  Stream<dynamic> call(Stream<dynamic> actions, EpicStore<AppState> store) {
//    return new Observable(actions)
//        .ofType(new TypeToken<EmitSummaryItem>())
//        .switchMap((action) => api.summaryMessage().map(
//        ((result) => new SummaryMessageSuccessAction())
//    ));
//  }
//}