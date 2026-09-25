import 'package:flutter/material.dart';

class AnotacaoScreen extends StatefulWidget {
  const AnotacaoScreen({super.key});

  @override
  State<AnotacaoScreen> createState() => _AnotacaoScreenState();
}

class _AnotacaoScreenState extends State<AnotacaoScreen> {
  final _tituloController = TextEditingController();
  final _textoController = TextEditingController();

  @override
  void dispose() {
    _tituloController.dispose();
    _textoController.dispose();
    super.dispose();
  }

  void _salvar() {
    final titulo = _tituloController.text.trim();
    final texto = _textoController.text.trim();

    if (titulo.isEmpty || texto.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Preencha o título e a anotação.'),
        ),
      );
      return;
    }

    Navigator.pop(
      context,
      {
        'titulo': titulo,
        'texto': texto,
        'data': DateTime.now().toIso8601String(),
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    const rosa = Color(0xFFB85C73);
    const rosaEscuro = Color(0xFF7F354B);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Nova anotação',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          TextField(
            controller: _tituloController,
            textCapitalization: TextCapitalization.sentences,
            decoration: const InputDecoration(
              labelText: 'Título',
              prefixIcon: Icon(Icons.title),
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _textoController,
            textCapitalization: TextCapitalization.sentences,
            maxLines: 10,
            decoration: const InputDecoration(
              labelText: 'Anotação',
              alignLabelWithHint: true,
              prefixIcon: Padding(
                padding: EdgeInsets.only(bottom: 135),
                child: Icon(Icons.notes_outlined),
              ),
            ),
          ),
          const SizedBox(height: 24),
          SizedBox(
            height: 54,
            child: FilledButton.icon(
              onPressed: _salvar,
              icon: const Icon(Icons.save_outlined),
              label: const Text(
                'SALVAR ANOTAÇÃO',
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
              style: FilledButton.styleFrom(
                backgroundColor: rosa,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Suas anotações ficam salvas no dispositivo.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: rosaEscuro.withValues(alpha: 0.65),
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
