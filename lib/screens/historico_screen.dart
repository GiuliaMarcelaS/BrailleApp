import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:braille_app/models/historico_list.dart';
import 'package:braille_app/models/auth.dart';

class HistoricoScreen extends StatelessWidget {
  const HistoricoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Obtemos o token e o userId do Auth Provider
    final auth = Provider.of<Auth>(context, listen: false);
    final historicoList = Provider.of<HistoricoList>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Histórico de Tradução'),
      ),
      body: FutureBuilder(
        future: historicoList.carregaHistorico(auth.token!, auth.userId!),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('Erro ao carregar o histórico.'),
            );
          } else if (historicoList.items.isEmpty) {
            return const Center(
              child: Text('Nenhum histórico encontrado.'),
            );
          } else {
            return ListView.builder(
              itemCount: historicoList.items.length,
              itemBuilder: (ctx, index) {
                final item = historicoList.items[index];
                return ListTile(
                  leading: const Icon(Icons.history),
                  title: Text(item.textoPortugues),
                  subtitle: Text('Braille: ${item.textoBraille}'),
                  trailing: Text(item.data),
                );
              },
            );
          }
        },
      ),
    );
  }
}
