import 'package:flutter/material.dart';

class Categoria extends StatefulWidget {
  const Categoria({super.key});

  @override
  State<Categoria> createState() => _CategoriaState();
}

class _CategoriaState extends State<Categoria> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Text('Categoria'),
    ),

        body: ListView(

          padding: const EdgeInsets.all(12),
          children: <Widget>[


            Container(
              height: 50,
              child:const Text(
                'Anestésicos e Agulhas Gengival',
                style: TextStyle(
                  color: Colors.lightBlue, // Cor do texto
                  fontSize: 18.0,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            Container(
              height: 50,
              child:Text(
                'Biossegurança',
                style: TextStyle(
                  color: Colors.lightBlue, // Cor do texto
                  fontSize: 18.0,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            Container(
              height: 50,
              child:Text(
                'Anestésico',
                style: TextStyle(
                  color: Colors.lightBlue, // Cor do texto
                  fontSize: 18.0,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            Container(
              height: 50,
              child:Text(
                'Descartáveis',
                style: TextStyle(
                  color: Colors.lightBlue, // Cor do texto
                  fontSize: 18.0,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            Container(
              height: 50,
              child:Text(
                'Dentística e Estética',
                style: TextStyle(
                  color: Colors.lightBlue, // Cor do texto
                  fontSize: 18.0,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            Container(
              height: 50,
              child:Text(
                'Ortodontia',
                style: TextStyle(
                  color: Colors.lightBlue, // Cor do texto
                  fontSize: 18.0,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            Container(
              height: 50,
              child:Text(
                'Endodontia',
                style: TextStyle(
                  color: Colors.lightBlue, // Cor do texto
                  fontSize: 18.0,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            Container(
              height: 50,
              child:Text(
                'Periféricos e Peças de Mão',
                style: TextStyle(
                  color: Colors.lightBlue, // Cor do texto
                  fontSize: 18.0,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            Container(
              height: 50,
              child:Text(
                'Moldagem',
                style: TextStyle(
                  color: Colors.lightBlue, // Cor do texto
                  fontSize: 18.0,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            Container(
              height: 50,
              child:Text(
                'Prótese',
                style: TextStyle(
                  color: Colors.lightBlue, // Cor do texto
                  fontSize: 18.0,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            Container(
              height: 50,
              child:Text(
                'Cimentos',
                style: TextStyle(
                  color: Colors.lightBlue, // Cor do texto
                  fontSize: 18.0,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),

            Container(
              height: 50,
              child:Text(
                'Instrumentos',
                style: TextStyle(
                  color: Colors.lightBlue, // Cor do texto
                  fontSize: 18.0,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),

          ],
        )

    );

  }
}