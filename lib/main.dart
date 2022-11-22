import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:radix_entrega_project/Providers/carro_provider.dart';
import 'package:radix_entrega_project/Providers/delivery_man_provider.dart';
import 'package:radix_entrega_project/Providers/pedido_provider.dart';
import 'package:radix_entrega_project/Screens/add_car_screen.dart';
import 'package:radix_entrega_project/Screens/after_accept_run_screen.dart';
import 'package:radix_entrega_project/Screens/edit_profile.dart';
import 'package:radix_entrega_project/Screens/finished_run.dart';
import 'package:radix_entrega_project/Screens/historic_detail_screen.dart';
import 'package:radix_entrega_project/Screens/historic_screen.dart';
import 'package:radix_entrega_project/Screens/opening_screen.dart';
import 'package:radix_entrega_project/Screens/report_screen.dart';
import 'package:radix_entrega_project/Screens/tabs_screen_home.dart';
import 'Screens/cars_screen.dart';
import 'Screens/feedback_screen.dart';
import 'Screens/profile_screen.dart';
import 'Screens/welcome_back_screen.dart';
import 'Utils/app_routes.dart';
import 'Utils/custom_material_color.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final int index = 0;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DeliveryManProvider()),
        ChangeNotifierProvider(create: (_) => VeiculoProvider()),
        ChangeNotifierProvider(create: (_) => PedidoProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Radix',
        theme: ThemeData(
          visualDensity: VisualDensity.comfortable,
          colorScheme: ColorScheme.fromSwatch(
                  primarySwatch: CustomMaterialColor(132, 202, 157).mdColor)
              .copyWith(
            secondary: const Color.fromRGBO(108, 168, 129, 1),
          ),
        ),
        routes: {
          AppRoutes.OPENINGSCREEN: (ctx) => OpeningScreen(),
          AppRoutes.WELCOMEBACK: (ctx) => WellcomeBackScreen(),
          AppRoutes.HOMETAB: (ctx) => TabsScreenHome(),
          AppRoutes.HISTORIC: (ctx) => const HistoricScreen(),
          AppRoutes.FEEDBACKS: (ctx) => const FeedbackScreen(),
          AppRoutes.PROFILE: (ctx) => ProfileScreen(),
          AppRoutes.CARS: (ctx) => const CarsScreen(),
          AppRoutes.ACCEPTRUN: (cxt) => AcceptRunScreen(),
          AppRoutes.FINISHEDRUN: (cxt) => FinishedRun(),
          AppRoutes.REPORTSCREEN: (cxt) => ReportScreen(),
          AppRoutes.ADDCAR: (cxt) => const AddCarScreen(),
          AppRoutes.EDITARPERFIL: (cxt) => EditProfile(),
          AppRoutes.HISTORICDETAIL: (cxt) => HistoricDetailScreen(),
        },
      ),
    );
  }
}
