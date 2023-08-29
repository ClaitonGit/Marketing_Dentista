import 'package:appdentista/home_page.dart';
import 'package:appdentista/model/produto_repositorio.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {

    //Chama produto repositorio
    final tabela = ProdutoRepositorio.tabela;

    return Scaffold(
      appBar: AppBar(
          title: Container(
            width: double.infinity,
            height: 40,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(34)),
            child: Center(
              child: TextField(
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () {
                        /* Clear the search field */
                      },
                    ),
                    hintText: 'Buscar',
                    border: InputBorder.none),
              ),
            ),
          )

    ),

      body: ListView.separated(
          itemBuilder: (BuildContext context, int produto ){
            return ListTile(

                leading: Transform.scale(
                  scale: 1.3,
                  child: Image.asset(tabela[produto].imagem),
                ),

              title:Text(
                tabela[produto].nome,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 19,
                ),
              ),

              subtitle: RichText( text: TextSpan( children: [
                      TextSpan( text: 'R\$ ',
                        style: TextStyle(
                          fontWeight: FontWeight.w200,
                          fontSize: 22.0,
                          color: Colors.black, // Altere a cor conforme necessário
                        ),
                      ),
                      TextSpan(
                        text: tabela[produto].preco.toString(),
                        style: TextStyle(
                          fontSize: 22.0,
                          fontWeight: FontWeight.w200,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),

            );
          },
          padding: EdgeInsets.all(16),
          separatorBuilder: (_, __) => Divider(),
          itemCount: tabela.length
      ),


    );
    home: home_page();
  }
}