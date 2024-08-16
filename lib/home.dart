import 'package:appdentista/home_page.dart';
import 'package:appdentista/model/produto_repositorio.dart';
import 'package:appdentista/model/produtos.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController searchController = TextEditingController();
  List<Produto> tabela = ProdutoRepositorio.tabela; // Lista original
  List<Produto> filteredTabela = []; // Lista filtrada
  List<String> recentSearches = []; // Lista de pesquisas recentes

  @override
  void initState() {
    super.initState();
    filteredTabela = tabela; // Inicializa a lista filtrada com todos os itens
    searchController.addListener(() {
      filterSearchResults(searchController.text);
    });
  }

  void filterSearchResults(String query) {
    List<Produto> dummyList = [];
    if (query.isNotEmpty) {
      dummyList = tabela
          .where(
              (item) => item.nome.toLowerCase().contains(query.toLowerCase()))
          .toList();
      setState(() {
        filteredTabela = dummyList;
        if (!recentSearches.contains(query)) {
          recentSearches.insert(
              0, query); // Adiciona a pesquisa no início da lista
        }
      });
    } else {
      setState(() {
        filteredTabela = [];
      });
    }
  }

  void selectRecentSearch(String query) {
    searchController.text = query;
    filterSearchResults(query);
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 40,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(34)),
              child: Center(
                child: TextField(
                  controller: searchController,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          searchController.clear(); // Limpa o campo de busca
                          setState(() {
                            filteredTabela = []; // Esvazia a lista filtrada
                          });
                        },
                      ),
                      hintText: 'Buscar',
                      border: InputBorder.none),
                ),
              ),
            ),
            // Exibe a contagem de itens encontrados abaixo do campo de busca
            if (searchController.text.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  '${filteredTabela.length} itens encontrados',
                  style: const TextStyle(
                    fontSize: 16,
                    color: Color.fromARGB(255, 2, 2, 2),
                  ),
                ),
              ),
          ],
        ),
      ),
      body: searchController.text.isEmpty
          ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Pesquisas Recentes:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Expanded(
                    child: ListView.builder(
                      itemCount: recentSearches.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(recentSearches[index]),
                          trailing: IconButton(
                            icon: const Icon(Icons.clear),
                            onPressed: () {
                              setState(() {
                                recentSearches.removeAt(index);
                              });
                            },
                          ),
                          onTap: () =>
                              selectRecentSearch(recentSearches[index]),
                        );
                      },
                    ),
                  ),
                ],
              ),
            )
          : ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: Transform.scale(
                    scale: 1.3,
                    child: Image.asset(filteredTabela[index].imagem),
                  ),
                  title: Text(
                    filteredTabela[index].nome,
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 19,
                    ),
                  ),
                  subtitle: RichText(
                    text: TextSpan(
                      children: [
                        const TextSpan(
                          text: 'R\$ ',
                          style: TextStyle(
                            fontWeight: FontWeight.w200,
                            fontSize: 22.0,
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                          text: filteredTabela[index].preco.toString(),
                          style: const TextStyle(
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
              padding: const EdgeInsets.all(16),
              separatorBuilder: (_, __) => const Divider(),
              itemCount: filteredTabela.length,
            ),
    );
  }
}
