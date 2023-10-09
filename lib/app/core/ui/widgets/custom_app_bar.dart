import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meuponto_mobile/app/core/extensions/theme_extension.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.leading,
    this.title = '',
    this.titleWidget,
    this.fontSize = 18,
    this.showNotification = false,
    this.qtdeNotificacoes = 0,
  });

  final String title;
  final Widget? titleWidget;
  final Widget? leading;
  final bool showNotification;
  final double fontSize;
  final int qtdeNotificacoes;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AppBar(
        toolbarHeight: 70,
        title: Observer(
          builder: (_) => Text(
            title,
            textAlign: TextAlign.center,
            style: GoogleFonts.kanit(
              color: const Color(0xFF42B58E),
              fontSize: fontSize,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: leading ??
            Transform.translate(
              offset: const Offset(0, 0),
              child: IconButton(
                  icon: const BackButton(),
                  color: const Color(0xFF405965),
                  onPressed: () => Modular.to.pop(context)),
            ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4.0),
          child: Divider(
            color: context.verdeCinzaCard,
            thickness: 1.0,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size(
        double.infinity,
        70,
      );
}
