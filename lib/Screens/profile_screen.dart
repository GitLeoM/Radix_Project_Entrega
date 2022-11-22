import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:radix_entrega_project/Data/dummy_data.dart';
import 'package:radix_entrega_project/Utils/app_routes.dart';
import '../Components/profile_button.dart';
import '../Model/carro.dart';
import '../Model/delivery_man.dart';
import '../Providers/carro_provider.dart';
import '../Providers/delivery_man_provider.dart';

class ProfileScreen extends StatefulWidget {
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  void _goToCarsScreen(BuildContext context) {
    Navigator.of(context).pushNamed(
      AppRoutes.CARS,
    );
  }

  void _goToFeedbacksScreen(BuildContext context) {
    Navigator.of(context).pushNamed(
      AppRoutes.FEEDBACKS,
    );
  }

  @override
  Widget build(BuildContext context) {
    int i = 1;
    List<DeliveryMan> _entregador =
        Provider.of<DeliveryManProvider>(context).getEntregadores();
    List<Carro> _veiculos = Provider.of<VeiculoProvider>(context).getVeiculo();

    return Scaffold(
      body: LayoutBuilder(
        builder: ((context, constraints) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: constraints.maxHeight * .3,
                  decoration: const BoxDecoration(
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
                              Navigator.of(context)
                                  .pushNamed(AppRoutes.EDITARPERFIL);
                            },
                            child: const Text(
                              'Editar',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: constraints.maxWidth * .02),
                            child: Text(
                              'Perfil',
                              style: TextStyle(
                                  fontSize: constraints.maxWidth * .08,
                                  color: Colors.white),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .pushNamed(AppRoutes.WELCOMEBACK);
                            },
                            child: const Text(
                              'Sair',
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
                              width: constraints.maxWidth * .25,
                              color: Colors.white,
                              child: Image.asset('assets/images/semfoto.png'),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: constraints.maxWidth * .02,
                                  ),
                                  Text(
                                    'Nome:',
                                    style: TextStyle(
                                        fontSize: constraints.maxWidth * .037,
                                        color: Colors.black38,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    _entregador[0].nome,
                                    style: TextStyle(
                                        fontSize: constraints.maxWidth * .037,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: constraints.maxHeight * .02,
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: constraints.maxWidth * .045),
                                child: Row(
                                  children: [
                                    Text(
                                      'Placa do veículo:',
                                      style: TextStyle(
                                          fontSize: constraints.maxWidth * .037,
                                          color: Colors.black38,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text(
                                      _veiculos[0].nome,
                                      style: TextStyle(
                                          fontSize: constraints.maxWidth * .037,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: constraints.maxHeight * .02,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: constraints.maxWidth * .02,
                                  ),
                                  Text(
                                    'Modelo do veículo:',
                                    style: TextStyle(
                                        fontSize: constraints.maxWidth * .037,
                                        color: Colors.black38,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    _veiculos[0].modelo,
                                    style: TextStyle(
                                        fontSize: constraints.maxWidth * .037,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: constraints.maxHeight * .02),
                ProfileButton(
                  title: 'Veículos',
                  subTitle: 'Gerencie seus veículos',
                  constraints: constraints,
                  leading: Icons.car_rental_outlined,
                  traicing: Icons.arrow_forward_ios_outlined,
                  route: _goToCarsScreen,
                ),
                ProfileButton(
                  title: 'Feedbacks',
                  subTitle: 'Envie um feedback ',
                  constraints: constraints,
                  leading: Icons.eco_sharp,
                  traicing: Icons.arrow_forward_ios_outlined,
                  route: _goToFeedbacksScreen,
                ),
                SizedBox(
                  height: constraints.maxHeight * .1,
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}
