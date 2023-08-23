
import 'package:flutter/material.dart';

import '../custom/export_custom.dart';
import '../theme/app_theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.primary,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppTheme.primary,
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 30, bottom: 50),
              child: Image.asset('assets/a.jpg',scale: 1.9,),
              width: 200,
              height: 400,
            ),
            Card(
              color: Colors.indigo.shade200,
              margin: const EdgeInsets.all(20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: ListView(
                shrinkWrap: true,
                padding: const EdgeInsets.all(10),
                children: [
                  Container(
                    height: 50,
                    margin: const EdgeInsets.only(top: 10, bottom: 25),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            Colors.indigo.shade200,
                            Colors.purple.shade50
                          ],
                        ),
                        borderRadius: BorderRadius.circular(15)),
                    child: const Center(
                      child: Text(
                        'Proyecto Matematico',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 20),
                      ),
                    ),
                  ),
                  Custom_OutlineBotton(
                    BottomText: 'Iniciar los problemas matematicas',
                    onPressed: () {
                      Navigator.pushNamed(context, 'iniciar :D');
                    },
                  ),
                  Custom_OutlineBotton(
                    BottomText: 'Visualizacion de los problemas y las respuestas ',
                    onPressed: () {
                      Navigator.pushNamed(
                          context, 'De que tratara esta encuesta');
                    },
                  ),
                  Custom_OutlineBotton(BottomText: 'Hecho por', onPressed:(){
                    Navigator.pushNamed(context,'MadeBy');
                  })
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
