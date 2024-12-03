class Pizza {
  final bool esVegetariana;
  final List<String> ingredientesBase = ['Mozzarella', 'Tomate'];
  late List<String> ingredientesDisponibles;

  Pizza(this.esVegetariana) {
   
    if (esVegetariana) {
      ingredientesDisponibles = ['Pimiento', 'Tofu'];
    } else {
      ingredientesDisponibles = ['Peperoni', 'Jamón', 'Salmón'];
    }
  }

  
  List<String> construirPizza(String ingredienteAdicional) {
    return [...ingredientesBase, ingredienteAdicional];
  }
}
