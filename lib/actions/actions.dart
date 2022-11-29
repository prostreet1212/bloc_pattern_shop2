import '../../model/coffee_menu.dart';

abstract class MenuAction {}

abstract class BadgeAction {}

class ChangeBuyStatus extends MenuAction {}

class BuyNotAction extends MenuAction {
  final CoffeeMenu coffeeMenu;

  BuyNotAction(this.coffeeMenu);
}

class ChangeBadgeCountAction extends BadgeAction {
  final CoffeeMenu coffeeMenu;

  ChangeBadgeCountAction(this.coffeeMenu);
}

class ClearBadgeAction extends BadgeAction {}
