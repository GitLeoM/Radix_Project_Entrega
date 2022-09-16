import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../Components/button.dart';
import '../Components/button_white.dart';
import '../Components/image_container.dart';
import '../Utils/app_routes.dart';

class AddCarScreen extends StatelessWidget {
  const AddCarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final nomeVeiculoController = TextEditingController();
    final marcaVeiculoController = TextEditingController();
    final placaClienteController = TextEditingController();
    final anoClienteController = TextEditingController();

    Widget _sizedBox(BoxConstraints constraints, double width, String text,
        TextEditingController txtControl) {
      return SizedBox(
        height: constraints.maxHeight * .09,
        width: width,
        child: TextField(
          controller: txtControl,
          maxLines: null,
          textAlignVertical: TextAlignVertical.top,
          expands: true,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.white, width: constraints.maxWidth * .03),
              borderRadius: const BorderRadius.all(
                Radius.circular(25),
              ),
            ),
            hintText: text,
            hintStyle: const TextStyle(
              fontSize: 12,
            ),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
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
                      controller: nomeVeiculoController,
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
                        hintText: 'Nome do veículo',
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
                      controller: marcaVeiculoController,
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
                        hintText: 'Marca',
                        hintStyle: const TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _sizedBox(constraints, constraints.maxWidth * .50, 'Placa',
                        placaClienteController),
                    _sizedBox(constraints, constraints.maxWidth * .3, 'Ano',
                        anoClienteController),
                  ],
                ),

                Button(
                  text: 'Cadastrar veículo',
                  onTap: () {
                    showModalBottomSheet(
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                          height: constraints.maxHeight * .05),
                                      Center(
                                        child: Text(
                                          'Veículo cadastrado com sucesso!',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize:
                                                constraints.maxHeight * .05,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                          height: constraints.maxHeight * .12),
                                      ImageContainer(
                                        'assets/svg/tela_de_veiculo_cadastrado.svg',
                                        constraints.maxHeight * .4,
                                      ),
                                      SizedBox(
                                          height: constraints.maxHeight * .15),
                                      ButtonWhite(
                                        text: 'Tela inicial',
                                        onTap: () => Navigator.of(context)
                                            .pushReplacementNamed(
                                                AppRoutes.HOMETAB),
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
                  },
                  height: constraints.maxHeight * .09,
                  width: constraints.maxWidth * .7,
                  color: true,
                ),
                // SizedBox(height: constraints.maxHeight * .03),
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
