import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:meuponto_mobile/app/modules/day_record/widgets/time_record_detail_item.dart';

import '../../../core/extensions/theme_extension.dart';
import '../../../core/life_cycle/page_life_cicle_state.dart';

import '../../../core/ui/widgets/custom_app_bar.dart';

import 'day_record_detail_store.dart';

class DayRecordDetailPage extends StatefulWidget {
  final String _dayRecordId;
  final String title;
  const DayRecordDetailPage({
    super.key,
    required String dayRecordId,
    this.title = 'Detalhes do Registro do Dia',
  }) : _dayRecordId = dayRecordId;

  @override
  State<DayRecordDetailPage> createState() => _DayRecordDetailPageState();
}

class _DayRecordDetailPageState
    extends PageLifeCycleState<DayRecordDetailStore, DayRecordDetailPage> {
  @override
  Map<String, dynamic>? get params => {'dayRecordId': widget._dayRecordId};

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
        child: Column(
          children: [
            Text(
              'Registros do dia',
              style: context.textTheme.headlineMedium,
            ),
            Observer(
              builder: (context) => RefreshIndicator(
                onRefresh: store.getDayRecord,
                child: ListView(
                  shrinkWrap: true,
                  children: store.timeRecords.map((timeRecord) {
                    return TimeRecordDetailItem(timeRecord: timeRecord);
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
