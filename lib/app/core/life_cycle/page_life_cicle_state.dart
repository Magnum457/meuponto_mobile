import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'controller_life_cycle.dart';

abstract class PageLifeCycleState<C extends ControllerLifeCycle,
    P extends StatefulWidget> extends State<P> {
  final store = Modular.get<C>();
  Map<String, dynamic>? get params => null;

  @override
  void initState() {
    super.initState();
    store.onInit(params);
    WidgetsBinding.instance.addPostFrameCallback((_) => store.onReady());
  }

  @override
  void dispose() {
    store.dispose();
    super.dispose();
  }
}
