import 'package:flutter/material.dart';
import 'package:loja_virtual/models/cart_model.dart';
import 'package:loja_virtual/models/user_model.dart';
import 'package:scoped_model/scoped_model.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel<UserModel>(
        model: UserModel(),
        child: ScopedModelDescendant<UserModel>(
          builder: (context, child, model) {
            return ScopedModel<CartModel>(
              model: CartModel(model),
              child: MaterialApp(
                  title: "Evidences 3D",
                  theme: ThemeData(
                      primarySwatch: Colors.blue,
                      primaryColor: Colors.blue),//.fromARGB(255, 4, 125, 141)),
                  debugShowMaterialGrid: false,
                  debugShowCheckedModeBanner: false,
                  home: HomeScreen()),
            );
          },
        ));
  }
}
