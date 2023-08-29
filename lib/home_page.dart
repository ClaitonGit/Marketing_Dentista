import 'package:appdentista/cadastro.dart';
import 'package:appdentista/categoria.dart';
import 'package:appdentista/conta.dart';
import 'package:appdentista/favoritos.dart';
import 'package:appdentista/home.dart';
import 'package:flutter/material.dart';


class home_page extends StatefulWidget {
  const home_page({super.key});

  @override
  State<home_page> createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {

  int paginaAtual = 0;
  late PageController pc;

  void initState(){
    super.initState();
    pc = PageController(initialPage: paginaAtual);
}

setPaginaAtual(pagina){
  setState(() {
    paginaAtual = pagina;
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: PageView(
        controller: pc,
        children: [
        Home(),
        Categoria(),
        Cadastro(),
        Favoritos(),
        Conta(),
        ],
        onPageChanged: setPaginaAtual,
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: paginaAtual,
          items: [
          BottomNavigationBarItem(
               backgroundColor: Colors.blue[300],
              icon: Icon(Icons.house),
              label:("Home")
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label:("Categorias")
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_circle_outline),
              label:("Anunciar")
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label:("Favoritos")
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_sharp),
              label:("Conta")
          ),
        ],
        onTap: (pagina){
          pc.animateToPage(pagina, 
          duration: Duration(milliseconds: 400),
           curve: Curves.ease,
           );
        },
     
      ),

      

    );
      
  }
}