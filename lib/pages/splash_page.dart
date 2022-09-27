import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with SingleTickerProviderStateMixin {
  final Tween<double> turnsTween = Tween<double>(begin: 1, end: 10);

  late AnimationController controller;

  void navegarTelaLogin() {
    // para chamar outra tela, utiliza-se o objeto navigator

    Navigator.pushReplacementNamed(context, '/login');
  }

  iniciarSplash() async {
    var duracao = Duration(seconds: 5);
    controller.forward();
    return Timer(duracao, navegarTelaLogin);
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController( vsync: this, duration: Duration(seconds: 5));
    iniciarSplash();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.indigo,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RotationTransition(
              turns: turnsTween.animate(controller),
              child: Image.asset("assets/images/splash.png", scale: 1.5),
            ),
            SizedBox(height: 20),
            Text(
              "Carregando . . .",
              style: TextStyle(fontSize: 25, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}