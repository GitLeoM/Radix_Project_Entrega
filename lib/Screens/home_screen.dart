import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:radix_entrega_project/Components/transaction_form.dart';

import '../Components/button.dart';

import '../Data/dummy_data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var list = DUMMY_Delivery;
  int i = 1;

  _setButton() {
    setState(() {
      DUMMY_Delivery.elementAt(i).statusOnOff =
          !DUMMY_Delivery.elementAt(i).statusOnOff;
    });
  }

  _buttonOn() {
    return Button(
      text: 'Entregar',
      onTap: () {
        _setButton();
      },
      height: 50,
      width: 320,
      color: true,
    );
  }

  _buttonOff() {
    return Button(
      text: 'Parar',
      onTap: () {
        _setButton();
      },
      height: 45,
      width: 100,
      color: false,
      fontSize: 15,
    );
  }

  _screenChange(BoxConstraints constraints) {
    {
      if (DUMMY_Delivery.elementAt(i).statusOnOff == false) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 22, top: 44),
                  child: Text(
                    onOff(list.elementAt(i).statusOnOff),
                    style: onlineOff(
                      context,
                      list.elementAt(i).statusOnOff,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 30,
              ),
              child: Text(
                'Bem-Vindo, ${list.elementAt(i).nome}!',
                style: const TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(top: 30), child: _buttonOn()),
            SizedBox(height: constraints.maxHeight * .10),
            Text(
              'Não há entregas ainda!',
              style: TextStyle(
                fontSize: constraints.maxHeight * .03,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: constraints.maxHeight * .05),
            SvgPicture.asset(
              'assets/svg/undraw_deliveries_2r4y.svg',
              height: constraints.maxHeight * .25,
            ),
            SizedBox(height: constraints.maxHeight * .04),
          ],
        );
      } else {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: constraints.maxWidth * .045,
                      top: constraints.maxHeight * .045),
                  child: Row(
                    children: [
                      Text(
                        onOff(list.elementAt(i).statusOnOff),
                        style: onlineOff(
                          context,
                          list.elementAt(i).statusOnOff,
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(left: constraints.maxWidth * .52),
                        child: _buttonOff(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 30,
              ),
              child: Text(
                'Bem-Vindo, ${list.elementAt(i).nome}!',
                style: const TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
            SizedBox(height: constraints.maxHeight * .2),
            Text(
              'Não há entregas ainda!',
              style: TextStyle(
                fontSize: constraints.maxHeight * .03,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: constraints.maxHeight * .05),
            SvgPicture.asset(
              'assets/svg/undraw_deliveries_2r4y.svg',
              height: constraints.maxHeight * .25,
            ),
            SizedBox(height: constraints.maxHeight * .04),
          ],
        );
      }
    }
  }

  _openTransactionForm(BuildContext context) {
    showModalBottomSheet(
        elevation: 10,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        context: context,
        builder: (_) {
          return TransactionForm();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              _openTransactionForm(context);
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: _screenChange(constraints)),
          );
        },
      ),
      drawer: Drawer(
        child: LayoutBuilder(
          builder: ((context, constraints) => Container(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: constraints.minHeight * .05),
                    Row(
                      children: [
                        Switch(
                          value: false,
                          onChanged: (t) {},
                          activeColor: const Color.fromRGBO(132, 202, 157, 1),
                        ),
                        const Text('Configuração 1')
                      ],
                    ),
                    Row(
                      children: [
                        Switch(
                          value: false,
                          onChanged: (t) {},
                          activeColor: const Color.fromRGBO(132, 202, 157, 1),
                        ),
                        const Text('Configuração 2')
                      ],
                    ),
                    Row(
                      children: [
                        Switch(
                          value: false,
                          onChanged: (t) {},
                          activeColor: const Color.fromRGBO(132, 202, 157, 1),
                        ),
                        const Text('Configuração 3')
                      ],
                    ),
                    Row(
                      children: [
                        Switch(
                          value: false,
                          onChanged: (t) {},
                          activeColor: const Color.fromRGBO(132, 202, 157, 1),
                        ),
                        const Text('Configuração 4')
                      ],
                    ),
                    Row(
                      children: [
                        Switch(
                          value: false,
                          onChanged: (t) {},
                          activeColor: const Color.fromRGBO(132, 202, 157, 1),
                        ),
                        const Text('Configuração 5')
                      ],
                    ),
                    Row(
                      children: [
                        Switch(
                          value: false,
                          onChanged: (t) {},
                          activeColor: const Color.fromRGBO(132, 202, 157, 1),
                        ),
                        const Text('Configuração 6')
                      ],
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
