import 'package:flutter/material.dart';
import 'package:loja_virtual/tabs/about_tab.dart';
import 'package:loja_virtual/tabs/my_tab.dart';
import 'package:loja_virtual/tabs/process_tab.dart';
import 'package:loja_virtual/tabs/scan_tab.dart';
import 'package:loja_virtual/tabs/search_tab.dart';

class StartTab extends StatelessWidget {
  final PageController pageCont;

  StartTab(this.pageCont);

  @override
  Widget build(BuildContext context) {
    /*return ListView(
      children: <Widget>[
        Text("Botões principais de atalho")
      ],
    );*/

    return GridView.count(
        crossAxisCount: 3,
        children: List.generate(opcoes.length, (index) {
          return Center(
            child: OpcaoCard(
              opcao: opcoes[index],
              pageCo: pageCont,
              mainContext: context,
            ),
          );
        }));
  }
}

class Opcao {
  const Opcao({this.titulo, this.icon, this.page});

  final String titulo;
  final IconData icon;
  final int page;
}

List<Opcao> opcoes = <Opcao>[
  Opcao(titulo: 'Escanear evidência', icon: Icons.camera_alt, page: 1),
  Opcao(titulo: 'Processamento', icon: Icons.cloud_upload, page: 2),
  Opcao(titulo: 'Minhas evidências', icon: Icons.view_list, page: 3),
  Opcao(titulo: 'Buscar evidência', icon: Icons.search, page: 4),
  //Opcao(titulo: 'Sobre', icon: Icons.info, page: 5),
];

class OpcaoCard extends StatelessWidget {
  PageController pageCo;
  BuildContext mainContext;

  OpcaoCard({Key key, this.opcao, this.pageCo, this.mainContext})
      : super(key: key);
  final Opcao opcao;

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.headline4;
    return InkWell(
        onTap: () {
          pageCo.jumpToPage(opcao.page);
        },
        child: Card(
            color: Colors.white,
            child: Center(
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Icon(opcao.icon, size: 80.0, color: Colors.blueAccent),
                    Text(opcao.titulo,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),textAlign: TextAlign.center,),
                  ]),
            )));
  }
}
