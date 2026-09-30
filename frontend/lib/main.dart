import 'package:flutter/material.dart';

import 'services/api_service.dart';

void main() {
  runApp(const TrocTrocApp());
}

class TrocTrocApp extends StatelessWidget {
  const TrocTrocApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Troc-Troc',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ApiService _apiService = ApiService();

  String _statusMessage = 'Projet prêt. Appuyez pour tester la connexion API.';
  bool _loading = false;

  Future<void> _testConnection() async {
    setState(() {
      _loading = true;
      _statusMessage = 'Test de connexion en cours...';
    });

    try {
      final result = await _apiService.healthCheck();
      final status = result['status']?.toString() ?? 'inconnu';

      setState(() {
        _statusMessage = 'Connexion réussie: /health -> status=$status';
      });
    } catch (error) {
      setState(() {
        _statusMessage = 'Échec de connexion: $error';
      });
    } finally {
      setState(() {
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Troc-Troc'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Bienvenue sur le squelette Flutter de Troc-Troc.',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Text(
                _statusMessage,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _loading ? null : _testConnection,
                child: Text(_loading ? 'Vérification...' : 'Tester le backend'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
