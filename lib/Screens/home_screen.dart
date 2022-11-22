import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import 'package:radix_entrega_project/Components/transaction_form.dart';
import 'package:radix_entrega_project/Model/delivery_man.dart';
import 'package:radix_entrega_project/Providers/delivery_man_provider.dart';
import 'package:radix_entrega_project/Providers/pedido_provider.dart';

import '../Components/button.dart';

import '../Data/dummy_data.dart';
import '../Providers/carro_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isLoading = true;

  _setButton() {
    setState(() {
      DUMMY_OnOFF.elementAt(0).onOff = !DUMMY_OnOFF.elementAt(0).onOff;
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

  _screenChange(BoxConstraints constraints, String nome) {
    {
      var sOF = DUMMY_OnOFF.elementAt(0).onOff;

      if (sOF == false) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: constraints.maxWidth * .045,
                      top: constraints.maxHeight * .065),
                  child: Text(
                    onOff(sOF),
                    style: onlineOff(
                      context,
                      sOF,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                top: constraints.maxHeight * .1,
              ),
              child: Text(
                'Bem-Vindo, $nome!',
                style: const TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(top: constraints.maxHeight * .05),
                child: _buttonOn()),
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
                        onOff(sOF),
                        style: onlineOff(
                          context,
                          sOF,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: constraints.maxWidth *
                                .54), //padding do botão de parar
                        child: _buttonOff(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                top: constraints.maxHeight * .1,
              ),
              child: Text(
                'Bem-Vindo, $nome!',
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
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<PedidoProvider>(context, listen: false).loadPedidos();
    Provider.of<VeiculoProvider>(context, listen: false)
        .loadCarrosVendedor(context.watch<DeliveryManProvider>().getUser.id);
    Provider.of<DeliveryManProvider>(context, listen: false)
        .getEntregador(context.watch<DeliveryManProvider>().getUser.id)
        .then((value) {
      setState(() {
        _isLoading = false;
      });
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
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: _screenChange(
                        constraints,
                        context.watch<DeliveryManProvider>().getUser.nome,
                      )),
                );
              },
            ),
    );
  }
}
