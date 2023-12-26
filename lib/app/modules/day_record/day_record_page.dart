import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../core/extensions/theme_extension.dart';

import '../../core/life_cycle/page_life_cicle_state.dart';

import '../../core/ui/widgets/custom_app_bar.dart';
import 'widgets/day_record_list_item.dart';

import '../../modules/day_record/day_record_store.dart';

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
      appBar: CustomAppBar(
        title: widget.title,
        titleWidget: const Icon(
          Icons.menu,
          color: Color(0xFF405965),
          size: 30.0,
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Observer(
                    builder: (_) => Text(
                      'Você possui ${store.dayRecords.length} registro(s) de ponto.',
                      textAlign: TextAlign.center,
                      style: context.textTheme.headlineMedium,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Observer(
                builder: (context) => RefreshIndicator(
                  onRefresh: store.getDayRecords,
                  child: ListView(
                    shrinkWrap: true,
                    children: store.dayRecords.map((dayRecord) {
                      return DayRecordListItem(dayRecord: dayRecord);
                    }).toList(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
