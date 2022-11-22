import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:radix_entrega_project/Model/delivery_man.dart';
import 'package:radix_entrega_project/Screens/tabs_screen_home.dart';
import 'package:radix_entrega_project/components/button.dart';
import 'package:radix_entrega_project/Providers/delivery_man_provider.dart';
import 'package:radix_entrega_project/Utils/app_routes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Providers/carro_provider.dart';
import '../Utils/sharedPreferencesConstants.dart';

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
  final idadeFormController = TextEditingController();
  final rgFormController = TextEditingController();
  bool showPassword = false;
  bool _checkValue = false;

  Future<void> getLoginInfo(
      String email, String senha, constraints, bool manterLogin) async {
    try {
      var response = await Dio(BaseOptions(sendTimeout: 2000))
          .get('http://127.0.0.1:8000/api/loginEntregador/$email/$senha');
      SharedPreferences prefs = await SharedPreferences.getInstance();

      String loginResult = response.data['loginResult'];
      print(response.data);
      print(response.data['user']['idEntregador']);

      if (loginResult == '1') {
        Provider.of<VeiculoProvider>(context, listen: false)
            .loadCarrosVendedor(response.data['user']['idEntregador']);
        Provider.of<DeliveryManProvider>(context, listen: false)
            .getEntregador(response.data['user']['idEntregador']);
        print(Provider.of<DeliveryManProvider>(context, listen: false)
            .getEntregadores());

        DeliveryMan user = DeliveryMan(
            id: response.data['user']['idEntregador'],
            nome: response.data['user']['nome'],
            cpf: response.data['user']['cpf'],
            email: response.data['user']['email'],
            senha: response.data['user']['senha'],
            idade: response.data['user']['idade'],
            rg: response.data['user']['rg'],
            urlImage: response.data['user']['foto'],
            statusConta: response.data['user']['statusConta']);
        prefs.setBool(SharedPreferencesConstants.manterLogin, manterLogin);
        Navigator.pushReplacementNamed(context, AppRoutes.HOMETAB);
        Provider.of<DeliveryManProvider>(context, listen: false)
            .changeUser(user);
      } else {
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: Text(loginResult,
                style: TextStyle(fontSize: constraints.maxWidth * .04)),
          ),
        );
      }
    } catch (e) {
      print(e);
    }
  }

  void createEntregador(String senha, String validaSenha, String nome,
      String cpf, String email, int idade, String rg, constraints) async {
    try {
      if (senhaFormController.text == senhaFormValidationController.text) {
        var response = await Dio().post(
          'http://127.0.0.1:8000/api/addEntregador',
          data: {
            'nome': nome,
            'cpf': cpf,
            'email': email,
            'senha': senha,
            'statusConta': '1',
            'idade': idade,
            'rg': rg,
            'foto': '',
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

  Widget _textField(double height, double width, BoxConstraints constraints,
      String text, TextEditingController controller, bool obscure) {
    return SizedBox(
      height: height,
      width: width,
      child: TextField(
        obscureText: obscure,
        obscuringCharacter: '*',
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

  Widget _textField2(double height, double width, BoxConstraints constraints,
      String text, TextEditingController controller, bool obscure) {
    return SizedBox(
      height: height,
      width: width,
      child: TextField(
        obscureText: showPassword ? !obscure : obscure,
        obscuringCharacter: '*',
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
          suffixIcon: InkWell(
            onTap: () {
              setState(() {
                showPassword = !showPassword;
              });
            },
            child: Icon(
              showPassword ? Icons.visibility_off : Icons.visibility,
              color: Theme.of(context).colorScheme.primary,
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

  void _openAdClientModalSheet(BuildContext context) {
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
                          constraints.maxHeight * .08,
                          constraints.maxWidth * .90,
                          constraints,
                          'Nome',
                          nomeFormController,
                          false),
                      SizedBox(height: constraints.maxHeight * .02),
                      _textField(
                          constraints.maxHeight * .08,
                          constraints.maxWidth * .90,
                          constraints,
                          'Email',
                          emailFormController,
                          false),
                      SizedBox(height: constraints.maxHeight * .02),
                      _textField(
                          constraints.maxHeight * .08,
                          constraints.maxWidth * .90,
                          constraints,
                          'CPF',
                          cpfFormController,
                          false),
                      SizedBox(height: constraints.maxHeight * .02),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _textField(
                              constraints.maxHeight * .08,
                              constraints.maxWidth * .67,
                              constraints,
                              'RG',
                              rgFormController,
                              false),
                          SizedBox(width: constraints.maxWidth * .03),
                          _textField(
                              constraints.maxHeight * .08,
                              constraints.maxWidth * .20,
                              constraints,
                              'Idade',
                              senhaFormController,
                              false),
                        ],
                      ),
                      SizedBox(height: constraints.maxHeight * .02),
                      _textField(
                          constraints.maxHeight * .08,
                          constraints.maxWidth * .90,
                          constraints,
                          'Senha',
                          senhaFormController,
                          false),
                      SizedBox(height: constraints.maxHeight * .02),
                      _textField(
                          constraints.maxHeight * .08,
                          constraints.maxWidth * .90,
                          constraints,
                          'confirme sua senha',
                          senhaFormValidationController,
                          false),
                      SizedBox(height: constraints.maxHeight * .02),
                      SizedBox(height: constraints.maxHeight * .10),
                      Button(
                        text: 'Registrar-se',
                        onTap: () => createEntregador(
                          senhaFormController.text,
                          senhaFormValidationController.text,
                          nomeFormController.text,
                          cpfFormController.text,
                          emailFormController.text,
                          int.parse(idadeFormController.text),
                          rgFormController.text,
                          constraints,
                        ),
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
                    emailController,
                    false),
                SizedBox(height: constraints.maxHeight * .01),
                _textField2(
                    constraints.maxHeight * .08,
                    constraints.maxWidth * .90,
                    constraints,
                    'Senha',
                    senhaController,
                    true),
                SizedBox(height: constraints.maxHeight * .01),
                SizedBox(
                  width: constraints.maxWidth * .54,
                  child: CheckboxListTile(
                    value: _checkValue,
                    onChanged: (bool? value) {
                      setState(() {
                        _checkValue = !_checkValue;
                      });
                    },
                    title: const Text(
                      'Manter Conectado?',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    activeColor: Theme.of(context).colorScheme.primary,
                  ),
                ),
                SizedBox(height: constraints.maxHeight * .01),
                Button(
                  text: 'Entrar',
                  onTap: () {
                    getLoginInfo(
                      emailController.text,
                      senhaController.text,
                      constraints,
                      _checkValue,
                    );
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
                      'Ainda não tem uma conta?',
                      style: TextStyle(
                          fontSize: constraints.maxHeight * .02,
                          color: Colors.black,
                          fontWeight: FontWeight.w700),
                    ),
                    InkWell(
                      onTap: () => _openAdClientModalSheet(context),
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
