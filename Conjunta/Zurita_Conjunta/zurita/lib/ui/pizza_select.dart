import 'package:flutter/material.dart';
import '../logic/pizza_logic.dart';

class PizzaSelect extends StatefulWidget {
  @override
  _PizzaSelectorState createState() => _PizzaSelectorState();
}

class _PizzaSelectorState extends State<PizzaSelect> {
  bool? esVegetariana;
  String? ingredienteSeleccionado;
  List<String> ingredientesDisponibles = [];
  List<String> ingredientesFinales = [];

  void seleccionarTipoPizza(bool vegetariana) {
    setState(() {
      esVegetariana = vegetariana;
      final pizza = Pizza(vegetariana);
      ingredientesDisponibles = pizza.ingredientesDisponibles;
      ingredienteSeleccionado = null;
      ingredientesFinales = [];
    });
  }

  void seleccionarIngrediente(String ingrediente) {
    setState(() {
      ingredienteSeleccionado = ingrediente;
      final pizza = Pizza(esVegetariana!);
      ingredientesFinales = pizza.construirPizza(ingrediente);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selecciona tu Pizza 🍕'),
        backgroundColor: const Color.fromARGB(255, 236, 171, 92), 
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '¿Qué tipo de pizza deseas?',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () => seleccionarTipoPizza(true),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green[400], 
                    foregroundColor: Colors.white,
                  ),
                  child: Text('Vegetariana'),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () => seleccionarTipoPizza(false),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 253, 107, 107), 
                    foregroundColor: Colors.white, 
                  ),
                  child: Text('No Vegetariana'),
                ),
              ],
            ),
            if (esVegetariana != null) ...[
              SizedBox(height: 20),
              Text(
                'Selecciona un ingrediente adicional:',
                style: TextStyle(fontSize: 16),
              ),
              
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: ingredientesDisponibles
                    .map(
                      (ingrediente) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: ElevatedButton(
                          onPressed: () => seleccionarIngrediente(ingrediente),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: ingredienteSeleccionado == ingrediente
                                ? Colors.red[400] 
                                : Colors.yellow[100], 
                            foregroundColor: Colors.black, 
                          ),
                          child: Text(
                            ingrediente,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ],
            if (ingredientesFinales.isNotEmpty) ...[
              SizedBox(height: 20),
              Text(
                'Tu pizza tiene los siguientes ingredientes:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.orange, width: 1.5),
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.orange[50], 
                ),
                child: Text(
                  ingredientesFinales.join(', '),
                  style: TextStyle(fontSize: 14, color: Colors.black87),
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }
}
