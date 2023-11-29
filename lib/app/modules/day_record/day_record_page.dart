import 'package:flutter/material.dart';
import 'package:meuponto_mobile/app/core/life_cycle/page_life_cicle_state.dart';

import 'package:meuponto_mobile/app/core/ui/widgets/custom_app_bar.dart';
import 'package:meuponto_mobile/app/modules/day_record/day_record_store.dart';

class DayRecordPage extends StatefulWidget {
  final String title;
  const DayRecordPage({super.key, this.title = 'Lista de Pontos do dia'});

  @override
  State<DayRecordPage> createState() => _DayRecordPageState();
}

class _DayRecordPageState
    extends PageLifeCycleState<DayRecordStore, DayRecordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: widget.title),
      backgroundColor: Colors.white,
      body: const SafeArea(
        child: Center(
          child: Column(
            children: [
              Text('Você não tem nenhum ponto registrado'),
            ],
          ),
        ),
      ),
    );
  }
}
