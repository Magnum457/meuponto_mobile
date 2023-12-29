part of '../time_record_page.dart';

class _TimeRecordRegistersWidget extends StatelessWidget {
  final TimeRecordStore store;
  const _TimeRecordRegistersWidget(this.store);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.05,
          vertical: 10.0,
        ),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.1,
          decoration: BoxDecoration(
            color: const Color(0xFFC8D7D2),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Center(
            child: store.timeRecords.isNotEmpty
                ? GridView.builder(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 60,
                      mainAxisSpacing: 20,
                      childAspectRatio: 4,
                    ),
                    itemCount: store.timeRecords.length,
                    itemBuilder: (context, index) {
                      var timeRecords = store.timeRecords.toList();
                      var timeRecord = timeRecords[index + 1];
                      return Column(
                        children: [
                          Text(timeRecord.registerType.descricao),
                          Text(timeRecord.time!.hour.toString()),
                        ],
                      );
                    },
                  )
                : Text(
                    'Nenhum Registro de Ponto no Dia',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.roboto(
                      color: const Color(0xFF405965),
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
