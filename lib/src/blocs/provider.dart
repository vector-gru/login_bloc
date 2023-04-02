import 'package:flutter/material.dart';
import 'bloc.dart';

class Provider extends InheritedWidget {
 Provider({
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);

  final bloc = Bloc();

  @override
  bool updateShouldNotify(_) => true;
 
  // static Bloc of(BuildContext context) {
  //   return (context.inheritFromWidgetOfExactType(Provider) as Provider).bloc;
  // }
  static Bloc of(BuildContext context) {
    final provider = context.getElementForInheritedWidgetOfExactType<Provider>()?.widget as Provider;
    assert(provider != null, 'No Provider found in context');
    return provider.bloc;
  }

}