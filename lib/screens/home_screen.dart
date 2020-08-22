import 'package:flutter/material.dart';
import 'package:loja_virtual/tabs/about_tab.dart';
import 'package:loja_virtual/tabs/home_tab.dart';
import 'package:loja_virtual/tabs/my_tab.dart';
import 'package:loja_virtual/tabs/orders_tab.dart';
import 'package:loja_virtual/tabs/places_tab.dart';
import 'package:loja_virtual/tabs/process_tab.dart';
import 'package:loja_virtual/tabs/products_tab.dart';
import 'package:loja_virtual/tabs/scan_tab.dart';
import 'package:loja_virtual/tabs/search_tab.dart';
import 'package:loja_virtual/tabs/start_tab.dart';
import 'package:loja_virtual/widgets/cart_button.dart';
import 'package:loja_virtual/widgets/custom_drawer.dart';

class HomeScreen extends StatelessWidget {
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      physics: NeverScrollableScrollPhysics(), //Para não ser scrollable
      children: <Widget>[
        Scaffold(
          appBar: AppBar(
            title: Text("Evidences 3D"),
            centerTitle: true,
          ),
          drawer: CustomDrawer(_pageController),
          body: StartTab(_pageController),
          //floatingActionButton: CartButton(),
        ),
        Scaffold(
          appBar: AppBar(
            title: Text("Escanear evidência"),
            centerTitle: true,
          ),
          drawer: CustomDrawer(_pageController),
          body: ScanTab(),
          //floatingActionButton: CartButton(),
        ),
        Scaffold(
            appBar: AppBar(
                title: Text("Processamento"),
                centerTitle: true
            ),
            body: ProcessTab(),
            drawer: CustomDrawer(_pageController)
        ),
        Scaffold(
            appBar: AppBar(
                title: Text("Minhas evidências"),
                centerTitle: true
            ),
            body: MyTab(),
            drawer: CustomDrawer(_pageController)
        ),
        Scaffold(
            appBar: AppBar(
                title: Text("Buscar evidência"),
                centerTitle: true
            ),
            body: SearchTab(),
            drawer: CustomDrawer(_pageController)
        ),
        Scaffold(
            appBar: AppBar(
                title: Text("Sobre"),
                centerTitle: true
            ),
            body: AboutTab(),
            drawer: CustomDrawer(_pageController)
        ),
      ],
    );
  }
}
