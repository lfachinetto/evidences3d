import 'package:flutter/material.dart';
import 'package:loja_virtual/models/user_model.dart';
import 'package:loja_virtual/screens/login_screen.dart';
import 'package:loja_virtual/tiles/drawer_tile.dart';
import 'package:scoped_model/scoped_model.dart';

class CustomDrawer extends StatelessWidget {
  final PageController pageController;

  CustomDrawer(this.pageController);

  @override
  Widget build(BuildContext context) {
    Widget _buildBodyBack() => Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.blue, Colors.white],//Color.fromARGB(255, 283, 236, 241), Colors.white],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
        );

    return Drawer(
        child: Stack(
      children: <Widget>[
        _buildBodyBack(),
        ListView(
          padding: EdgeInsets.only(left: 32, top: 16),
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 6),
              padding: EdgeInsets.fromLTRB(0, 16, 16, 8),
              height: 170,
              child: Stack(
                children: <Widget>[
                  Positioned(
                      top: 8,
                      left: 0,
                      child: Text("Evidences3D",
                          style: TextStyle(
                              fontSize: 34, fontWeight: FontWeight.bold))),
                  Positioned(
                      left: 0,
                      bottom: 0,
                      child: ScopedModelDescendant<UserModel>(
                        builder: (context, child, model) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                  "Olá, API da PJC ${!model.isLoggedIn() ? "" : model.userData["name"]}",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold)),
                              GestureDetector(
                                  onTap: () {
                                    if (!model.isLoggedIn())
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  LoginScreen()));
                                    else
                                      model.signOut();
                                  },
                                  child: Text(
                                      !model.isLoggedIn()
                                          ? "Entre ou cadastre-se >"
                                          : "Sair",
                                      style: TextStyle(
                                          color: Theme.of(context).primaryColor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold)))
                            ],
                          );
                        },
                      ))
                ],
              ),
            ),
            Divider(),
            DrawerTile(Icons.home, "Início", pageController, 0),
            DrawerTile(Icons.camera_alt, "Escanear evidência", pageController, 1),
            DrawerTile(Icons.cloud_upload, "Processamento", pageController, 2),
            DrawerTile(Icons.view_list, "Minhas evidências", pageController, 3),
            DrawerTile(Icons.search, "Buscar evidência", pageController, 4),
            DrawerTile(Icons.info, "Sobre", pageController, 5)
          ],
        )
      ],
    ));
  }
}