import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:radix_entrega_project/Model/delivery_man.dart';
import 'package:radix_entrega_project/components/button.dart';
import 'package:radix_entrega_project/Providers/delivery_man_provider.dart';
import 'package:radix_entrega_project/Utils/app_routes.dart';

import '../Model/delivery_man.dart';

class WellcomeBackScreen extends StatefulWidget {
  @override
  State<WellcomeBackScreen> createState() => _WelcomeBackScreenState();
}

class _WelcomeBackScreenState extends State<WellcomeBackScreen> {
  final emailController = TextEditingController();
  final senhaController = TextEditingController();
  final senhaFormController = TextEditingController();
  final senhaFormValidationController = TextEditingController();
  final nomeFormController = TextEditingController();
  final emailFormController = TextEditingController();
  final cpfFormController = TextEditingController();

  DeliveryMan _x(String n, String c, String e, String s) {
    DeliveryMan deliMan = DeliveryMan(
      id: Random().nextDouble().toInt(),
      nome: n,
      cpf: c,
      email: e,
      senha: s,
      statusConta: true,
    );

    return deliMan;
  }

  Widget _textField(double height, double width, BoxConstraints constraints,
      String text, TextEditingController controller) {
    return SizedBox(
      height: height,
      width: width,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: Colors.white, width: constraints.maxWidth * .03),
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          hintText: text,
          hintStyle: TextStyle(
            fontSize: constraints.maxHeight * .02,
          ),
        ),
      ),
    );
  }

  void _openAddAdressModalSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * .75,
          child: LayoutBuilder(
            builder: (context, constraints) {
              return ClipRRect(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(40),
                  topLeft: Radius.circular(40),
                ),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(238, 238, 238, 1),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: constraints.maxHeight * .05),
                      Center(
                        child: Text(
                          'Bem-Vindo a bordo!',
                          style: TextStyle(
                            fontSize: constraints.maxHeight * .035,
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ),
                      SizedBox(height: constraints.maxHeight * .08),
                      _textField(
                          constraints.maxHeight * .1,
                          constraints.maxWidth * .90,
                          constraints,
                          'Seu nome',
                          nomeFormController),
                      SizedBox(height: constraints.maxHeight * .02),
                      _textField(
                          constraints.maxHeight * .1,
                          constraints.maxWidth * .90,
                          constraints,
                          'Seu email',
                          emailFormController),
                      SizedBox(height: constraints.maxHeight * .02),
                      _textField(
                          constraints.maxHeight * .1,
                          constraints.maxWidth * .90,
                          constraints,
                          'Seu cpf',
                          cpfFormController),
                      SizedBox(height: constraints.maxHeight * .02),
                      _textField(
                          constraints.maxHeight * .1,
                          constraints.maxWidth * .90,
                          constraints,
                          'Senha',
                          senhaFormController),
                      SizedBox(height: constraints.maxHeight * .02),
                      _textField(
                          constraints.maxHeight * .1,
                          constraints.maxWidth * .90,
                          constraints,
                          'Confirme sua senha',
                          senhaFormValidationController),
                      SizedBox(height: constraints.maxHeight * .02),
                      SizedBox(height: constraints.maxHeight * .10),
                      Button(
                        text: 'Registrar-se',
                        onTap: () {
                          if (senhaFormController.text ==
                              senhaFormValidationController.text) {
                            Provider.of<DeliveryManProvider>(context,
                                    listen: false)
                                .addDeliMan(
                              _x(
                                  nomeFormController.text,
                                  cpfFormController.text,
                                  emailFormController.text,
                                  senhaFormController.text),
                            );
                          }

                          Navigator.of(context).pop();
                        },
                        height: constraints.maxHeight * .1,
                        width: constraints.maxWidth * .75,
                        color: true,
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromRGBO(238, 238, 238, 1),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Center(child: Image.asset('assets/images/bolas_verdes.png')),
                SizedBox(height: constraints.maxHeight * .001),
                Text(
                  'Bem-vindo de volta!',
                  style: TextStyle(
                    fontSize: constraints.maxHeight * .03,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: constraints.maxHeight * .03),
                SvgPicture.asset(
                  'assets/svg/undraw_login.svg',
                  height: constraints.maxHeight * .25,
                ),
                SizedBox(height: constraints.maxHeight * .04),
                _textField(
                    constraints.maxHeight * .08,
                    constraints.maxWidth * .90,
                    constraints,
                    'Email',
                    emailController),
                SizedBox(height: constraints.maxHeight * .01),
                _textField(
                    constraints.maxHeight * .08,
                    constraints.maxWidth * .90,
                    constraints,
                    'Senha',
                    senhaController),
                SizedBox(height: constraints.maxHeight * .03),
                Button(
                  text: 'Entrar',
                  onTap: () {
                    final provider = Provider.of<DeliveryManProvider>(context,
                        listen: false);
                    List l = provider.loginValidate(
                        emailController.text, senhaController.text);
                    if (l[0]) {
                      DeliveryMan deliMan = l[1];
                      deliMan.setIsUser = true;
                      Navigator.of(context)
                          .pushReplacementNamed(AppRoutes.HOMETAB);
                    }
                  },
                  height: constraints.maxHeight * .07,
                  width: constraints.maxWidth * .7,
                  color: true,
                ),
                SizedBox(height: constraints.maxHeight * .03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Ainda não tem uma conta ?',
                      style: TextStyle(
                          fontSize: constraints.maxHeight * .02,
                          color: Colors.black,
                          fontWeight: FontWeight.w700),
                    ),
                    InkWell(
                      onTap: () => _openAddAdressModalSheet(context),
                      child: Text(
                        '   Clique aqui',
                        style: TextStyle(
                          fontSize: constraints.maxHeight * .02,
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: constraints.maxHeight * .01),
                InkWell(
                  onTap: () {},
                  child: Text(
                    'Esqueci minha senha',
                    style: TextStyle(
                      fontSize: constraints.maxHeight * .02,
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(height: constraints.maxHeight * .1),
              ],
            ),
          );
        },
      ),
    );
  }
}
