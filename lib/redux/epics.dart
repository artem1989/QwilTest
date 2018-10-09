import 'dart:async';

import 'package:qwil_flutter_test/redux/actions.dart';
import 'package:qwil_flutter_test/redux/app_state.dart';
import 'package:qwil_flutter_test/users_data.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:rxdart/rxdart.dart';

class EmitMessageEpic implements EpicClass<AppState> {
  final MessageApi api;

  EmitMessageEpic(this.api);

  @override
  Stream<dynamic> call(Stream<dynamic> actions, EpicStore<AppState> store) {
    return new Observable(actions)
        .ofType(new TypeToken<EmitMessageAction>())
        .switchMap((action) => api.firstUserMessages().map(
        ((message) => new MessageSuccessAction(message))
    ));
    }
}