import 'dart:async';
import 'package:bloc_pattern_shop2/model/coffee_menu.dart';

import '../actions/actions.dart';
import '../bloc_provider/bloc_provider.dart';
import '../repository/menu_repository.dart';

class MenuBloc extends BlocBase {
  List<CoffeeMenu> menuList = const ConstMenuRepository().getListMenu();

  final _stateController = StreamController<List<CoffeeMenu>>();
  final _eventController = StreamController<MenuAction>();

  Stream<List<CoffeeMenu>> get state => _stateController.stream;

  Sink<MenuAction> get action => _eventController.sink;

  MenuBloc() {
    _eventController.stream.listen(_handleEvent);
  }

  void _handleEvent(MenuAction action) async {
    if (action is BuyNotAction) {
      menuList = menuList.map((e) {
        if (e == action.coffeeMenu) {
          e.isBuy = !e.isBuy;
          return e;
        } else {
          return e;
        }
      }).toList();
    } else if (action is ChangeBuyStatus) {
      menuList = menuList.map((e) {
        if (e.isBuy == true) {
          e.isBuy = false;
          return e;
        } else {
          return e;
        }
      }).toList();
    }
    _stateController.add(menuList);
  }
@override
  dispose() {
    _stateController.close();
    _eventController.close();
  }
}
