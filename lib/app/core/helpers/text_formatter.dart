import 'package:intl/intl.dart';

class TextFormatter {
  static final _formatRealPattern =
      NumberFormat.currency(locale: 'pt_BR', symbol: r'R$');

  TextFormatter._();

  static String formatReal(double value) => _formatRealPattern.format(value);
  //formatar datas
  static String formatDate(String date) {
    if (date == '') return '-';

    final dateFormated = DateTime.parse(date);
    final formatter = DateFormat('dd/MM/yyyy');
    return formatter.format(dateFormated);
  }

  //formata data hora
  static String formatDateTime(String date) {
    if (date == '') return '-';

    final dateFormated = DateTime.parse(date);
    final formatter = DateFormat('dd/MM/yyyy HH:mm');
    return formatter.format(dateFormated);
  }
}
