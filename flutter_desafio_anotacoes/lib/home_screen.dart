import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'anotacao_screen.dart';
import 'splash_screen.dart';
import 'storage_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _storageService = StorageService();
  List<Map<String, dynamic>> _anotacoes = [];

  @override
  void initState() {
    super.initState();
    _carregarAnotacoes();
  }

  Future<void> _carregarAnotacoes() async {
    final anotacoes = await _storageService.carregarAnotacoes();

    if (!mounted) return;

    setState(() {
      _anotacoes = anotacoes;
    });
  }

  Future<void> _novaAnotacao() async {
    final resultado = await Navigator.push<Map<String, dynamic>>(
      context,
      MaterialPageRoute(
        builder: (_) => const AnotacaoScreen(),
      ),
    );

    if (resultado == null) return;

    setState(() {
      _anotacoes.insert(0, resultado);
    });

    await _storageService.salvarAnotacoes(_anotacoes);
  }

  Future<void> _abrirSplash() async {
    Navigator.pop(context);

    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const SplashScreen(fromMenu: true),
      ),
    );
  }

  void _sair() {
    SystemNavigator.pop();
  }

  @override
  Widget build(BuildContext context) {
    const rosa = Color(0xFFB85C73);
    const rosaEscuro = Color(0xFF7F354B);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Minhas anotações',
          style: TextStyle(
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      drawer: Drawer(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(24, 30, 24, 24),
                color: rosa,
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.edit_note_rounded,
                      color: Colors.white,
                      size: 42,
                    ),
                    SizedBox(height: 12),
                    Text(
                      'Anotações',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: const Icon(Icons.home_outlined),
                title: const Text('Home'),
                onTap: () => Navigator.pop(context),
              ),
              ListTile(
                leading: const Icon(Icons.auto_awesome_outlined),
                title: const Text('Splash'),
                onTap: _abrirSplash,
              ),
              const Spacer(),
              const Divider(height: 1),
              ListTile(
                leading: const Icon(Icons.exit_to_app, color: rosaEscuro),
                title: const Text('Sair'),
                onTap: _sair,
              ),
            ],
          ),
        ),
      ),
      body: _anotacoes.isEmpty
          ? Center(
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.notes_rounded,
                      size: 70,
                      color: rosa.withValues(alpha: 0.5),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Nenhuma anotação ainda.',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      'Toque no + para criar sua primeira anotação.',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black54),
                    ),
                  ],
                ),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 100),
              itemCount: _anotacoes.length,
              itemBuilder: (context, index) {
                final anotacao = _anotacoes[index];
                final titulo = anotacao['titulo'] as String;
                final texto = anotacao['texto'] as String;
                final data = DateTime.parse(anotacao['data'] as String);

                return Card(
                  margin: const EdgeInsets.only(bottom: 14),
                  elevation: 0,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(18),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          titulo,
                          style: const TextStyle(
                            color: rosaEscuro,
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          texto,
                          maxLines: 5,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            height: 1.45,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          '${data.day.toString().padLeft(2, '0')}/${data.month.toString().padLeft(2, '0')}/${data.year} · ${data.hour.toString().padLeft(2, '0')}:${data.minute.toString().padLeft(2, '0')}',
                          style: const TextStyle(
                            color: Colors.black45,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _novaAnotacao,
        backgroundColor: rosa,
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
      ),
    );
  }
}
