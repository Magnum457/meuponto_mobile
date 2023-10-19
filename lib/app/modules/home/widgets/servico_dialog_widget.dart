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
      builder: (context, constraints) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: InkWell(
          onTap: onTap,
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        width: 1,
                      ),
                    ),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: SizedBox(
                              width: constraints.maxWidth * 0.8,
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
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Text(
                            descricao,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: emBreve
                                  ? const Color.fromARGB(255, 20, 21, 22)
                                      .withOpacity(0.5)
                                  : const Color.fromARGB(255, 20, 21, 22),
                              fontSize: 14,
                              fontFamily: 'Kanit',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (emBreve)
                    Positioned(
                      top: 0,
                      right: 0,
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
            ],
          ),
        ),
      ),
    );
  }
}
