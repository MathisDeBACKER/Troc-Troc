import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {
  ApiService({
    String? baseUrl,
    http.Client? client,
  })  : _baseUrl = baseUrl ??
            const String.fromEnvironment(
              'API_BASE_URL',
              defaultValue: 'http://127.0.0.1:8000',
            ),
        _client = client ?? http.Client();

  final String _baseUrl;
  final http.Client _client;

  Future<Map<String, dynamic>> healthCheck() async {
    final response = await _client.get(Uri.parse('$_baseUrl/health'));

    if (response.statusCode != 200) {
      throw Exception('Erreur API: code ${response.statusCode}');
    }

    final decoded = jsonDecode(response.body);
    if (decoded is! Map<String, dynamic>) {
      throw Exception('Réponse API invalide');
    }

    return decoded;
  }
}
