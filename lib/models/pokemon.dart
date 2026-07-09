import 'package:flutter/material.dart';

class Pokemon {
  final String nome;
  final int numero;
  final String image;

  final String tipagem;
  final String? tipagem2;
  final double peso;
  final double altura;

  final List<String> habilidades;

  final Color cor;

  Pokemon({
    required this.nome,
    required this.numero,
    required this.tipagem,
    required this.tipagem2,
    required this.peso,
    required this.altura,
    required this.habilidades,
    required this.cor,
    required this.image,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) {
  return Pokemon(
    nome: json['name'],
    numero: json['id'],
    image: json['sprites']['front_default'],

    tipagem: json['types'][0]['type']['name'],

    tipagem2: json['types'].length > 1
        ? json['types'][1]['type']['name']
        : null,

    peso: json['weight'] / 10,
    altura: json['height'] / 10,

    habilidades: (json['abilities'] as List)
        .map((h) => h['ability']['name'] as String)
        .toList(),

    cor: Colors.grey,
  );
}

  Map<String, dynamic> toJson() {
    return {
      'nome': nome,
      'numero': numero,
      'image': image,
      'tipagem': tipagem,
      'tipagem2': tipagem2,
      'peso': peso,
      'altura': altura,
      'habilidades': habilidades,
      'cor': cor.value.toString(),
    };
  }
}
