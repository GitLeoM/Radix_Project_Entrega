import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:radix_entrega_project/Model/delivery_man.dart';

import '../Components/profile_button.dart';
import '../Data/dummy_data.dart';
import '../Providers/delivery_man_provider.dart';
import '../Utils/app_routes.dart';

class EditProfile extends StatelessWidget {
  EditProfile({Key? key}) : super(key: key);

  final nomeController = TextEditingController();
  final emailController = TextEditingController();
  final senhaController = TextEditingController();
  final senhaConfController = TextEditingController();

  void updateEntregador(String senha, String validaSenha, String nome,
      String email, constraints, BuildContext context) async {
    try {
      if (senhaController.text == senhaConfController.text) {
        var response = await Dio().patch(
          'http://127.0.0.1:8000/api/updateEntregador/${Provider.of<DeliveryManProvider>(context, listen: false).getUser.id}',
          data: {
            'nome': nome,
            'email': email,
            'senha': senha,
            'statusConta': '1',
          },
        );
        if (response.data['status'] == '400') {
          showDialog(
            context: context,
            builder: (_) => AlertDialog(
              title: Text(response.data['message'],
                  style: TextStyle(fontSize: constraints.maxWidth * .04)),
            ),
          );
        } else {
          print(response.data['message']);
          Navigator.of(context).pop();
        }
      } else {
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: Text('As senhas não são iguais',
                style: TextStyle(fontSize: constraints.maxWidth * .04)),
          ),
        );
      }
    } catch (e) {
      print(e);
    }
  }

  Widget _centerBox(BoxConstraints constraints, String text,
      TextEditingController txtControl, bool icon) {
    if (icon == true) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            height: constraints.maxHeight * .09,
            width: constraints.maxWidth * .86,
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
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.remove_red_eye_outlined,
              color: Color.fromRGBO(132, 202, 157, 1),
            ),
          )
        ],
      );
    } else {
      return SizedBox(
        height: constraints.maxHeight * .09,
        width: constraints.maxWidth * .95,
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
            icon: icon
                ? IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.remove_red_eye_outlined,
                      color: Color.fromRGBO(132, 202, 157, 1),
                    ),
                  )
                : null,
            hintStyle: const TextStyle(
              fontSize: 12,
            ),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    int i = 1;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: LayoutBuilder(
        builder: ((context, constraints) {
          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: constraints.maxHeight * .3,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(132, 202, 157, 1),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: constraints.maxHeight * .05,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              'Voltar',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: constraints.maxWidth * .02),
                            child: Text(
                              'Editar',
                              style: TextStyle(
                                  fontSize: constraints.maxWidth * .1,
                                  color: Colors.white),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              updateEntregador(
                                  senhaController.text,
                                  senhaConfController.text,
                                  nomeController.text,
                                  emailController.text,
                                  constraints,
                                  context);
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              'Salvar',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: constraints.maxWidth * .06,
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Container(
                              height: constraints.maxHeight * .16,
                              width: constraints.maxWidth * .272,
                              color: Colors.white,
                              child: Image.asset('assets/images/semfoto.png'),
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            iconSize: constraints.maxHeight * .04,
                            padding: EdgeInsets.only(
                                top: constraints.maxHeight * .1,
                                right: constraints.maxWidth * .04),
                            icon: Icon(
                              Icons.edit,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: constraints.maxHeight * .03),
                _centerBox(constraints, 'Nome', nomeController, false),
                SizedBox(height: constraints.maxHeight * .05),
                _centerBox(constraints, 'E-mail', emailController, false),
                SizedBox(height: constraints.maxHeight * .05),
                _centerBox(constraints, 'Senha', senhaController, true),
                SizedBox(height: constraints.maxHeight * .05),
                _centerBox(constraints, 'Confirme sua senha',
                    senhaConfController, true),
              ],
            ),
          );
        }),
      ),
    );
  }
}
