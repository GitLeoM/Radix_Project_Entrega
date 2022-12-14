import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:radix_entrega_project/Components/button.dart';
import 'package:radix_entrega_project/Utils/app_routes.dart';

class OpeningScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(238, 238, 238, 1),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset('assets/images/bolas_verdes.png'),
                ),
                SizedBox(height: constraints.maxHeight * .05),
                SvgPicture.asset(
                  'assets/svg/undraw_farm_girl_dnpe.svg',
                  height: constraints.maxHeight * .3,
                ),
                SizedBox(height: constraints.maxHeight * .03),
                Text(
                  'Entregue com Radix',
                  style: TextStyle(
                    fontSize: constraints.maxHeight * .03,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: constraints.maxHeight * .02),
                Text(
                  'Agilidade e rapidez com as entregas do Radix.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: constraints.maxHeight * .024,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: constraints.maxHeight * .07),
                Button(
                  text: 'Iniciar',
                  onTap: () {
                    Navigator.pushReplacementNamed(
                        context, AppRoutes.WELCOMEBACK);
                  },
                  height: constraints.maxHeight * .08,
                  width: constraints.maxWidth * .7,
                  color: true,
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
