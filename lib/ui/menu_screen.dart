import 'package:bloc_pattern_shop2/ui/badge_widget.dart';
import 'package:flutter/material.dart';

import '../actions/actions.dart';
import '../bloc_provider/bloc_provider.dart';
import '../blocs/badge_bloc.dart';
import '../blocs/menu_bloc.dart';
import '../model/coffee_menu.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MenuBloc? menuBloc = BlocProvider1.of(context);
    BadgeBloc? badgeBloc = BlocProvider1.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc pattern shop 2'),
        leading: const BadgeWidget(),
      ),
      body: StreamBuilder<List<CoffeeMenu>>(
        initialData: menuBloc!.menuList,
        stream: menuBloc.state,
        builder: (context, snapshot) {
          return GridView.count(
            shrinkWrap: true,
            childAspectRatio: MediaQuery.of(context).size.width /
                (MediaQuery.of(context).size.height / 1.5),
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            crossAxisCount: 2,
            children: snapshot.data!.map(
              (menu) {
                return Card(
                  color: const Color.fromARGB(255, 255, 229, 85),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Wrap(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15)),
                        child: Stack(
                          children: [
                            Image.asset(
                              'assets/images/${menu.image}',
                              fit: BoxFit.fitWidth,
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                  alignment: Alignment.center,
                                  color:
                                      const Color.fromARGB(255, 174, 206, 231),
                                  height: 40,
                                  width: 40,
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.shopping_basket,
                                      color: !menu.isBuy
                                          ? Colors.grey
                                          : Colors.red,
                                    ),
                                    onPressed: () {
                                      menuBloc.action.add(BuyNotAction(menu));
                                      badgeBloc!.action
                                          .add(ChangeBadgeCountAction(menu));
                                    },
                                  )),
                            )
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          const SizedBox(
                            height: 7,
                          ),
                          Text(
                            menu.name,
                            textAlign: TextAlign.center,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('Цена: '),
                              Text(
                                '${menu.price} руб.',
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                );
              },
            ).toList(),
          );
        },
      ),
    );
  }
}
