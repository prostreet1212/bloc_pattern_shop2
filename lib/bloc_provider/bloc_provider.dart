import 'package:flutter/material.dart';

abstract class BlocBase {
  void dispose();
}

class BlocProvider1<T extends BlocBase> extends StatefulWidget {
  BlocProvider1({
    Key? key,
    required this.child,
    required this.bloc,
  }) : super(key: key);

  final Widget child;
  final T bloc;

  @override
   _BlocProvider1State<T> createState() => _BlocProvider1State<T>();

  static T? of<T extends BlocBase>(BuildContext context) {
    var provider =
        context.findAncestorWidgetOfExactType<_BlocProviderInherited<T>>();
    return provider?.bloc;
  }
}

class _BlocProvider1State<T extends BlocBase> extends State<BlocProvider1<T>> {
  @override
  void dispose() {
    widget.bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _BlocProviderInherited<T>(
      bloc: widget.bloc,
      child: widget.child,
    );
  }
}

class _BlocProviderInherited<T> extends InheritedWidget {
   _BlocProviderInherited({
    Key? key,
    required Widget child,
    required this.bloc,
  }) : super(key: key, child: child);

  final T bloc;

  @override
  bool updateShouldNotify(_BlocProviderInherited oldWidget) => false;
}
