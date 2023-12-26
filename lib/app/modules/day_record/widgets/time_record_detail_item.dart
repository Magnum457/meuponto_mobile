import 'package:flutter/material.dart';

import '../../../models/time_record_model.dart';

class TimeRecordDetailItem extends StatelessWidget {
  final TimeRecordModel timeRecord;

  const TimeRecordDetailItem({super.key, required this.timeRecord});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
      child: ListTile(
        horizontalTitleGap: 0,
        title: Row(
          children: [
            Text(timeRecord.getHorasMinutos()),
          ],
        ),
        subtitle: Row(
          children: [
            Text(timeRecord.registerType.descricao),
          ],
        ),
      ),
    );
  }
}
