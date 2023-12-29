part of '../time_record_page.dart';

class _CustomRadioButtonWidget extends StatelessWidget {
  final TimeRecordStore store;
  final String descricao;
  final int registerTypeId;
  const _CustomRadioButtonWidget(
    this.store,
    this.descricao,
    this.registerTypeId,
  );

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => TextButton(
        style: ButtonStyle(
          backgroundColor: (registerTypeId == store.registerType?.id)
              ? const MaterialStatePropertyAll(
                  Color.fromARGB(255, 106, 193, 145))
              : const MaterialStatePropertyAll(Color(0xFFC8D7D2)),
        ),
        onPressed: () {
          store.setRegisterType(descricao, registerTypeId);
        },
        child: Text(
          descricao,
          style: GoogleFonts.roboto(
            color: const Color(0xFF405965),
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
