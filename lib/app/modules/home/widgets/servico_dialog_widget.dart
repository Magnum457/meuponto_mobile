import 'package:flutter/material.dart';
import 'package:meuponto_mobile/app/core/extensions/theme_extension.dart';

class ServicoDialogWidget extends StatelessWidget {
  final bool emBreve;
  final String descricao;
  final Function()? onTap;

  const ServicoDialogWidget({
    super.key,
    this.descricao = '-',
    this.emBreve = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Column(
        children: [
          InkWell(
            onTap: onTap,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: context.verdeCinzaCard,
                  width: 2,
                ),
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: SizedBox(
                        width: constraints.maxWidth * 0.9,
                        child: Container(
                          height: constraints.maxWidth * 0.5,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Image.asset(
                            'assets/icons/indicacao.png',
                            width: 60,
                            height: 60,
                          ),
                        ),
                      ),
                    ),
                  ),
                  if (emBreve)
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.2,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: context.verdeCinzaCard,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          'Em breve',
                          style: context.textTheme.bodyLarge,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Text(
                descricao,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: emBreve
                      ? const Color(0xFF405965).withOpacity(0.5)
                      : const Color(0xFF405965),
                  fontSize: 14,
                  fontFamily: 'Kanit',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
