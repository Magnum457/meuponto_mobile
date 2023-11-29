import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/life_cycle/page_life_cicle_state.dart';

import '../../core/ui/widgets/custom_app_bar.dart';

import 'time_record_store.dart';

part 'widgets/time_record_registers_widget.dart';

class TimeRecordPage extends StatefulWidget {
  final String title;
  const TimeRecordPage({Key? key, this.title = 'Registrar Ponto'})
      : super(key: key);

  @override
  State<TimeRecordPage> createState() => _TimeRecordPageState();
}

class _TimeRecordPageState
    extends PageLifeCycleState<TimeRecordStore, TimeRecordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: widget.title),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [_TimeRecordRegistersWidget(store)],
        ),
      ),
    );
  }
}
