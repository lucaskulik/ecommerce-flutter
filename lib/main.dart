import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/providers/product_provider.dart';
import 'package:ecommerce/providers/user_provider.dart';
import 'package:ecommerce/screen/home_screen.dart';
import 'package:ecommerce/screen/login_screen.dart';
import 'package:ecommerce/screen/register_screen.dart';
import 'package:ecommerce/utils/massa_de_dados.dart';
import 'package:ecommerce/utils/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // await MassaDeDados.inserirProdutos();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext contxet) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => new UserProvider(),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (_) => new ProductProvider(),
          lazy: false,
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: Routes.HOME,
        routes: {
          Routes.HOME: (_) => HomeScreen(),
          Routes.LOGIN: (_) => LoginScreen(),
          Routes.REGISTER: (_) => RegisterScreen(),
        },
      ),
    );
  }
}
