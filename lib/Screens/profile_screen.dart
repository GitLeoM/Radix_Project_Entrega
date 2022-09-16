import 'package:flutter/material.dart';
import 'package:radix_entrega_project/Data/dummy_data.dart';
import 'package:radix_entrega_project/Utils/app_routes.dart';
import '../Components/profile_button.dart';

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
    final pessoa = DUMMY_Delivery[i];

    return Scaffold(
      body: LayoutBuilder(
        builder: ((context, constraints) {
          return SingleChildScrollView(
            child: Column(
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
                              Navigator.of(context)
                                  .pushNamed(AppRoutes.EDITARPERFIL);
                            },
                            child: Text(
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
                                  fontSize: constraints.maxWidth * .1,
                                  color: Colors.white),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .pushNamed(AppRoutes.WELCOMEBACK);
                            },
                            child: Text(
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
                              width: constraints.maxWidth * .3,
                              color: Colors.white,
                              child:
                                  Image.asset('assets/images/homem_aranha.png'),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Nome:',
                                    style: TextStyle(
                                        fontSize: constraints.maxWidth * .04,
                                        color: Colors.black38,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    pessoa.nome,
                                    style: TextStyle(
                                        fontSize: constraints.maxWidth * .04,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: constraints.maxHeight * .02,
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: constraints.maxWidth * .04),
                                child: Row(
                                  children: [
                                    Text(
                                      'Placa do veículo:',
                                      style: TextStyle(
                                          fontSize: constraints.maxWidth * .04,
                                          color: Colors.black38,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text(
                                      pessoa.carro!.placa,
                                      style: TextStyle(
                                          fontSize: constraints.maxWidth * .04,
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
                                  Text(
                                    'Modelo do veículo:',
                                    style: TextStyle(
                                        fontSize: constraints.maxWidth * .04,
                                        color: Colors.black38,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    pessoa.carro!.nomeVeiculo,
                                    style: TextStyle(
                                        fontSize: constraints.maxWidth * .04,
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
