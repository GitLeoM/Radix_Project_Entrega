import 'package:flutter/material.dart';
import 'package:radix_entrega_project/Components/button_white.dart';

import '../Components/button.dart';
import '../Components/image_container.dart';
import '../Utils/app_routes.dart';

class ReportScreen extends StatelessWidget {
  final nomeDeliveryManController = TextEditingController();
  final tipoProblemaController = TextEditingController();
  final mensagemClienteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _bottomSheet(BuildContext context) {
      return showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (_) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .90,
            child: LayoutBuilder(
              builder: (context, constraints) {
                return ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(40),
                    topLeft: Radius.circular(40),
                  ),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(132, 202, 157, 1),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: constraints.maxHeight * .05),
                        Center(
                          child: Text(
                            'Pedimos desculpas pelo transtorno!',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: constraints.maxHeight * .05,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(height: constraints.maxHeight * .12),
                        ImageContainer(
                          'assets/svg/tela_relatar_problema.svg',
                          constraints.maxHeight * .4,
                        ),
                        SizedBox(height: constraints.maxHeight * .12),
                        ButtonWhite(
                          text: 'Tela inicial',
                          onTap: () => Navigator.of(context)
                              .pushReplacementNamed(AppRoutes.HOMETAB),
                          height: constraints.maxHeight * .08,
                          width: constraints.maxWidth * .7,
                          color: false,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        },
      );
    }

    return Scaffold(
      backgroundColor: Color.fromRGBO(229, 229, 229, 1),
      resizeToAvoidBottomInset: false,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Container(
            width: constraints.maxWidth * .92,
            padding: EdgeInsets.only(left: constraints.maxWidth * .07),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: constraints.maxHeight * .03),
                Center(
                  child: SizedBox(
                    height: constraints.maxHeight * .09,
                    width: constraints.maxWidth * .95,
                    child: TextField(
                      controller: nomeDeliveryManController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.white,
                              width: constraints.maxWidth * .03),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(25),
                          ),
                        ),
                        hintText: 'Seu nome',
                        hintStyle: const TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: SizedBox(
                    height: constraints.maxHeight * .09,
                    width: constraints.maxWidth * .95,
                    child: TextField(
                      controller: tipoProblemaController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.white,
                              width: constraints.maxWidth * .03),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(25),
                          ),
                        ),
                        hintText: 'Tipo de problema',
                        hintStyle: const TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: constraints.maxHeight * .46,
                  width: constraints.maxWidth * .95,
                  child: TextField(
                    controller: mensagemClienteController,
                    maxLines: null,
                    textAlignVertical: TextAlignVertical.top,
                    expands: true,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.white,
                            width: constraints.maxWidth * .03),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      hintText: 'Digite sua mensagem',
                      hintStyle: const TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
                Button(
                  text: 'Relatar o problema',
                  onTap: () {
                    _bottomSheet(context);
                  },
                  height: constraints.maxHeight * .09,
                  width: constraints.maxWidth * .7,
                  color: true,
                ),
                ButtonWhite(
                  text: 'Limpar Campos',
                  onTap: () {},
                  height: constraints.maxHeight * .09,
                  width: constraints.maxWidth * .7,
                  color: false,
                ),
                SizedBox(
                  height: constraints.minHeight * .04,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
