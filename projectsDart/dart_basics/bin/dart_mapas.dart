void main() {
  //crear un mapa
  Map<String, int> notas = {'ddi': 10, 'db': 8, 'iot': 10, 'ingles': 10};

  //imprimir el mapa
  print(notas);
  print(notas['db']);
  notas['db'] = 10;
  print(notas['db']);
  print(notas);

  notas.remove('iot');
  print(notas);

  for (var nota in notas.keys) {
    print('$nota: ${notas[nota]}');
  }

  notas.forEach((key, value) => print('$key: $value'));
}
