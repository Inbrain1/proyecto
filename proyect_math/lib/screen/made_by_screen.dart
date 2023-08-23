import 'package:flutter/material.dart';

class MadeByScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      appBar: AppBar(
        title: Text('Creditos'),
       centerTitle: true,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          // Obtener el ancho de la pantalla
          double screenWidth = constraints.maxWidth;

          // Determinar si la orientación es horizontal o vertical
          bool isHorizontal = screenWidth > 600; // Puedes ajustar este valor

          return Center(
            child: SingleChildScrollView(
              child: isHorizontal
                  ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _buildCreditColumns(),
              )
                  : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _buildCreditColumns(),
              ),
            ),
          );
        },
      ),
    );
  }

  List<Widget> _buildCreditColumns() {
    return [
      Column(
        children: [
          CircleAvatar(
            radius: 60,
            backgroundImage: AssetImage('assets/perro.jpg'), // Agrega la imagen del primer avatar aquí
          ),
          SizedBox(height: 20),
          Text(
            'Desarrollado por:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(
            'Ibrain Caceres',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            'Alias: So',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
      SizedBox(width: 200,height: 100,), // Espacio entre las columnas
      Column(
        children: [
          CircleAvatar(
            radius: 60,
            backgroundImage: AssetImage('assets/avatar2.png'), // Agrega la imagen del segundo avatar aquí
          ),
          SizedBox(height: 20),
          Text(
            'Desarrollado por:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(
            'Galicia',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            'Alias: El mas cachero del salon',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    ];
  }
}
