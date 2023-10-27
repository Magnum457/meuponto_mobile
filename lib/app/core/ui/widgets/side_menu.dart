import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';

class SideMenu extends StatelessWidget {
  final String nome;
  final String cpf;

  const SideMenu({
    super.key,
    this.nome = 'nome',
    this.cpf = '11111111111',
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 30,
                  child: Image.asset('assets/images/detran_logo.png'),
                ),
                FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text(
                    nome,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.kanit(
                      color: const Color(0xFF405965),
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Text(
                  UtilBrasilFields.obterCpf(cpf),
                  textAlign: TextAlign.center,
                  style: GoogleFonts.kanit(
                    color: const Color(0xFF405965),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            color: Colors.black38,
            height: 20,
            thickness: 1,
            indent: 20,
            endIndent: 20,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ListTile(
                leading: const Icon(
                  Icons.privacy_tip_outlined,
                  color: Color(0xFF405965),
                  size: 25.0,
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Política de Privacidade',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.kanit(
                        color: const Color(0xFF405965),
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  Modular.to.pushNamed('/policy/');
                },
              ),
              const Divider(
                color: Colors.black38,
                height: 20,
                thickness: 1,
                indent: 20,
                endIndent: 20,
              ),
              ListTile(
                leading: const Icon(
                  Icons.logout_outlined,
                  color: Color(0xFF405965),
                  size: 25.0,
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Sair',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.kanit(
                        color: const Color(0xFF405965),
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  Modular.to.pushNamed('/login/');
                },
              ),
            ],
          ),
          Text(
            'SEDE DO DETRAN\nAV. GODOFREDO MACIEL, 2900 - MARAPONGA\nFORTALEZA, CE - CEP: 60710-903 ',
            textAlign: TextAlign.center,
            style: GoogleFonts.kanit(
              color: const Color(0xFF405965),
              fontSize: 10,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
