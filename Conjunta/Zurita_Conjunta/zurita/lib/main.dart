import 'package:flutter/material.dart';
import 'ui/pizza_select.dart'; 

void main() {
  runApp(PizzaApp());
}

class PizzaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PizzaSelect(),
    );
  }
}
