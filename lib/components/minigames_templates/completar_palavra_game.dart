import 'package:flutter/material.dart';
import 'package:braille_app/models/questao_model.dart';

class CompletarPalavraSimpleGame extends StatefulWidget {
  final QuestaoModel questao;
  final void Function(bool acerto) onSubmit;

  const CompletarPalavraSimpleGame({
    Key? key,
    required this.questao,
    required this.onSubmit,
  }) : super(key: key);

  @override
  State<CompletarPalavraSimpleGame> createState() =>
      _CompletarPalavraSimpleGameState();
}

class _CompletarPalavraSimpleGameState
    extends State<CompletarPalavraSimpleGame> {
  late List<String?> _respostas;
  int _indiceSelecao = 0;

  @override
  void initState() {
    super.initState();
    // Inicializa com null para cada lacuna
    _respostas = List.filled(
      widget.questao.ordemCorreta?.length ?? 0,
      null,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Imagem
        if (widget.questao.imagemUrl != null)
          Container(
            height: 150,
            margin: const EdgeInsets.only(bottom: 20),
            child: Image.network(widget.questao.imagemUrl!),
          ),

        // Palavra com lacunas
        _buildPalavraComLacunas(),

        const SizedBox(height: 30),

        // Instrução
        Text(
          "Clique nos caracteres na ordem correta:",
          style: TextStyle(fontSize: 16, color: Colors.grey[600]),
        ),

        const SizedBox(height: 10),

        // Caracteres Braille para seleção
        _buildOpcoesBraille(),

        const SizedBox(height: 20),

        // Botões de ação: Apagar e Verificar
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: const Icon(Icons.backspace),
              tooltip: 'Apagar último',
              onPressed: _indiceSelecao > 0 ? _apagarUltimo : null,
            ),
            const SizedBox(width: 20),
           Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: ElevatedButton(
                onPressed:_verificarResposta,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green.shade700,
                  foregroundColor: Colors.white,
                  elevation: 4,
                  shadowColor: Colors.black54,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                ),
                child: const Center(
                  child: Text(
                    'Continuar',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),  
          ],
        ),
      ],
    );
  }

  Widget _buildPalavraComLacunas() {
    final dica = widget.questao.dica ?? '';
    final lacunas = widget.questao.posicoesLacunas ?? [];

    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 8,
      children: List.generate(dica.length, (index) {
        final isLacuna = lacunas.contains(index);
        final respostaIndex = isLacuna ? lacunas.indexOf(index) : null;
        final caractere = isLacuna ? _respostas[respostaIndex!] : dica[index];

        return GestureDetector(
          onTap: isLacuna && caractere != null
              ? () => _clearFromIndex(respostaIndex!)
              : null,
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              border: Border.all(
                color: isLacuna ? Colors.blue : Colors.transparent,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              caractere ?? '_',
              style: const TextStyle(fontSize: 32),
            ),
          ),
        );
      }),
    );
  }

  Widget _buildOpcoesBraille() {
    return Wrap(
      spacing: 12,
      children: (widget.questao.opcoes ?? []).map((opcao) {
        final jaUsada = _respostas.contains(opcao);

        return GestureDetector(
          onTap: jaUsada ? null : () => _selecionarCaractere(opcao),
          child: Opacity(
            opacity: jaUsada ? 0.5 : 1.0,
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: jaUsada ? Colors.grey[200] : Colors.blue[50],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                opcao,
                style: const TextStyle(fontSize: 32),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  void _selecionarCaractere(String caractere) {
    if (_indiceSelecao < _respostas.length) {
      setState(() {
        _respostas[_indiceSelecao] = caractere;
        _indiceSelecao++;
      });
    }
  }

  void _apagarUltimo() {
    setState(() {
      _indiceSelecao--;
      _respostas[_indiceSelecao] = null;
    });
  }

  void _clearFromIndex(int startIndex) {
    setState(() {
      for (int i = startIndex; i < _respostas.length; i++) {
        _respostas[i] = null;
      }
      _indiceSelecao = startIndex;
    });
  }

  void _verificarResposta() {
    if (_indiceSelecao < _respostas.length) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Selecione todos os caracteres primeiro!")),
      );
      return;
    }

    final acerto = _verificarOrdemCorreta();
    widget.onSubmit(acerto);
  }

  bool _verificarOrdemCorreta() {
    final ordemCorreta = widget.questao.ordemCorreta ?? [];
    final opcoes = widget.questao.opcoes ?? [];

    for (int i = 0; i < ordemCorreta.length; i++) {
      if (_respostas[i] != opcoes[ordemCorreta[i]]) {
        return false;
      }
    }
    return true;
  }
}
