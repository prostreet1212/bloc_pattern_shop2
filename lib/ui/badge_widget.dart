import 'package:badges/badges.dart';
import 'package:bloc_pattern_shop2/blocs/badge_bloc.dart';
import 'package:bloc_pattern_shop2/ui/badge_screen.dart';
import 'package:flutter/material.dart';

import '../bloc_provider/bloc_provider.dart';
import '../model/coffee_menu.dart';

class BadgeWidget extends StatelessWidget {
   const BadgeWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
     BadgeBloc? badgeBloc = BlocProvider.of(context);
    return StreamBuilder<List<CoffeeMenu>>(
        initialData: badgeBloc!.badgeList,
        stream: badgeBloc.state,
        builder: (context, snaphot) {
          return Badge(
            badgeContent: Text(badgeBloc.badgeList.length.toString()),
            position: const BadgePosition(start: 26, bottom: 26),
            child: IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const BadgeScreen();
                }));
              },
            ),
          );
        });
  }
}
