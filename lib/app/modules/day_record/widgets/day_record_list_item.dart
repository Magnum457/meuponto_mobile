import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../models/day_record_model.dart';

class DayRecordListItem extends StatelessWidget {
  final DayRecordModel dayRecord;

  const DayRecordListItem({super.key, required this.dayRecord});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
          side: const BorderSide(
            color: Colors.black,
            width: 0.05,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
                horizontalTitleGap: 0,
                leading: CircleAvatar(
                  radius: 15.0,
                  backgroundColor: Colors.white,
                  child: Icon(
                    dayRecord.pendingRecords() == 0
                        ? MdiIcons.check
                        : MdiIcons.close,
                    color: dayRecord.pendingRecords() == 0
                        ? const Color.fromARGB(255, 214, 230, 220)
                        : const Color.fromARGB(255, 241, 113, 113),
                    size: 15.0,
                  ),
                ),
                title: Row(
                  children: [
                    Expanded(
                      child: Text(
                        '${dayRecord.getReferenceDate()} [${dayRecord.getDiaDaSemana()}]',
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                    ),
                  ],
                ),
                subtitle: Text(
                  dayRecord.pendingRecords() == 0
                      ? 'registro válido'
                      : 'Você possui ${dayRecord.pendingRecords()} inconsistência(s).',
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  color: Color(0xFF405965),
                  size: 15.0,
                ),
                onTap: () {
                  Modular.to.pushNamed(
                      '/day_record/day_record_detail/${dayRecord.id}');
                }),
          ],
        ),
      ),
    );
  }
}
