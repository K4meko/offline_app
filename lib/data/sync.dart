import 'dart:convert';

import 'package:http/http.dart' as http;

Future<CatFact> fetchCatFacts() async {
  final response = await http.get(Uri.parse('https://catfact.ninja/fact'));

  if (response.statusCode == 200) {
    final json = jsonDecode(response.body) as Map<String, dynamic>;
    return CatFact.fromJson(json);
  } else {
    throw Exception('Failed to load cat fact');
  }
}

class CatFact {
  final String catFact;

  const CatFact({required this.catFact});

  factory CatFact.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {'fact': String catFact} => CatFact(catFact: catFact),
      _ => throw const FormatException('Failed to load cat fact.'),
    };
  }
}
