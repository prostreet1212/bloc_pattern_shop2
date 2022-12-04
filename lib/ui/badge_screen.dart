import 'package:bloc_pattern_shop2/actions/actions.dart';
import 'package:bloc_pattern_shop2/blocs/badge_bloc.dart';
import 'package:bloc_pattern_shop2/blocs/menu_bloc.dart';
import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';

import '../bloc_provider/bloc_provider.dart';

class BadgeScreen extends StatelessWidget {
  const BadgeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BadgeBloc? badgeBloc = BlocProvider.of(context);
    MenuBloc? menuBloc = BlocProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Корзина'),
        centerTitle: true,
      ),
      body: badgeBloc!.badgeList.isEmpty
          ? const Center(
              child: Text('Корзина пуста'),
            )
          : Column(
              children: [
                Expanded(
                    flex: 9,
                    child: ListView.builder(
                        itemCount: badgeBloc.badgeList.length,
                        itemBuilder: (context, index) {
                          return Card(
                            color: Colors.yellow,
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: 200,
                              child: Row(
                                children: [
                                  Image.asset(
                                    'assets/images/${badgeBloc.badgeList[index].image}',
                                    fit: BoxFit.fitWidth,
                                  ),
                                  Expanded(
                                      child: Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          badgeBloc.badgeList[index].name,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                        ),
                                        Text(
                                            'Цена: ${badgeBloc.badgeList[index].price} руб.',
                                            style: const TextStyle(
                                                fontStyle: FontStyle.italic,
                                                fontSize: 16))
                                      ],
                                    ),
                                  )),
                                ],
                              ),
                            ),
                          );
                        })),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.black),
                        ),
                        child: const Text(
                          'Оформить заказ',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                        onPressed: () {
                          badgeBloc.action.add(ClearBadgeAction());
                          menuBloc!.action.add(ChangeBuyStatus());
                          Navigator.pop(context);
                          showToast('Заказ успешно выполнен');
                        },
                      ),
                    ),
                  ),
                )
              ],
            ),
    );
  }
}
