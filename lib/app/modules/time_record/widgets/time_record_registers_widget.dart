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
          height: MediaQuery.of(context).size.height * 0.14,
          decoration: BoxDecoration(
            color: const Color(0xFFC8D7D2),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Center(
            child: store.timeRecords.isNotEmpty
                ? GridView.builder(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 20,
                      childAspectRatio: 4,
                    ),
                    itemCount: store.timeRecords.length,
                    itemBuilder: (context, index) {
                      var timeRecords = store.timeRecords.toList();
                      var timeRecord = timeRecords[index];
                      return Column(
                        children: [
                          Text(
                            timeRecord.registerType.descricao,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.roboto(
                              color: const Color(0xFF405965),
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            timeRecord.getHorasMinutos(),
                          ),
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
