import 'dart:async';

import 'package:qwil_flutter_test/redux/actions.dart';
import 'package:qwil_flutter_test/redux/app_state.dart';
import 'package:qwil_flutter_test/summary_data.dart';
import 'package:qwil_flutter_test/users_data.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:rxdart/rxdart.dart';

final epic = combineEpics<AppState>([
  FirstUserEpic(ChatApi()),
  SecondUserEpic(ChatApi()),
  ThirdUserEpic(ChatApi()),
  SummaryMessageEpic(SummaryApi())
]);

class FirstUserEpic implements EpicClass<AppState> {
  final ChatApi api;

  FirstUserEpic(this.api);

  @override
  Stream<dynamic> call(Stream<dynamic> actions, EpicStore<AppState> store) {
    return new Observable(actions)
        .ofType(new TypeToken<UISimulationToggle>())
        .switchMap((action) => api.firstUserMessages().map(
        ((message) => new FirstUserMessageSuccessAction(message))
    ));
    }
}

class SecondUserEpic implements EpicClass<AppState> {
  final ChatApi api;

  SecondUserEpic(this.api);

  @override
  Stream<dynamic> call(Stream<dynamic> actions, EpicStore<AppState> store) {
    return new Observable(actions)
        .ofType(new TypeToken<UISimulationToggle>())
        .switchMap((action) => api.secondUserMessages().map(
        ((message) => new SecondUserMessageSuccessAction(message))
    ));
  }
}

class ThirdUserEpic implements EpicClass<AppState> {
  final ChatApi api;

  ThirdUserEpic(this.api);

  @override
  Stream<dynamic> call(Stream<dynamic> actions, EpicStore<AppState> store) {
    return new Observable(actions)
        .ofType(new TypeToken<UISimulationToggle>())
        .switchMap((action) => api.thirdUserMessages().map(
        ((message) => new ThirdUserMessageSuccessAction(message))
    ));
  }
}

class SummaryMessageEpic implements EpicClass<AppState> {
  final SummaryApi api;

  SummaryMessageEpic(this.api);

  @override
  Stream<dynamic> call(Stream<dynamic> actions, EpicStore<AppState> store) {
    return new Observable(actions)
        .ofType(new TypeToken<EmitSummaryItem>())
        .switchMap((action) => api.summaryMessage("123456").map(
        ((result) => new SummaryMessageSuccessAction(result.value, result.interval.inSeconds))
    ));
  }
}