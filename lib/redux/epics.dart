import 'dart:async';

import 'package:qwil_flutter_test/model/message_item.dart';
import 'package:qwil_flutter_test/redux/actions.dart';
import 'package:qwil_flutter_test/redux/app_state.dart';
import 'package:qwil_flutter_test/users_data.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:rxdart/rxdart.dart';

final epic = combineEpics<AppState>([
  FirstUserEpic(ChatApi()),
  SecondUserEpic(ChatApi()),
  ThirdUserEpic(ChatApi())
]);

class FirstUserEpic implements EpicClass<AppState> {
  final ChatApi api;

  FirstUserEpic(this.api);

  @override
  Stream<dynamic> call(Stream<dynamic> actions, EpicStore<AppState> store) {
    return new Observable(actions)
        .ofType(new TypeToken<UISimulationToggle>())
        .switchMap((action) => action.startSimulation
            ? api.firstUserMessages().map(((result) =>
                new FirstUserMessageSuccessAction(
                    new MessageItem(result.value, result.timestamp))))
            : Observable.just(store.state.summary.firstMessage));
  }
}

class SecondUserEpic implements EpicClass<AppState> {
  final ChatApi api;

  SecondUserEpic(this.api);

  @override
  Stream<dynamic> call(Stream<dynamic> actions, EpicStore<AppState> store) {
    return new Observable(actions)
        .ofType(new TypeToken<UISimulationToggle>())
        .switchMap((action) => action.startSimulation
            ? api.secondUserMessages().map(((result) =>
                new SecondUserMessageSuccessAction(
                    new MessageItem(result.value, result.timestamp))))
            : Observable.just(store.state.summary.secondMessage));
  }
}

class ThirdUserEpic implements EpicClass<AppState> {
  final ChatApi api;

  ThirdUserEpic(this.api);

  @override
  Stream<dynamic> call(Stream<dynamic> actions, EpicStore<AppState> store) {
    return new Observable(actions)
        .ofType(new TypeToken<UISimulationToggle>())
        .switchMap((action) => action.startSimulation
            ? api.thirdUserMessages().map(((result) =>
                new ThirdUserMessageSuccessAction(
                    new MessageItem(result.value, result.timestamp))))
            : Observable.just(store.state.summary.thirdMessage));
  }
}
