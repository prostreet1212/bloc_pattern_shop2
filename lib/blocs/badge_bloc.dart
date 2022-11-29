import 'dart:async';
import 'package:bloc_pattern_shop2/model/coffee_menu.dart';

import '../actions/actions.dart';
import '../bloc_provider/bloc_provider.dart';

class BadgeBloc extends BlocBase {
  List<CoffeeMenu> badgeList = [];

  final _stateController = StreamController<List<CoffeeMenu>>();
  final _actionsController = StreamController<BadgeAction>();

  Stream<List<CoffeeMenu>> get state => _stateController.stream;

  Sink<BadgeAction> get action => _actionsController.sink;

  BadgeBloc() {
    _actionsController.stream.listen(_handleEvent);
  }

  void _handleEvent(BadgeAction action) async {
    if (action is ChangeBadgeCountAction) {
      if (action.coffeeMenu.isBuy) {
        badgeList = [...badgeList, action.coffeeMenu];
      } else {
        badgeList = [...badgeList]..remove(action.coffeeMenu);
      }
    } else if (action is ClearBadgeAction) {
      badgeList.clear();
    }
    _stateController.add(badgeList);
  }

@override
  dispose() {
    _stateController.close();
    _actionsController.close();
  }
}
