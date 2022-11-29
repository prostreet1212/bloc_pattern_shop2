
import 'package:bloc_pattern_shop2/bloc_provider/bloc_provider.dart';
import 'package:bloc_pattern_shop2/blocs/badge_bloc.dart';
import 'package:bloc_pattern_shop2/blocs/menu_bloc.dart';
import 'package:bloc_pattern_shop2/ui/menu_screen.dart';
import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider1(
        child: BlocProvider1(
          child: OKToast(
            textStyle: const TextStyle(fontSize: 19.0, color: Colors.white),
            backgroundColor: const Color.fromARGB(113, 145, 148, 139),
            position: ToastPosition.bottom,
            textPadding: const EdgeInsets.all(8),
            duration: const Duration(seconds: 3),
            child: MaterialApp(
              title: 'Flutter Demo',
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              home: const MenuScreen(),
            ),
          ),
          bloc: BadgeBloc(),
        ),
        bloc: MenuBloc());
  }
}
