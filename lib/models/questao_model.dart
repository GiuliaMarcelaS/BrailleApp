class QuestaoModel {
  final String id;
  final String enunciado;
  final List<String> opcoes;
  final List<int>? corretas; // Agora é opcional
  final Map<String, String>? caracteres; // Agora é opcional

  QuestaoModel({
    required this.id,
    required this.enunciado,
    required this.opcoes,
    this.corretas, // Não obrigatório
    this.caracteres, // Não obrigatório
  });

  factory QuestaoModel.fromMap(Map<String, dynamic> data, String id) {
    return QuestaoModel(
      id: id,
      enunciado: data['enunciado'],
      opcoes: List<String>.from(data['opcoes']),
      corretas: data['corretas'] != null
          ? List<int>.from(data['corretas'])
          : null, // Verifica se "corretas" existe
      caracteres: data['caracteres'] != null
          ? Map<String, String>.from(data['caracteres'])
          : null, // Verifica se "caracteres" existe
    );
  }
}
